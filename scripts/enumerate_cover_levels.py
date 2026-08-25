#!/usr/bin/env python3
"""Exact best-first enumeration of all matching or Lagrange cover levels.

The frontier consists of rational-Dyck path prefixes.  Every internal node is
keyed by a proved lower bound for every completion; every leaf is keyed by its
literal exact score.  Consequently leaves are emitted in nondecreasing score
order and consecutive distinct batches are exactly the Hasse levels.
"""

from __future__ import annotations

import argparse
import heapq
import json
from dataclasses import dataclass
from fractions import Fraction
from pathlib import Path
from typing import Iterator

Matrix = tuple[int, int, int, int]
IDENTITY: Matrix = (1, 0, 0, 1)
D: Matrix = (2, 1, 1, 0)
E: Matrix = (2, 1, 1, 1)


def multiply(x: Matrix, y: Matrix) -> Matrix:
    a, b, c, d = x
    e, f, g, h = y
    return (a * e + b * g, a * f + b * h,
            c * e + d * g, c * f + d * h)


def power(matrix: Matrix, exponent: int) -> Matrix:
    result = IDENTITY
    base = matrix
    while exponent:
        if exponent & 1:
            result = multiply(result, base)
        base = multiply(base, base)
        exponent >>= 1
    return result


def fibonacci(index: int) -> int:
    previous, current = 0, 1
    for _ in range(index):
        previous, current = current, previous + current
    return previous


def digit(value: int) -> Matrix:
    return (value, 1, 1, 0)


def path_text(path: tuple[int, ...]) -> str:
    return "".join("R" if step else "U" for step in path)


def coefficient_word(path: tuple[int, ...]) -> tuple[int, ...]:
    result: list[int] = []
    for left, right in zip(path, path[1:]):
        result.extend((1, 1) if left == right else (2,))
    return tuple(result)


def product(word: tuple[int, ...]) -> Matrix:
    result = IDENTITY
    for value in word:
        result = multiply(result, digit(value))
    return result


def exact_lagrange_square(path: tuple[int, ...]) -> Fraction:
    word = (2,) + coefficient_word(path)
    full = product(word)
    trace = full[0] + full[3]
    discriminant = trace * trace - 4
    q_min: int | None = None
    for index in range(len(word)):
        shifted = word[index:] + word[:index]
        q = product(shifted)[2]
        q_min = q if q_min is None else min(q_min, q)
    assert q_min is not None and q_min > 0
    return Fraction(discriminant, q_min * q_min)


@dataclass(frozen=True)
class State:
    path: tuple[int, ...]
    r_count: int
    u_count: int
    adjacency_product: Matrix


class BestFirstLevels:
    def __init__(self, a: int, b: int, order: str):
        if not (a > b > 0):
            raise ValueError("require a>b>0")
        self.a = a
        self.b = b
        self.total = a + b
        self.order = order
        self._serial = 0
        self._d_powers = [power(D, exponent) for exponent in range(self.total)]
        self._e_powers = [power(E, exponent) for exponent in range(self.total)]

    def is_leaf(self, state: State) -> bool:
        return len(state.path) == self.total

    def matching_bound(self, state: State) -> Fraction:
        remaining_blocks = self.total - len(state.path)
        completion = multiply(
            state.adjacency_product, self._d_powers[remaining_blocks]
        )
        return Fraction(completion[0], 1)

    def lagrange_bound(self, state: State) -> Fraction:
        remaining_blocks = self.total - len(state.path)
        cyclic_prefix = multiply(D, state.adjacency_product)
        trace_lower_matrix = multiply(
            cyclic_prefix, self._d_powers[remaining_blocks]
        )
        denominator_upper_matrix = multiply(
            cyclic_prefix, self._e_powers[remaining_blocks]
        )
        trace_lower = trace_lower_matrix[0] + trace_lower_matrix[3]
        numerator_lower = max(0, trace_lower * trace_lower - 4)
        q_upper = denominator_upper_matrix[2]
        assert q_upper > 0
        return Fraction(numerator_lower, q_upper * q_upper)

    def exact_score(self, state: State) -> Fraction:
        if self.order == "matching":
            return Fraction(state.adjacency_product[0], 1)
        return exact_lagrange_square(state.path)

    def key(self, state: State) -> Fraction:
        if self.is_leaf(state):
            return self.exact_score(state)
        if self.order == "matching":
            return self.matching_bound(state)
        return self.lagrange_bound(state)

    def upper_bound(self, state: State) -> Fraction:
        if self.is_leaf(state):
            return self.exact_score(state)
        remaining_blocks = self.total - len(state.path)
        if self.order == "matching":
            completion = multiply(
                state.adjacency_product, self._e_powers[remaining_blocks]
            )
            return Fraction(completion[0], 1)

        cyclic_prefix = multiply(D, state.adjacency_product)
        trace_upper_matrix = multiply(
            cyclic_prefix, self._e_powers[remaining_blocks]
        )
        trace_upper = trace_upper_matrix[0] + trace_upper_matrix[3]
        known_equalities = sum(
            left == right for left, right in zip(state.path, state.path[1:])
        )
        # The completed coefficient word has at least ``total`` digits, plus
        # one extra digit for every already-known equal adjacency.  At any
        # cyclic cut, q is a continuant of all remaining digits and is at least
        # the all-ones value F_length.
        q_lower = fibonacci(self.total + known_equalities)
        assert q_lower > 0
        return Fraction(max(0, trace_upper * trace_upper - 4), q_lower * q_lower)

    def push(self, heap: list[tuple[Fraction, int, int, State]], state: State) -> None:
        # At an equal key, expand internal nodes before accepting leaves.  This
        # makes equality batches complete even when a bound is attained.
        kind = 1 if self.is_leaf(state) else 0
        heapq.heappush(heap, (self.key(state), kind, self._serial, state))
        self._serial += 1

    def children(self, state: State) -> Iterator[State]:
        last = state.path[-1]
        if state.r_count < self.a:
            block = E if last == 1 else D
            yield State(
                state.path + (1,), state.r_count + 1, state.u_count,
                multiply(state.adjacency_product, block),
            )
        if (state.u_count < self.b
                and self.a * (state.u_count + 1) <= self.b * state.r_count):
            block = E if last == 0 else D
            yield State(
                state.path + (0,), state.r_count, state.u_count + 1,
                multiply(state.adjacency_product, block),
            )

    def levels(self) -> Iterator[dict[str, object]]:
        heap: list[tuple[Fraction, int, int, State]] = []
        self.push(heap, State((1,), 1, 0, IDENTITY))
        current_score: Fraction | None = None
        current_paths: list[str] = []
        expanded_prefixes = 0
        emitted_paths = 0

        while heap:
            key, kind, _, state = heapq.heappop(heap)
            if kind == 0:
                expanded_prefixes += 1
                for child in self.children(state):
                    child_key = self.key(child)
                    if self.is_leaf(child):
                        # The internal-node key is an admissible lower bound.
                        parent_bound = (self.matching_bound(state)
                                        if self.order == "matching"
                                        else self.lagrange_bound(state))
                        assert parent_bound <= child_key
                    self.push(heap, child)
                continue

            score = key
            emitted_paths += 1
            if current_score is None:
                current_score = score
            if score != current_score:
                assert score > current_score
                yield {
                    "score_numerator": current_score.numerator,
                    "score_denominator": current_score.denominator,
                    "paths": current_paths,
                    "expanded_prefixes_at_close": expanded_prefixes,
                    "emitted_paths_at_close": emitted_paths - 1,
                }
                current_score = score
                current_paths = []
            current_paths.append(path_text(state.path))

        if current_score is not None:
            yield {
                "score_numerator": current_score.numerator,
                "score_denominator": current_score.denominator,
                "paths": current_paths,
                "expanded_prefixes_at_close": expanded_prefixes,
                "emitted_paths_at_close": emitted_paths,
            }


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--a", type=int, required=True)
    parser.add_argument("--b", type=int, required=True)
    parser.add_argument("--order", choices=("matching", "lagrange"), required=True)
    parser.add_argument("--max-levels", type=int)
    parser.add_argument("--output", type=Path)
    args = parser.parse_args()

    enumerator = BestFirstLevels(args.a, args.b, args.order)
    levels = []
    for index, level in enumerate(enumerator.levels()):
        if args.max_levels is not None and index >= args.max_levels:
            break
        level["rank"] = index
        levels.append(level)
    result = {
        "claim_status": "exact constructive cover-level characterization",
        "a": args.a,
        "b": args.b,
        "order": args.order,
        "level_count_emitted": len(levels),
        "levels": levels,
    }
    text = json.dumps(result, indent=2, sort_keys=True)
    if args.output:
        args.output.parent.mkdir(parents=True, exist_ok=True)
        args.output.write_text(text + "\n", encoding="utf-8")
    else:
        print(text)


if __name__ == "__main__":
    main()
