#!/usr/bin/env python3
"""Finite streaming audit for the proved nonlocal matching-cover family."""

from __future__ import annotations

import argparse
import json
from pathlib import Path

import exact_orders as eo


def path(text: str) -> tuple[int, ...]:
    return tuple(1 if letter == "R" else 0 for letter in text)


def endpoint_pair(n: int) -> tuple[tuple[int, ...], tuple[int, ...]]:
    x = path("RRR" + "UR" * (n - 3) + "UU")
    y = path("RR" + "UR" * (n - 4) + "RUURU")
    return x, y


def audit(n: int) -> dict[str, int]:
    x, y = endpoint_pair(n)
    mx, my = eo.matching_number(x), eo.matching_number(y)
    assert mx < my
    path_count = between = x_ties = y_ties = 0
    below_x_levels: set[int] = set()
    for candidate in eo.enumerate_paths(n, n - 1):
        path_count += 1
        score = eo.matching_number(candidate)
        between += mx < score < my
        x_ties += score == mx
        y_ties += score == my
        if score < mx:
            below_x_levels.add(score)
    assert between == 0 and x_ties == y_ties == 1
    assert len(below_x_levels) == n - 2
    return {
        "n": n,
        "path_count": path_count,
        "matching_x": mx,
        "matching_y": my,
        "x_rank": len(below_x_levels),
        "y_rank": len(below_x_levels) + 1,
        "hamming_distance": sum(left != right for left, right in zip(x, y)),
        "intermediate_score_count": between,
        "x_tie_count": x_ties,
        "y_tie_count": y_ties,
    }


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--max-n", type=int, default=15)
    parser.add_argument("--output", type=Path)
    args = parser.parse_args()
    rows = [audit(n) for n in range(4, args.max_n + 1)]
    for previous, current in zip(rows, rows[1:]):
        if current["n"] >= 6:
            older = rows[current["n"] - 6]
            assert current["matching_x"] == 6 * previous["matching_x"] - older["matching_x"]
            assert current["matching_y"] == 6 * previous["matching_y"] - older["matching_y"]
    result = {
        "claim_status": "finite independent audit; uniform theorem is proved separately",
        "rows": rows,
    }
    text = json.dumps(result, indent=2, sort_keys=True)
    if args.output:
        args.output.parent.mkdir(parents=True, exist_ok=True)
        args.output.write_text(text + "\n", encoding="utf-8")
    else:
        print(text)


if __name__ == "__main__":
    main()
