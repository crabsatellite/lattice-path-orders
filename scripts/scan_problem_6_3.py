#!/usr/bin/env python3
"""Exact all-endpoint finite audit of Schiffler's Problem 6.3."""

from __future__ import annotations

import argparse
import json
import math
from pathlib import Path

import exact_orders as eo


def band_key(path: tuple[int, ...]) -> tuple[int, ...]:
    word = (2,) + eo.path_word(path)
    reverse = word[::-1]
    variants = []
    for base in (word, reverse):
        variants.extend(base[index:] + base[:index] for index in range(len(base)))
    return min(variants)


def reflection_fixed_count(a: int, b: int) -> int:
    length = a + b
    if length % 2:
        return math.comb((length - 1) // 2, a // 2)
    assert a % 2 == b % 2 == 1
    return math.comb((length - 2) // 2, (a - 1) // 2)


def audit_endpoint(a: int, b: int) -> dict[str, int]:
    lagrange_to_graph: dict[object, tuple[int, ...]] = {}
    graph_to_lagrange: dict[tuple[int, ...], object] = {}
    path_count = 0
    for path in eo.enumerate_paths(a, b):
        path_count += 1
        lagrange = eo.lagrange_square(path)
        graph = band_key(path)
        previous_graph = lagrange_to_graph.setdefault(lagrange, graph)
        assert previous_graph == graph, (a, b, path, "Problem 6.3 counterexample")
        previous_lagrange = graph_to_lagrange.setdefault(graph, lagrange)
        assert previous_lagrange == lagrange

    expected_paths = math.comb(a + b, a) // (a + b)
    fixed = reflection_fixed_count(a, b)
    expected_classes = (expected_paths + fixed) // 2
    assert path_count == expected_paths
    assert len(graph_to_lagrange) == expected_classes
    assert len(lagrange_to_graph) == expected_classes
    return {
        "a": a,
        "b": b,
        "path_count": path_count,
        "reflection_fixed_count": fixed,
        "band_graph_class_count": expected_classes,
        "lagrange_level_count": len(lagrange_to_graph),
    }


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--max-total", type=int, default=25)
    parser.add_argument("--output", type=Path)
    args = parser.parse_args()
    endpoints = []
    for total in range(3, args.max_total + 1):
        for a in range(total // 2 + 1, total):
            b = total - a
            if math.gcd(a, b) == 1:
                endpoints.append(audit_endpoint(a, b))
    result = {
        "claim_status": "finite evidence only; Problem 6.3 not proved",
        "max_total_length": args.max_total,
        "endpoint_count": len(endpoints),
        "path_count": sum(item["path_count"] for item in endpoints),
        "counterexample_count": 0,
        "endpoints": endpoints,
    }
    text = json.dumps(result, indent=2, sort_keys=True)
    if args.output:
        args.output.parent.mkdir(parents=True, exist_ok=True)
        args.output.write_text(text + "\n", encoding="utf-8")
    else:
        print(text)


if __name__ == "__main__":
    main()
