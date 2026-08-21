#!/usr/bin/env python3
"""Executable identity audit for the uniform nonlocal-cover proof.

This script is not the proof.  It independently checks the displayed matrix
expansion, Pell identities, extremal lemma, and interval split over a requested
range of n.
"""

from __future__ import annotations

import argparse
import json
from functools import cache
from pathlib import Path


Matrix = tuple[tuple[int, int], tuple[int, int]]
D: Matrix = ((2, 1), (1, 0))
E: Matrix = ((2, 1), (1, 1))
IDENTITY: Matrix = ((1, 0), (0, 1))


def multiply(left: Matrix, right: Matrix) -> Matrix:
    return (
        (
            left[0][0] * right[0][0] + left[0][1] * right[1][0],
            left[0][0] * right[0][1] + left[0][1] * right[1][1],
        ),
        (
            left[1][0] * right[0][0] + left[1][1] * right[1][0],
            left[1][0] * right[0][1] + left[1][1] * right[1][1],
        ),
    )


def product(blocks: list[Matrix]) -> Matrix:
    value = IDENTITY
    for block in blocks:
        value = multiply(value, block)
    return value


@cache
def pell(index: int) -> int:
    if index == -1:
        return 1
    if index < -1:
        return (-1) ** (-index + 1) * pell(-index)
    previous, current = 0, 1
    for _ in range(index):
        previous, current = current, 2 * current + previous
    return previous


def expanded_score(m: int, i: int, j: int) -> int:
    n_axis = m - 1
    f_i = pell(i) * pell(n_axis - i)
    f_j = pell(j) * pell(n_axis - j)
    interaction = pell(i) * pell(j - i - 2) * pell(m - 1 - j)
    return pell(m + 1) + f_i + f_j + interaction


def direct_score(m: int, i: int, j: int) -> int:
    positions = {0, i, j}
    return product([E if k in positions else D for k in range(m)])[0][0]


def steps_from_equal_positions(m: int, positions: set[int]) -> tuple[int, ...]:
    steps = [1]
    for index in range(m):
        steps.append(steps[-1] if index in positions else 1 - steps[-1])
    return tuple(steps)


def is_dyck(steps: tuple[int, ...], n: int) -> bool:
    right = up = 0
    for step in steps:
        right += step
        up += 1 - step
        if n * up > (n - 1) * right:
            return False
    return right == n and up == n - 1


def audit_n(n: int) -> dict[str, int]:
    m = 2 * n - 2
    n_axis = m - 1
    f = lambda k: pell(k) * pell(n_axis - k)

    for k in range(1, n_axis):
        assert f(k) <= f(1)
        assert f(k) >= f(2)
        if k not in (2, n_axis - 2):
            assert f(k) >= f(4)
    for k in range(1, n_axis - 1):
        assert f(k + 2) - f(k) == 2 * (-1) ** k * pell(n_axis - 2 * k - 2)
        assert f(k) - f(k + 1) == (-1) ** (k + 1) * pell(n_axis - 2 * k - 1)

    lower = pell(m + 1) + f(1)
    upper = pell(m + 1) + f(2) + f(4)
    assert upper - lower == 12 * pell(m - 5) - pell(m - 4) > 0

    last_e_max = max(expanded_score(m, i, m - 1) for i in range(1, m - 1))
    no_last_min = min(
        expanded_score(m, i, j)
        for i in range(1, m - 2)
        for j in range(i + 1, m - 1)
    )
    assert last_e_max == lower
    assert no_last_min == upper
    equality_pairs = {
        (i, j)
        for i in range(1, m - 2)
        for j in range(i + 1, m - 1)
        if expanded_score(m, i, j) == upper
    }
    assert equality_pairs == {(2, 4), (m - 5, m - 3)}
    assert not is_dyck(steps_from_equal_positions(m, {0, 2, 4}), n)
    assert is_dyck(steps_from_equal_positions(m, {0, m - 5, m - 3}), n)

    terminal_scores = []
    for i in range(1, m - 2, 2):
        steps = steps_from_equal_positions(m, {0, i, m - 1})
        assert is_dyck(steps, n)
        terminal_scores.append(expanded_score(m, i, m - 1))
    assert len(terminal_scores) == n - 2
    assert all(left > right for left, right in zip(terminal_scores, terminal_scores[1:]))
    assert terminal_scores[0] == lower

    for i in range(1, m - 1):
        for j in range(i + 1, m):
            assert expanded_score(m, i, j) == direct_score(m, i, j)

    return {
        "n": n,
        "m": m,
        "matching_x": lower,
        "matching_y": upper,
        "hamming_distance": 2 * n - 6,
        "last_e_max": last_e_max,
        "no_last_min": no_last_min,
    }


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--max-n", type=int, default=30)
    parser.add_argument("--output", type=Path)
    args = parser.parse_args()
    if args.max_n < 4:
        raise ValueError("--max-n must be at least 4")
    result = {
        "claim_status": "executable audit of a separate uniform proof",
        "rows": [audit_n(n) for n in range(4, args.max_n + 1)],
    }
    text = json.dumps(result, indent=2, sort_keys=True)
    if args.output:
        args.output.parent.mkdir(parents=True, exist_ok=True)
        args.output.write_text(text + "\n", encoding="utf-8")
    else:
        print(text)


if __name__ == "__main__":
    main()
