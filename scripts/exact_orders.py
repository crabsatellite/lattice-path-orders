#!/usr/bin/env python3
"""Exact enumerator for Schiffler's matching and Lagrange path orders.

Only Python integers and fractions are used.  The square of a Lagrange value is
stored as a Fraction; no floating-point comparison enters a level or cover.
"""

from __future__ import annotations

import argparse
import json
import math
from collections import defaultdict
from fractions import Fraction
from pathlib import Path
from typing import Iterable, Iterator, Sequence

Matrix = tuple[int, int, int, int]
IDENTITY: Matrix = (1, 0, 0, 1)


def mat_mul(x: Matrix, y: Matrix) -> Matrix:
    a, b, c, d = x
    e, f, g, h = y
    return (a * e + b * g, a * f + b * h,
            c * e + d * g, c * f + d * h)


def t_matrix(value: int) -> Matrix:
    return (value, 1, 1, 0)


def path_word(path: Sequence[int]) -> tuple[int, ...]:
    """Return A(omega), using 1=R and 0=U."""
    out: list[int] = []
    for left, right in zip(path, path[1:]):
        if left == right:
            out.extend((1, 1))
        else:
            out.append(2)
    return tuple(out)


def matrix_product(word: Sequence[int]) -> Matrix:
    result = IDENTITY
    for value in word:
        result = mat_mul(result, t_matrix(value))
    return result


def matching_number(path: Sequence[int]) -> int:
    word = path_word(path)
    if not word:
        return 1
    return matrix_product(word)[0]


def cyclic_products(word: Sequence[int]) -> Iterator[Matrix]:
    """Yield products for all cyclic shifts in O(len(word)) matrix products."""
    n = len(word)
    prefix = [IDENTITY]
    for value in word:
        prefix.append(mat_mul(prefix[-1], t_matrix(value)))
    suffix = [IDENTITY] * (n + 1)
    for index in range(n - 1, -1, -1):
        suffix[index] = mat_mul(t_matrix(word[index]), suffix[index + 1])
    for index in range(n):
        yield mat_mul(suffix[index], prefix[index])


def lagrange_square(path: Sequence[int]) -> Fraction:
    cyclic_word = (2,) + path_word(path)
    full = matrix_product(cyclic_word)
    p, r, q, s = full
    discriminant = (p - s) ** 2 + 4 * r * q
    min_q = min(product[2] for product in cyclic_products(cyclic_word))
    return Fraction(discriminant, min_q * min_q)


def enumerate_paths(a: int, b: int) -> Iterator[tuple[int, ...]]:
    """Enumerate D(a,b) in lexicographic word order, with 1=R and 0=U."""
    if not (a > b > 0):
        raise ValueError("require a > b > 0")
    if math.gcd(a, b) != 1:
        raise ValueError("the source family requires gcd(a,b)=1")

    def visit(r_count: int, u_count: int, word: list[int]) -> Iterator[tuple[int, ...]]:
        if r_count == a and u_count == b:
            yield tuple(word)
            return
        if r_count < a:
            word.append(1)
            yield from visit(r_count + 1, u_count, word)
            word.pop()
        if u_count < b and a * (u_count + 1) <= b * r_count:
            word.append(0)
            yield from visit(r_count, u_count + 1, word)
            word.pop()

    yield from visit(0, 0, [])


def score_levels(scores: dict[tuple[int, ...], object]) -> list[list[tuple[int, ...]]]:
    groups: dict[object, list[tuple[int, ...]]] = defaultdict(list)
    for path, score in scores.items():
        groups[score].append(path)
    return [groups[score] for score in sorted(groups)]


def cover_pairs(levels: Sequence[Sequence[tuple[int, ...]]]) -> Iterator[tuple[tuple[int, ...], tuple[int, ...]]]:
    for lower, upper in zip(levels, levels[1:]):
        for path in lower:
            for other in upper:
                yield path, other


def path_text(path: Sequence[int]) -> str:
    return "".join("R" if step else "U" for step in path)


def source_regression_checks() -> None:
    first = tuple(1 if c == "R" else 0 for c in "RRRRUURRRUURU")
    second = tuple(1 if c == "R" else 0 for c in "RRRRURUURRRUU")
    assert matching_number(first) == 49396
    assert matching_number(second) == 46900
    assert lagrange_square(first) == lagrange_square(second)

    third = tuple(1 if c == "R" else 0 for c in "RRURURRURRUUU")
    fourth = tuple(1 if c == "R" else 0 for c in "RRRURURRUURUU")
    assert matching_number(third) == 40199
    assert matching_number(fourth) == 40199
    assert lagrange_square(third) == Fraction(16530502037, 40189 ** 2)
    # The source prints 40547, but the unshifted cyclic product has q=40199,
    # which is smaller and therefore gives the literal maximum in Remark 4.4.
    assert lagrange_square(fourth) == Fraction(16545934157, 40199 ** 2)


def analyze(a: int, b: int, include_pairs: bool = False) -> dict[str, object]:
    paths = list(enumerate_paths(a, b))
    m_scores = {path: matching_number(path) for path in paths}
    l_scores = {path: lagrange_square(path) for path in paths}
    m_levels = score_levels(m_scores)
    l_levels = score_levels(l_scores)
    m_rank = {path: rank for rank, level in enumerate(m_levels) for path in level}
    l_rank = {path: rank for rank, level in enumerate(l_levels) for path in level}

    m_covers = list(cover_pairs(m_levels))
    l_covers = list(cover_pairs(l_levels))
    m_set = set(m_covers)
    l_set = set(l_covers)

    result: dict[str, object] = {
        "a": a,
        "b": b,
        "path_count": len(paths),
        "matching_level_count": len(m_levels),
        "lagrange_level_count": len(l_levels),
        "matching_tie_profile": sorted((len(level) for level in m_levels), reverse=True)[:20],
        "lagrange_tie_profile": sorted((len(level) for level in l_levels), reverse=True)[:20],
        "matching_cover_count": len(m_covers),
        "lagrange_cover_count": len(l_covers),
        "common_cover_count": len(m_set & l_set),
        "matching_only_cover_count": len(m_set - l_set),
        "lagrange_only_cover_count": len(l_set - m_set),
        "opposite_orientation_count": sum((upper, lower) in l_set for lower, upper in m_set),
        "matching_min_paths": [path_text(path) for path in m_levels[0]],
        "matching_max_paths": [path_text(path) for path in m_levels[-1]],
        "lagrange_min_paths": [path_text(path) for path in l_levels[0]],
        "lagrange_max_paths": [path_text(path) for path in l_levels[-1]],
        "rank_agreement_count": sum(m_rank[path] == l_rank[path] for path in paths),
    }
    if include_pairs:
        result["matching_covers"] = [[path_text(x), path_text(y)] for x, y in m_covers]
        result["lagrange_covers"] = [[path_text(x), path_text(y)] for x, y in l_covers]
    return result


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--a", type=int, required=True)
    parser.add_argument("--b", type=int)
    parser.add_argument("--include-pairs", action="store_true")
    parser.add_argument("--output", type=Path)
    args = parser.parse_args()
    b = args.b if args.b is not None else args.a - 1
    source_regression_checks()
    result = analyze(args.a, b, args.include_pairs)
    text = json.dumps(result, indent=2, sort_keys=True)
    if args.output:
        args.output.parent.mkdir(parents=True, exist_ok=True)
        args.output.write_text(text + "\n", encoding="utf-8")
    else:
        print(text)


if __name__ == "__main__":
    main()
