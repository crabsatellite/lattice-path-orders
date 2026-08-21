#!/usr/bin/env python3
"""Independent exhaustive check of the Pell subset expansion for M."""

from __future__ import annotations

import argparse
import math


def pell_values(limit: int) -> dict[int, int]:
    values = {-1: 1, 0: 0, 1: 1}
    for index in range(2, limit + 1):
        values[index] = 2 * values[index - 1] + values[index - 2]
    return values


def multiply(x: tuple[int, int, int, int],
             y: tuple[int, int, int, int]) -> tuple[int, int, int, int]:
    a, b, c, d = x
    e, f, g, h = y
    return (a * e + b * g, a * f + b * h,
            c * e + d * g, c * f + d * h)


def direct_score(path: tuple[int, ...]) -> int:
    result = (1, 0, 0, 1)
    for left, right in zip(path, path[1:]):
        block = (2, 1, 1, 1) if left == right else (2, 1, 1, 0)
        result = multiply(result, block)
    return result[0]


def expanded_score(path: tuple[int, ...]) -> int:
    m = len(path) - 1
    pell = pell_values(m + 1)
    internal = [index for index in range(1, m - 1)
                if path[index] == path[index + 1]]
    # ``ending[index]`` is the sum of all subset weights up to the final
    # factor, for nonempty selected subsets whose last position is ``index``.
    # This is exactly the displayed subset sum, grouped by its final element.
    ending: dict[int, int] = {}
    for index in internal:
        ending[index] = pell[index] + sum(
            ending[previous] * pell[index - previous - 2]
            for previous in internal if previous < index
        )
    return pell[m + 1] + sum(
        value * pell[m - 1 - index] for index, value in ending.items()
    )


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


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--max-n", type=int, default=12)
    args = parser.parse_args()
    path_count = 0
    for n in range(2, args.max_n + 1):
        assert math.gcd(n, n - 1) == 1
        endpoint_count = 0
        for path in enumerate_paths(n, n - 1):
            assert path[0] == path[1] == 1
            assert direct_score(path) == expanded_score(path)
            endpoint_count += 1
        path_count += endpoint_count
        print(f"D({n},{n-1}): {endpoint_count} paths")
    print(f"verified {path_count} paths through n={args.max_n}")


if __name__ == "__main__":
    main()
