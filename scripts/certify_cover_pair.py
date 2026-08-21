#!/usr/bin/env python3
"""Construct an exact rational-Dyck prefix certificate for one cover query."""

from __future__ import annotations

import argparse
import json
from collections import Counter
from pathlib import Path

import enumerate_cover_levels as bf


def parse_path(text: str) -> tuple[int, ...]:
    if any(letter not in "RU" for letter in text):
        raise ValueError("paths must contain only R and U")
    return tuple(letter == "R" for letter in text)


def validate_path(path: tuple[int, ...], a: int, b: int) -> None:
    if len(path) != a + b or sum(path) != a:
        raise ValueError("path has the wrong endpoint")
    r_count = u_count = 0
    for step in path:
        r_count += step == 1
        u_count += step == 0
        if a * u_count > b * r_count:
            raise ValueError("path violates the rational-Dyck prefix inequality")


def state_for_path(path: tuple[int, ...]) -> bf.State:
    state = bf.State((1,), 1, 0, bf.IDENTITY)
    for step in path[1:]:
        block = bf.E if step == state.path[-1] else bf.D
        state = bf.State(
            state.path + (step,),
            state.r_count + int(step == 1),
            state.u_count + int(step == 0),
            bf.multiply(state.adjacency_product, block),
        )
    return state


def fraction_json(value):
    return [value.numerator, value.denominator]


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--a", type=int, required=True)
    parser.add_argument("--b", type=int, required=True)
    parser.add_argument("--order", choices=("matching", "lagrange"), required=True)
    parser.add_argument("--lower", required=True)
    parser.add_argument("--upper", required=True)
    parser.add_argument("--include-frontier", action="store_true")
    parser.add_argument("--output", type=Path)
    args = parser.parse_args()

    lower_path = parse_path(args.lower)
    upper_path = parse_path(args.upper)
    validate_path(lower_path, args.a, args.b)
    validate_path(upper_path, args.a, args.b)
    enumerator = bf.BestFirstLevels(args.a, args.b, args.order)
    lower_score = enumerator.exact_score(state_for_path(lower_path))
    upper_score = enumerator.exact_score(state_for_path(upper_path))
    if not lower_score < upper_score:
        raise ValueError("the supplied paths are not strictly increasing")

    root = bf.State((1,), 1, 0, bf.IDENTITY)
    stack = [root]
    frontier = []
    expanded = 0
    witness = None
    dispositions: Counter[str] = Counter()
    while stack:
        state = stack.pop()
        lower_bound = enumerator.key(state)
        upper_bound = enumerator.upper_bound(state)
        assert lower_bound <= upper_bound
        if upper_bound <= lower_score:
            disposition = "at_or_below_lower_level"
        elif lower_bound >= upper_score:
            disposition = "at_or_above_upper_level"
        elif enumerator.is_leaf(state):
            exact = enumerator.exact_score(state)
            if lower_score < exact < upper_score:
                witness = {
                    "path": bf.path_text(state.path),
                    "score": fraction_json(exact),
                }
                break
            disposition = ("at_or_below_lower_level" if exact <= lower_score
                           else "at_or_above_upper_level")
        else:
            expanded += 1
            stack.extend(enumerator.children(state))
            continue

        dispositions[disposition] += 1
        if args.include_frontier:
            frontier.append({
                "prefix": bf.path_text(state.path),
                "lower_bound": fraction_json(lower_bound),
                "upper_bound": fraction_json(upper_bound),
                "disposition": disposition,
            })

    result = {
        "claim_status": "exact prefix-antichain cover certificate",
        "a": args.a,
        "b": args.b,
        "order": args.order,
        "lower_path": args.lower,
        "upper_path": args.upper,
        "lower_score": fraction_json(lower_score),
        "upper_score": fraction_json(upper_score),
        "is_cover": witness is None,
        "intermediate_witness": witness,
        "expanded_prefix_count": expanded,
        "certificate_frontier_size": sum(dispositions.values()),
        "disposition_counts": dict(sorted(dispositions.items())),
    }
    if args.include_frontier:
        result["frontier"] = frontier
    text = json.dumps(result, indent=2, sort_keys=True)
    if args.output:
        args.output.parent.mkdir(parents=True, exist_ok=True)
        args.output.write_text(text + "\n", encoding="utf-8")
    else:
        print(text)


if __name__ == "__main__":
    main()
