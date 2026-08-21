#!/usr/bin/env python3
"""Compare the raw Definition 4.1 graphs with the dihedral turn normal form.

This is an adversarial low-order audit, not a proof dependency.  It constructs
the literal unlabelled graphs independently of the Lean normal form and asks
NetworkX for graph isomorphisms, so exceptional small tile strips cannot hide
behind the coefficient-word classification used by the searcher.
"""

from __future__ import annotations

import argparse
from itertools import combinations
from math import gcd

import networkx as nx

from verify_problem_6_3 import band_graph


def paths(a: int, b: int) -> list[str]:
    result: list[str] = []
    total = a + b
    for up_positions in combinations(range(total), b):
        up = set(up_positions)
        word = "".join("U" if index in up else "R" for index in range(total))
        rights = ups = 0
        valid = True
        for step in word:
            rights += step == "R"
            ups += step == "U"
            if a * ups > b * rights:
                valid = False
                break
        if valid:
            result.append(word)
    return result


def rotations(word: tuple[bool, ...]):
    for index in range(len(word)):
        yield word[index:] + word[:index]


def turn_key(path: str) -> tuple[bool, ...]:
    turns = tuple(
        path[index] == path[(index + 1) % len(path)]
        for index in range(len(path))
    )
    return min(*rotations(turns), *rotations(turns[::-1]))


def graph(path: str) -> nx.Graph:
    result = nx.Graph()
    result.add_edges_from(band_graph(path))
    return result


def audit_endpoint(a: int, b: int) -> tuple[int, int]:
    carrier = paths(a, b)
    records = [(path, turn_key(path), graph(path)) for path in carrier]
    comparisons = 0
    for left_index, (left_path, left_key, left_graph) in enumerate(records):
        for right_path, right_key, right_graph in records[left_index + 1:]:
            comparisons += 1
            raw_iso = nx.is_isomorphic(left_graph, right_graph)
            code_iso = left_key == right_key
            if raw_iso != code_iso:
                raise AssertionError(
                    f"D({a},{b}) mismatch: {left_path}, {right_path}; "
                    f"raw_iso={raw_iso}, code_iso={code_iso}"
                )
    return len(carrier), comparisons


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--max-total", type=int, default=14)
    args = parser.parse_args()
    endpoints = paths_checked = comparisons = 0
    for total in range(3, args.max_total + 1):
        for b in range(1, (total - 1) // 2 + 1):
            a = total - b
            if gcd(a, b) != 1:
                continue
            count, pair_count = audit_endpoint(a, b)
            endpoints += 1
            paths_checked += count
            comparisons += pair_count
            print(f"D({a},{b}): {count} paths, {pair_count} pairs")
    print(
        "band graph isomorphism audit passed: "
        f"{endpoints} endpoints, {paths_checked} paths, {comparisons} pairs"
    )


if __name__ == "__main__":
    main()
