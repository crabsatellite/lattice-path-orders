#!/usr/bin/env python3
"""Independent verifier for a prefix-antichain cover certificate JSON file."""

from __future__ import annotations

import argparse
import json
from fractions import Fraction
from pathlib import Path

Matrix = tuple[int, int, int, int]
I: Matrix = (1, 0, 0, 1)
D: Matrix = (2, 1, 1, 0)
E: Matrix = (2, 1, 1, 1)


def mul(x: Matrix, y: Matrix) -> Matrix:
    a, b, c, d = x
    e, f, g, h = y
    return (a * e + b * g, a * f + b * h,
            c * e + d * g, c * f + d * h)


def mat_power(x: Matrix, n: int) -> Matrix:
    result = I
    while n:
        if n & 1:
            result = mul(result, x)
        x = mul(x, x)
        n >>= 1
    return result


def fib(n: int) -> int:
    x, y = 0, 1
    for _ in range(n):
        x, y = y, x + y
    return x


def bits(text: str) -> tuple[int, ...]:
    assert text and all(letter in "RU" for letter in text)
    return tuple(letter == "R" for letter in text)


def adjacency_product(path: tuple[int, ...]) -> Matrix:
    result = I
    for left, right in zip(path, path[1:]):
        result = mul(result, E if left == right else D)
    return result


def digit_product(word: tuple[int, ...]) -> Matrix:
    result = I
    for value in word:
        result = mul(result, (value, 1, 1, 0))
    return result


def coefficient_word(path: tuple[int, ...]) -> tuple[int, ...]:
    word: list[int] = []
    for left, right in zip(path, path[1:]):
        word.extend((1, 1) if left == right else (2,))
    return tuple(word)


def exact(path: tuple[int, ...], order: str) -> Fraction:
    if order == "matching":
        return Fraction(adjacency_product(path)[0], 1)
    word = (2,) + coefficient_word(path)
    full = digit_product(word)
    trace = full[0] + full[3]
    q_min = min(digit_product(word[i:] + word[:i])[2]
                for i in range(len(word)))
    return Fraction(trace * trace - 4, q_min * q_min)


def bounds(prefix: tuple[int, ...], total: int, order: str) -> tuple[Fraction, Fraction]:
    if len(prefix) == total:
        value = exact(prefix, order)
        return value, value
    product = adjacency_product(prefix)
    remaining = total - len(prefix)
    if order == "matching":
        lower = mul(product, mat_power(D, remaining))[0]
        upper = mul(product, mat_power(E, remaining))[0]
        return Fraction(lower, 1), Fraction(upper, 1)
    cyclic_prefix = mul(D, product)
    lower_matrix = mul(cyclic_prefix, mat_power(D, remaining))
    upper_matrix = mul(cyclic_prefix, mat_power(E, remaining))
    t_lower = lower_matrix[0] + lower_matrix[3]
    t_upper = upper_matrix[0] + upper_matrix[3]
    q_upper = upper_matrix[2]
    equalities = sum(x == y for x, y in zip(prefix, prefix[1:]))
    q_lower = fib(total + equalities)
    return (Fraction(max(0, t_lower * t_lower - 4), q_upper * q_upper),
            Fraction(max(0, t_upper * t_upper - 4), q_lower * q_lower))


def feasible_extensions(prefix: str, a: int, b: int):
    r_count = prefix.count("R")
    u_count = prefix.count("U")
    if r_count < a:
        yield prefix + "R"
    if u_count < b and a * (u_count + 1) <= b * r_count:
        yield prefix + "U"


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("certificate", type=Path)
    args = parser.parse_args()
    data = json.loads(args.certificate.read_text(encoding="utf-8"))
    assert data["is_cover"] is True and data["intermediate_witness"] is None
    assert "frontier" in data
    a, b, order = data["a"], data["b"], data["order"]
    total = a + b
    lower_score = exact(bits(data["lower_path"]), order)
    upper_score = exact(bits(data["upper_path"]), order)
    assert lower_score == Fraction(*data["lower_score"])
    assert upper_score == Fraction(*data["upper_score"])
    assert lower_score < upper_score

    entries = {entry["prefix"]: entry for entry in data["frontier"]}
    assert len(entries) == data["certificate_frontier_size"]
    prefixes = sorted(entries)
    for index, prefix in enumerate(prefixes):
        assert prefix.startswith("R") and len(prefix) <= total
        assert prefix.count("R") <= a and prefix.count("U") <= b
        r_count = u_count = 0
        for step in prefix:
            r_count += step == "R"
            u_count += step == "U"
            assert a * u_count <= b * r_count
        assert not any(prefix.startswith(other) for other in prefixes[:index])

        low, high = bounds(bits(prefix), total, order)
        entry = entries[prefix]
        assert low == Fraction(*entry["lower_bound"])
        assert high == Fraction(*entry["upper_bound"])
        assert low <= high
        if entry["disposition"] == "at_or_below_lower_level":
            assert high <= lower_score
        else:
            assert entry["disposition"] == "at_or_above_upper_level"
            assert low >= upper_score

    def check_partition(prefix: str) -> None:
        if prefix in entries:
            return
        assert len(prefix) < total
        children = list(feasible_extensions(prefix, a, b))
        assert children
        for child in children:
            check_partition(child)

    check_partition("R")
    print(f"verified {order} cover certificate on D({a},{b}): "
          f"{len(entries)} frontier prefixes")


if __name__ == "__main__":
    main()
