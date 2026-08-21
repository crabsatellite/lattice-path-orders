#!/usr/bin/env python3
"""Independent comparison of best-first levels with exhaustive exact sorting."""

from __future__ import annotations

import argparse
from collections import defaultdict
from fractions import Fraction

import enumerate_cover_levels as bf


def convergent(word: tuple[int, ...]) -> tuple[int, int, int, int]:
    """Independent continuant recurrence, not the enumerator's matrices."""
    p_old, p = 0, 1
    q_old, q = 1, 0
    for value in word:
        p_old, p = p, value * p + p_old
        q_old, q = q, value * q + q_old
    return p, p_old, q, q_old


def independent_matching(path: tuple[int, ...]) -> Fraction:
    return Fraction(convergent(bf.coefficient_word(path))[0], 1)


def independent_lagrange_square(path: tuple[int, ...]) -> Fraction:
    word = (2,) + bf.coefficient_word(path)
    discriminants: set[int] = set()
    denominators: list[int] = []
    for index in range(len(word)):
        shift = word[index:] + word[:index]
        p, r, q, s = convergent(shift)
        discriminants.add((p - s) ** 2 + 4 * r * q)
        denominators.append(q)
    assert len(discriminants) == 1
    return Fraction(discriminants.pop(), min(denominators) ** 2)


def enumerate_paths(a: int, b: int):
    def visit(r_count: int, u_count: int, word: list[int]):
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


def exhaustive_levels(a: int, b: int, order: str):
    grouped: dict[Fraction, list[str]] = defaultdict(list)
    for path in enumerate_paths(a, b):
        score = (independent_matching(path) if order == "matching"
                 else independent_lagrange_square(path))
        grouped[score].append(bf.path_text(path))
    return [(score, sorted(grouped[score])) for score in sorted(grouped)]


def generated_levels(a: int, b: int, order: str):
    result = []
    for level in bf.BestFirstLevels(a, b, order).levels():
        score = Fraction(level["score_numerator"], level["score_denominator"])
        result.append((score, sorted(level["paths"])))
    return result


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--max-total", type=int, default=15)
    args = parser.parse_args()
    endpoint_count = 0
    path_count = 0
    prefix_incidence_count = 0
    for total in range(3, args.max_total + 1):
        for a in range(total // 2 + 1, total):
            b = total - a
            import math
            if math.gcd(a, b) != 1:
                continue
            expected_path_count = len(list(enumerate_paths(a, b)))
            for order in ("matching", "lagrange"):
                expected = exhaustive_levels(a, b, order)
                actual = generated_levels(a, b, order)
                assert actual == expected, (a, b, order)
                enumerator = bf.BestFirstLevels(a, b, order)
                for path in enumerate_paths(a, b):
                    score = (independent_matching(path) if order == "matching"
                             else independent_lagrange_square(path))
                    state = bf.State((1,), 1, 0, bf.IDENTITY)
                    for step in path[1:]:
                        block = bf.E if step == state.path[-1] else bf.D
                        state = bf.State(
                            state.path + (step,),
                            state.r_count + int(step == 1),
                            state.u_count + int(step == 0),
                            bf.multiply(state.adjacency_product, block),
                        )
                        if not enumerator.is_leaf(state):
                            bound = (enumerator.matching_bound(state)
                                     if order == "matching"
                                     else enumerator.lagrange_bound(state))
                            assert bound <= score, (a, b, order, path, state.path)
                            upper_bound = enumerator.upper_bound(state)
                            assert score <= upper_bound, (
                                a, b, order, path, state.path, score, upper_bound
                            )
                            prefix_incidence_count += 1
            endpoint_count += 1
            path_count += expected_path_count
            print(f"D({a},{b}): {expected_path_count} paths, both orders exact")
    print(f"verified {endpoint_count} endpoints, {path_count} paths, "
          f"and {prefix_incidence_count} two-sided path-prefix bound incidences")


if __name__ == "__main__":
    main()
