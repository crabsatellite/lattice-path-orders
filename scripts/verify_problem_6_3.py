#!/usr/bin/env python3
"""Standalone exact certificate for the minimal Problem 6.3 counterexample.

This deliberately imports nothing from ``exact_orders.py`` or from the C++
searcher.  It checks the source definitions directly with Python integers.
"""

from __future__ import annotations

import argparse
import json
from collections import defaultdict
from fractions import Fraction
from math import gcd
from pathlib import Path

Matrix = tuple[int, int, int, int]
IDENTITY: Matrix = (1, 0, 0, 1)

FIRST = "RRRRRRURRURRUURURRURRRUURU"
SECOND = "RRRRRRURUURURRURRRURRURRUU"
EXPECTED_NUMERATOR = 401_364_347_302_339_644_605
EXPECTED_DENOMINATOR = 39_219_898_323_948_748_849


def multiply(x: Matrix, y: Matrix) -> Matrix:
    a, b, c, d = x
    e, f, g, h = y
    return (a * e + b * g, a * f + b * h,
            c * e + d * g, c * f + d * h)


def factor(value: int) -> Matrix:
    return (value, 1, 1, 0)


def product(word: tuple[int, ...]) -> Matrix:
    result = IDENTITY
    for value in word:
        result = multiply(result, factor(value))
    return result


def coefficient_word(path: str) -> tuple[int, ...]:
    word: list[int] = []
    for left, right in zip(path, path[1:]):
        word.extend((1, 1) if left == right else (2,))
    return tuple(word)


def is_path_in_d(path: str, a: int, b: int) -> bool:
    if len(path) != a + b or path.count("R") != a or path.count("U") != b:
        return False
    r_count = 0
    u_count = 0
    for step in path:
        r_count += step == "R"
        u_count += step == "U"
        if a * u_count > b * r_count:
            return False
    return True


def rotations(word: tuple[int, ...]):
    for index in range(len(word)):
        yield word[index:] + word[:index]


def dihedral_key(word: tuple[int, ...]) -> tuple[int, ...]:
    return min(*rotations(word), *rotations(word[::-1]))


def band_graph(path: str) -> set[tuple[int, int]]:
    """Construct the literal unlabelled band graph from Definition 4.1.

    Coordinates are scaled by four.  The path carries a half-unit tile at each
    edge midpoint and each internal lattice vertex, followed by the extra top
    tile.  Finally the first left edge is glued to the last right edge.
    """
    x = y = 0
    centers: list[tuple[int, int]] = []
    for index, step in enumerate(path):
        dx, dy = (4, 0) if step == "R" else (0, 4)
        centers.append((x + dx // 2, y + dy // 2))
        x += dx
        y += dy
        if index + 1 < len(path):
            centers.append((x, y))
    centers.append((centers[-1][0], centers[-1][1] + 2))

    raw_edges: list[tuple[tuple[int, int], tuple[int, int]]] = []
    for cx, cy in centers:
        vertices = ((cx - 1, cy - 1), (cx + 1, cy - 1),
                    (cx + 1, cy + 1), (cx - 1, cy + 1))
        raw_edges.extend((vertices[i], vertices[(i + 1) % 4]) for i in range(4))

    parent = {vertex: vertex for edge in raw_edges for vertex in edge}

    def find(vertex: tuple[int, int]) -> tuple[int, int]:
        while parent[vertex] != vertex:
            parent[vertex] = parent[parent[vertex]]
            vertex = parent[vertex]
        return vertex

    def union(left: tuple[int, int], right: tuple[int, int]) -> None:
        left = find(left)
        right = find(right)
        if left != right:
            parent[right] = left

    first = centers[0]
    last = centers[-1]
    union((first[0] - 1, first[1] - 1), (last[0] + 1, last[1] - 1))
    union((first[0] - 1, first[1] + 1), (last[0] + 1, last[1] + 1))

    coordinate_edges = {
        tuple(sorted((find(left), find(right)))) for left, right in raw_edges
    }
    vertices = sorted({vertex for edge in coordinate_edges for vertex in edge})
    label = {vertex: index for index, vertex in enumerate(vertices)}
    return {tuple(sorted((label[left], label[right])))
            for left, right in coordinate_edges}


def four_cycles(edges: set[tuple[int, int]]) -> list[frozenset[int]]:
    adjacency: dict[int, set[int]] = defaultdict(set)
    for left, right in edges:
        adjacency[left].add(right)
        adjacency[right].add(left)
    cycles: set[frozenset[int]] = set()
    vertices = sorted(adjacency)
    for left_index, left in enumerate(vertices):
        for right in vertices[left_index + 1:]:
            common = sorted(adjacency[left] & adjacency[right])
            for first_index, first in enumerate(common):
                for second in common[first_index + 1:]:
                    cycles.add(frozenset((left, right, first, second)))
    return sorted(cycles, key=lambda cycle: sorted(cycle))


def intrinsic_band_signature(edges: set[tuple[int, int]]) -> tuple[int, ...]:
    """Recover an isomorphism-invariant turn code from the abstract graph.

    For these band graphs the chordless four-cycles are exactly the tiles.  Their
    edge-intersection graph is a cycle.  At each tile we record whether the two
    edges shared with its neighbours are adjacent or opposite.  An abstract graph
    isomorphism can only rotate or reverse this cyclic bit word.
    """
    tiles = four_cycles(edges)
    edge_to_tiles: dict[tuple[int, int], list[int]] = defaultdict(list)
    for tile_index, tile in enumerate(tiles):
        for edge in edges:
            if edge[0] in tile and edge[1] in tile:
                edge_to_tiles[edge].append(tile_index)
    shared = {edge: indices for edge, indices in edge_to_tiles.items()
              if len(indices) == 2}
    tile_adjacency: dict[int, list[int]] = defaultdict(list)
    shared_edge: dict[frozenset[int], tuple[int, int]] = {}
    for edge, (left, right) in shared.items():
        tile_adjacency[left].append(right)
        tile_adjacency[right].append(left)
        shared_edge[frozenset((left, right))] = edge
    assert len(tiles) == 52
    assert len(shared) == 52
    assert all(len(tile_adjacency[index]) == 2 for index in range(len(tiles)))

    order = [0]
    previous: int | None = None
    current = 0
    while True:
        following = [item for item in tile_adjacency[current] if item != previous][0]
        if following == order[0]:
            break
        order.append(following)
        previous, current = current, following
    assert len(order) == len(tiles)

    code: list[int] = []
    for index, tile in enumerate(order):
        previous_tile = order[index - 1]
        next_tile = order[(index + 1) % len(order)]
        first_edge = shared_edge[frozenset((tile, previous_tile))]
        second_edge = shared_edge[frozenset((tile, next_tile))]
        code.append(int(bool(set(first_edge) & set(second_edge))))
    direct = tuple(code)
    return dihedral_key(direct)


def invariants(path: str) -> dict[str, object]:
    a_word = coefficient_word(path)
    c_word = (2,) + a_word
    full = product(c_word)
    trace = full[0] + full[3]
    determinant = (-1) ** len(c_word)
    discriminant = trace * trace - 4 * determinant
    lower_left = tuple(product(shift)[2] for shift in rotations(c_word))
    q_min = min(lower_left)
    return {
        "path": path,
        "A": list(a_word),
        "C": list(c_word),
        "C_length": len(c_word),
        "matching_number": product(a_word)[0],
        "cyclic_product": list(full),
        "trace": trace,
        "determinant": determinant,
        "discriminant": discriminant,
        "q_min": q_min,
        "minimizing_cuts": [index for index, value in enumerate(lower_left)
                            if value == q_min],
        "lagrange_square_numerator": discriminant,
        "lagrange_square_denominator": q_min * q_min,
        "dihedral_key": list(dihedral_key(c_word)),
    }


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--output", type=Path)
    args = parser.parse_args()

    assert gcd(17, 9) == 1
    assert is_path_in_d(FIRST, 17, 9)
    assert is_path_in_d(SECOND, 17, 9)
    first = invariants(FIRST)
    second = invariants(SECOND)

    # Equal literal Lagrange values (checked after exact rational reduction).
    first_square = Fraction(first["lagrange_square_numerator"],
                            first["lagrange_square_denominator"])
    second_square = Fraction(second["lagrange_square_numerator"],
                             second["lagrange_square_denominator"])
    expected_square = Fraction(EXPECTED_NUMERATOR, EXPECTED_DENOMINATOR)
    assert first_square == second_square == expected_square

    # The band coefficient words are neither cyclic rotations nor reversed
    # cyclic rotations, which is the literal dihedral band-isomorphism test.
    assert first["C_length"] == second["C_length"] == 38
    assert first["dihedral_key"] != second["dihedral_key"]

    # A second, graph-level nonisomorphism certificate does not assume the
    # coefficient-word classification.  It constructs both abstract graphs and
    # extracts a turn code using only their four-cycles and shared edges.
    first_graph = band_graph(FIRST)
    second_graph = band_graph(SECOND)
    first_signature = intrinsic_band_signature(first_graph)
    second_signature = intrinsic_band_signature(second_graph)
    assert len({vertex for edge in first_graph for vertex in edge}) == 104
    assert len(first_graph) == 156
    assert len({vertex for edge in second_graph for vertex in edge}) == 104
    assert len(second_graph) == 156
    assert first_signature != second_signature

    result = {
        "claim_status": "standalone exact counterexample certificate",
        "problem": "Schiffler Problem 6.3",
        "endpoint": {"a": 17, "b": 9},
        "lagrange_square": {
            "numerator": expected_square.numerator,
            "denominator": expected_square.denominator,
        },
        "band_graphs_isomorphic": False,
        "intrinsic_band_signatures": {
            "first": list(first_signature),
            "second": list(second_signature),
        },
        "first": first,
        "second": second,
    }
    text = json.dumps(result, indent=2, sort_keys=True)
    if args.output:
        args.output.parent.mkdir(parents=True, exist_ok=True)
        args.output.write_text(text + "\n", encoding="utf-8")
    else:
        print(text)


if __name__ == "__main__":
    main()
