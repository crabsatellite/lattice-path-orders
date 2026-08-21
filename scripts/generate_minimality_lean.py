#!/usr/bin/env python3
"""Generate kernel-replayed Problem 6.3 minimality certificates.

The generator discovers score classes and an assignment trie.  It emits only
ordinary Lean data.  `MinimalityCertificate.lean` proves that successful
kernel checks imply the quantified no-collision theorem.
"""

from __future__ import annotations

from collections import defaultdict
from fractions import Fraction
import hashlib
import json
import math
from pathlib import Path

import exact_orders as eo

ROOT = Path(__file__).resolve().parents[1]
LEAN_DIR = (ROOT / "lean4" / "LatticePathOrders").resolve()
SOURCE_RECEIPT = ROOT / "data" / "problem-6-3-through-25.json"
MAX_TOTAL = 25
REGION_LEAF_LIMIT = 64
REGIONS_PER_PART = 4
PARTS_PER_GROUP = 16
CLASS_CHUNK_SIZE = 4096
GENERATED_PREFIX = "GeneratedMinimality_"
ROOT_OUTPUT = LEAN_DIR / "GeneratedMinimalityCertificate.lean"

PathWord = tuple[int, ...]


def module_stem(a: int, b: int) -> str:
    return f"GeneratedMinimality_{a}_{b}"


def namespace(a: int, b: int) -> str:
    return module_stem(a, b)


def lean_path(path: PathWord) -> str:
    return f'mustParsePath "{eo.path_text(path)}"'


def band_key(path: PathWord) -> tuple[int, ...]:
    word = (2,) + eo.path_word(path)
    variants: list[tuple[int, ...]] = []
    for base in (word, word[::-1]):
        variants.extend(base[index:] + base[:index] for index in range(len(base)))
    return min(variants)


def lagrange_raw(path: PathWord) -> tuple[int, int, Fraction]:
    cyclic_word = (2,) + eo.path_word(path)
    p, r, q, s = eo.matrix_product(cyclic_word)
    numerator = (p - s) ** 2 + 4 * r * q
    q_min = min(product[2] for product in eo.cyclic_products(cyclic_word))
    return numerator, q_min, Fraction(numerator, q_min * q_min)


def endpoint_data(a: int, b: int) -> tuple[
    list[PathWord], list[tuple[PathWord, int, int]], dict[PathWord, int]
]:
    paths = list(eo.enumerate_paths(a, b))
    by_score: dict[Fraction, list[PathWord]] = defaultdict(list)
    for path in paths:
        by_score[lagrange_raw(path)[2]].append(path)

    classes: list[tuple[PathWord, int, int]] = []
    class_index: dict[PathWord, int] = {}
    for index, (value, members) in enumerate(sorted(by_score.items())):
        keys = {band_key(path) for path in members}
        assert len(keys) == 1, (a, b, members[:2], "minimality collision")
        anchor = min(members)
        numerator, q_min, checked_value = lagrange_raw(anchor)
        assert checked_value == value
        classes.append((anchor, numerator, q_min))
        for path in members:
            class_index[path] = index
    return paths, classes, class_index


def split_regions(paths: list[PathWord], prefix: PathWord) -> list[tuple[PathWord, list[PathWord]]]:
    if len(paths) <= REGION_LEAF_LIMIT or len(prefix) == len(paths[0]):
        return [(prefix, paths)]
    position = len(prefix)
    right = [path for path in paths if path[position] == 1]
    up = [path for path in paths if path[position] == 0]
    result: list[tuple[PathWord, list[PathWord]]] = []
    if right:
        result.extend(split_regions(right, prefix + (1,)))
    if up:
        result.extend(split_regions(up, prefix + (0,)))
    return result


def closed_turn_code(path: PathWord) -> tuple[bool, ...]:
    return tuple(path[index] == path[(index + 1) % len(path)]
                 for index in range(len(path)))


def orbit_witness(path: PathWord, anchor: PathWord) -> tuple[bool, int]:
    source = closed_turn_code(path)
    target = closed_turn_code(anchor)
    for reversed_orientation, base in ((False, source), (True, source[::-1])):
        for rotation in range(len(base)):
            if base[rotation:] + base[:rotation] == target:
                return reversed_orientation, rotation
    raise AssertionError((path, anchor, "missing dihedral witness"))


def tree_expression(
    paths: list[PathWord],
    prefix: PathWord,
    class_index: dict[PathWord, int],
    class_anchors: dict[int, PathWord],
) -> str:
    total = len(paths[0])
    if len(prefix) == total:
        assert paths == [prefix]
        index = class_index[prefix]
        reversed_orientation, rotation = orbit_witness(
            prefix, class_anchors[index]
        )
        lean_bool = "true" if reversed_orientation else "false"
        return f"(.leaf {index} {lean_bool} {rotation})"
    position = len(prefix)
    right = [path for path in paths if path[position] == 1]
    up = [path for path in paths if path[position] == 0]
    right_expr = (
        f"(some {tree_expression(right, prefix + (1,), class_index, class_anchors)})"
        if right else "none"
    )
    up_expr = (
        f"(some {tree_expression(up, prefix + (0,), class_index, class_anchors)})"
        if up else "none"
    )
    return f"(.node {right_expr} {up_expr})"


def prefix_partition_tree_expression(
    prefixes: list[PathWord], prefix: PathWord
) -> str:
    """Emit the compact trie whose leaves are exactly ``prefixes``.

    ``split_regions`` returns a right-first prefix antichain, so this recursion
    preserves its literal order.  Feasible-branch completeness is not trusted
    here: the generated tree is checked by ``PrefixPartitionTree.check``.
    """
    if prefix in prefixes:
        assert prefixes == [prefix]
        return ".leaf"
    position = len(prefix)
    right = [item for item in prefixes if item[position] == 1]
    up = [item for item in prefixes if item[position] == 0]
    assert right or up
    right_expr = (
        f"(some {prefix_partition_tree_expression(right, prefix + (1,))})"
        if right else "none"
    )
    up_expr = (
        f"(some {prefix_partition_tree_expression(up, prefix + (0,))})"
        if up else "none"
    )
    return f"(.node {right_expr} {up_expr})"


def write_text(path: Path, text: str) -> None:
    path.write_text(text, encoding="utf-8", newline="\n")


def emit_class_chunk(
    a: int,
    b: int,
    chunk_index: int,
    classes: list[tuple[PathWord, int, int]],
    receipt_hash: str,
) -> tuple[Path, str, str, str]:
    stem = module_stem(a, b)
    module = f"{stem}_ClassChunk{chunk_index:03d}"
    value = f"classChunk{chunk_index:03d}"
    valid = f"{value}_valid"
    output = LEAN_DIR / f"{module}.lean"
    entries = [
        f"  {{ anchor := {lean_path(anchor)}, numerator := {numerator}, qMin := {q_min} }}"
        for anchor, numerator, q_min in classes
    ]
    text = "\n".join([
        "import LatticePathOrders.MinimalityClassTable",
        "",
        "set_option maxRecDepth 1000000",
        "set_option maxHeartbeats 0",
        "",
        f"namespace LatticePathOrders.{namespace(a, b)}",
        "",
        f"/-- Bounded class chunk {chunk_index}; derived from receipt SHA-256",
        f"`{receipt_hash}`.  Leaf checks recompute every value. -/",
        f"def {value} : ClassTable := .leaf #[",
        ",\n".join(entries),
        "]",
        "",
        f"theorem {valid} : ClassTableValid {value} := by",
        "  decide",
        "",
        "end " + f"LatticePathOrders.{namespace(a, b)}",
        "",
    ])
    write_text(output, text)
    return output, module, value, valid


def emit_class_merge(
    a: int,
    b: int,
    level: int,
    merge_index: int,
    left: tuple[str, str, str],
    right: tuple[str, str, str],
) -> tuple[Path, str, str, str]:
    stem = module_stem(a, b)
    module = f"{stem}_ClassMerge{level:02d}_{merge_index:03d}"
    value = f"classMerge{level:02d}_{merge_index:03d}"
    valid = f"{value}_valid"
    output = LEAN_DIR / f"{module}.lean"
    left_module, left_value, left_valid = left
    right_module, right_value, right_valid = right
    text = "\n".join([
        f"import LatticePathOrders.{left_module}",
        f"import LatticePathOrders.{right_module}",
        "",
        "set_option maxRecDepth 1000000",
        "set_option maxHeartbeats 0",
        "",
        f"namespace LatticePathOrders.{namespace(a, b)}",
        "",
        f"def {value} : ClassTable := .node {left_value} {right_value}",
        "",
        f"theorem {valid} : ClassTableValid {value} := by",
        f"  unfold {value}",
        "  simp only [ClassTableValid]",
        f"  exact ⟨{left_valid}, {right_valid}, by decide⟩",
        "",
        "end " + f"LatticePathOrders.{namespace(a, b)}",
        "",
    ])
    write_text(output, text)
    return output, module, value, valid


def emit_data(
    a: int,
    b: int,
    classes: list[tuple[PathWord, int, int]],
    receipt_hash: str,
) -> list[Path]:
    stem = module_stem(a, b)
    outputs: list[Path] = []
    nodes: list[tuple[str, str, str]] = []
    for chunk_index, start in enumerate(range(0, len(classes), CLASS_CHUNK_SIZE)):
        output, module, value, valid = emit_class_chunk(
            a, b, chunk_index, classes[start:start + CLASS_CHUNK_SIZE], receipt_hash
        )
        outputs.append(output)
        nodes.append((module, value, valid))
    assert nodes

    level = 0
    while len(nodes) > 1:
        merged: list[tuple[str, str, str]] = []
        for index in range(0, len(nodes), 2):
            if index + 1 == len(nodes):
                merged.append(nodes[index])
                continue
            output, module, value, valid = emit_class_merge(
                a, b, level, index // 2, nodes[index], nodes[index + 1]
            )
            outputs.append(output)
            merged.append((module, value, valid))
        nodes = merged
        level += 1

    root_module, root_value, root_valid = nodes[0]
    output = LEAN_DIR / f"{stem}_Data.lean"
    text = "\n".join([
        f"import LatticePathOrders.{root_module}",
        "",
        f"namespace LatticePathOrders.{namespace(a, b)}",
        "",
        f"abbrev classes : ClassTable := {root_value}",
        "",
        "theorem classes_valid : ClassTableValid classes :=",
        f"  {root_valid}",
        "",
        "end " + f"LatticePathOrders.{namespace(a, b)}",
        "",
    ])
    write_text(output, text)
    outputs.append(output)
    return outputs


def emit_part(
    a: int,
    b: int,
    part_index: int,
    region_slice: list[tuple[int, PathWord, list[PathWord]]],
    class_index: dict[PathWord, int],
    class_anchors: dict[int, PathWord],
) -> Path:
    stem = module_stem(a, b)
    output = LEAN_DIR / f"{stem}_Part{part_index:03d}.lean"
    lines = [
        f"import LatticePathOrders.{stem}_Data",
        "import LatticePathOrders.MinimalityCertificate",
        "",
        "set_option maxRecDepth 1000000",
        "set_option maxHeartbeats 0",
        "",
        f"namespace LatticePathOrders.{namespace(a, b)}",
        "",
    ]
    region_names: list[str] = []
    for region_index, prefix, paths in region_slice:
        name = f"region_{region_index:04d}"
        region_names.append(name)
        fuel = a + b - len(prefix)
        lines.extend([
            f"def {name} : AssignmentTree :=",
            f"  {tree_expression(paths, prefix, class_index, class_anchors)}",
            "",
            f"theorem {name}_check :",
            f"    AssignmentTree.check {a} {b} classes {fuel} ({lean_path(prefix)}) {name} = true := by",
            f"  unfold {name}",
            "  rfl",
            "",
        ])
    part_name = f"regionsPart{part_index:03d}"
    region_entries = []
    for (region_index, prefix, _), name in zip(region_slice, region_names, strict=True):
        fuel = a + b - len(prefix)
        region_entries.append(f"  ({lean_path(prefix)}, {fuel}, {name})")
    lines.extend([
        f"def {part_name} : List (Path × Nat × AssignmentTree) := [",
        ",\n".join(region_entries),
        "]",
        "",
        f"theorem {part_name}_valid : ∀ region ∈ {part_name},",
        f"    region.1.length + region.2.1 = {a + b} ∧",
        f"      region.2.2.check {a} {b} classes region.2.1 region.1 = true := by",
        "  intro region h",
        f"  simp only [{part_name}, List.mem_cons, List.mem_nil_iff, or_false] at h",
        "  rcases h with " + " | ".join("rfl" for _ in region_names),
    ])
    for name in region_names:
        lines.append(f"  · exact ⟨by decide, {name}_check⟩")
    lines.extend(["", "end " + f"LatticePathOrders.{namespace(a, b)}", ""])
    write_text(output, "\n".join(lines))
    return output


def emit_group(
    a: int,
    b: int,
    group_index: int,
    part_indices: list[int],
) -> Path:
    stem = module_stem(a, b)
    output = LEAN_DIR / f"{stem}_Group{group_index:03d}.lean"
    parts = [f"regionsPart{index:03d}" for index in part_indices]
    lines = [
        *[f"import LatticePathOrders.{stem}_Part{index:03d}"
          for index in part_indices],
        "",
        "set_option maxRecDepth 1000000",
        "set_option maxHeartbeats 0",
        "",
        f"namespace LatticePathOrders.{namespace(a, b)}",
        "",
    ]
    group_name = f"regionsGroup{group_index:03d}"
    if len(parts) == 1:
        lines.append(
            f"def {group_name} : List (Path × Nat × AssignmentTree) := {parts[0]}"
        )
    else:
        joined = " ++ (".join(parts) + ")" * (len(parts) - 1)
        lines.extend([
            f"def {group_name} : List (Path × Nat × AssignmentTree) :=",
            "  " + joined,
        ])
    lines.extend([
        "",
        f"theorem {group_name}_valid : ∀ region ∈ {group_name},",
        f"    region.1.length + region.2.1 = {a + b} ∧",
        f"      region.2.2.check {a} {b} classes region.2.1 region.1 = true := by",
        "  intro region h",
    ])
    if len(parts) == 1:
        lines.append(f"  exact {parts[0]}_valid region h")
    else:
        lines.extend([
            f"  simp only [{group_name}, List.mem_append] at h",
            "  rcases h with " + " | ".join("h" for _ in parts),
        ])
        for part in parts:
            lines.append(f"  · exact {part}_valid region h")
    lines.extend(["", "end " + f"LatticePathOrders.{namespace(a, b)}", ""])
    write_text(output, "\n".join(lines))
    return output


def emit_frontier(
    a: int,
    b: int,
    region_prefixes: list[PathWord],
) -> Path:
    stem = module_stem(a, b)
    output = LEAN_DIR / f"{stem}_Frontier.lean"
    tree = prefix_partition_tree_expression(region_prefixes, (1,))
    prefix_entries = [f"  {lean_path(prefix)}" for prefix in region_prefixes]
    lines = [
        "import LatticePathOrders.MinimalityPartitionTree",
        "",
        "set_option maxRecDepth 1000000",
        "set_option maxHeartbeats 0",
        "",
        f"namespace LatticePathOrders.{namespace(a, b)}",
        "",
        "def partitionTree : PrefixPartitionTree :=",
        f"  {tree}",
        "",
        "theorem partitionTree_check :",
        f"    PrefixPartitionTree.check {a} {b} ({a + b} - 1) [Step.R] partitionTree = true := by",
        "  unfold partitionTree",
        "  rfl",
        "",
        "def partitionFrontier : List Path := [",
        ",\n".join(prefix_entries),
        "]",
        "",
        "theorem partitionTree_frontier :",
        "    PrefixPartitionTree.frontier [Step.R] partitionTree = partitionFrontier := by",
        "  unfold partitionTree partitionFrontier",
        "  rfl",
        "",
        "end " + f"LatticePathOrders.{namespace(a, b)}",
        "",
    ]
    write_text(output, "\n".join(lines))
    return output


def emit_endpoint(
    a: int,
    b: int,
    region_count: int,
    part_count: int,
    group_count: int,
) -> Path:
    stem = module_stem(a, b)
    output = LEAN_DIR / f"{stem}.lean"
    lines = [
        f"import LatticePathOrders.{stem}_Frontier",
        *[f"import LatticePathOrders.{stem}_Group{index:03d}"
          for index in range(group_count)],
        "",
        "set_option maxRecDepth 1000000",
        "set_option maxHeartbeats 0",
        "",
        f"namespace LatticePathOrders.{namespace(a, b)}",
        "",
    ]
    groups = [f"regionsGroup{index:03d}" for index in range(group_count)]
    parts = [f"regionsPart{index:03d}" for index in range(part_count)]
    if group_count == 1:
        lines.append(f"def regions : List (Path × Nat × AssignmentTree) := {groups[0]}")
    else:
        right_associated_groups = " ++ (".join(groups) + ")" * (len(groups) - 1)
        lines.extend([
            "def regions : List (Path × Nat × AssignmentTree) :=",
            "  " + right_associated_groups,
        ])
    lines.extend([
        "",
        "theorem partitionFrontier_regions :",
        "    partitionFrontier = regions.map Prod.fst := by",
        "  unfold partitionFrontier regions " + " ".join(groups + parts),
        "  rfl",
        "",
        "theorem regions_frontier :",
        "    PrefixPartitionTree.frontier [Step.R] partitionTree = regions.map Prod.fst :=",
        "  partitionTree_frontier.trans partitionFrontier_regions",
        "",
        "theorem regions_valid : ∀ region ∈ regions,",
        f"    region.1.length + region.2.1 = {a + b} ∧",
        f"      region.2.2.check {a} {b} classes region.2.1 region.1 = true := by",
        "  intro region h",
    ])
    if group_count == 1:
        lines.append(f"  exact {groups[0]}_valid region h")
    else:
        lines.extend([
            "  simp only [regions, List.mem_append] at h",
            "  rcases h with " + " | ".join("h" for _ in groups),
        ])
        for group in groups:
            lines.append(f"  · exact {group}_valid region h")
    lines.extend([
        "",
        "theorem regions_cover : TreeRegionsCover " +
          f"{a} {b} classes regions partitionTree :=",
        "  ⟨classes_valid, partitionTree_check, regions_frontier, regions_valid⟩",
        "",
        f"theorem problem63_{a}_{b} : Problem63HoldsAt {a} {b} :=",
        f"  problem63HoldsAt_of_treeRegionsCover (by decide) (by decide) regions_cover",
        "",
        f"/-- Endpoint certificate: {region_count} regions. -/",
        f"theorem region_count : regions.length = {region_count} := by",
        "  have h := congrArg List.length partitionFrontier_regions",
        "  simpa [partitionFrontier] using h",
        "",
        "end " + f"LatticePathOrders.{namespace(a, b)}",
        "",
    ])
    write_text(output, "\n".join(lines))
    return output


def emit_root(endpoints: list[tuple[int, int]]) -> None:
    imports = [
        f"import LatticePathOrders.{module_stem(a, b)}" for a, b in endpoints
    ]
    endpoint_entries = [f"  ({a}, {b})" for a, b in endpoints]
    cases = " | ".join("⟨rfl, rfl⟩" for _ in endpoints)
    lines = [
        *imports,
        "import LatticePathOrders.ReferenceGate",
        "",
        "set_option maxRecDepth 1000000",
        "set_option maxHeartbeats 0",
        "",
        "namespace LatticePathOrders",
        "",
        "def problem63MinimalityEndpoints : List (Nat × Nat) := [",
        ",\n".join(endpoint_entries),
        "]",
        "",
        "theorem problem63HoldsAt_of_mem {a b : Nat}",
        "    (h : (a, b) ∈ problem63MinimalityEndpoints) : Problem63HoldsAt a b := by",
        "  simp only [problem63MinimalityEndpoints, List.mem_cons, List.mem_nil_iff,",
        "    or_false, Prod.mk.injEq] at h",
        f"  rcases h with {cases}",
    ]
    for a, b in endpoints:
        lines.append(f"  · exact {namespace(a, b)}.problem63_{a}_{b}")
    lines.extend([
        "",
        "theorem problem63_endpoint_mem_through_25 {a b : Nat}",
        "    (hb : 0 < b) (hab : b < a) (hcop : Nat.Coprime a b)",
        "    (hlen : a + b ≤ 25) : (a, b) ∈ problem63MinimalityEndpoints := by",
        "  have ha25 : a ≤ 25 := by omega",
        "  have hb25 : b ≤ 25 := by omega",
        "  interval_cases a <;> interval_cases b <;>",
        "    norm_num [problem63MinimalityEndpoints, Nat.Coprime] at *",
        "",
        "/-- Kernel-replayed shortest-length statement for the displayed",
        "Problem 6.3 counterexample. -/",
        "theorem problem63_minimal_through_25 {a b : Nat}",
        "    (hb : 0 < b) (hab : b < a) (hcop : Nat.Coprime a b)",
        "    (hlen : a + b ≤ 25) : Problem63HoldsAt a b :=",
        "  problem63HoldsAt_of_mem",
        "    (problem63_endpoint_mem_through_25 hb hab hcop hlen)",
        "",
        "/-- Published-semantics form: through total length 25, equality of",
        "Schiffler's Lagrange values forces band-graph isomorphism. -/",
        "theorem problem63_schiffler_minimal_through_25 {a b : Nat}",
        "    (hb : 0 < b) (hab : b < a) (hcop : Nat.Coprime a b)",
        "    (hlen : a + b ≤ 25) {x y : Path}",
        "    (hx : Carrier a b x) (hy : Carrier a b y)",
        "    (hscore : ReferenceGate.SchifflerLagrangeSq x =",
        "      ReferenceGate.SchifflerLagrangeSq y) :",
        "    ReferenceGate.SchifflerBandIso x y := by",
        "  have hmatrix : lagrangeSq x = lagrangeSq y := by",
        "    rw [← ReferenceGate.schifflerLagrangeSq_eq_traceMin,",
        "      ← ReferenceGate.schifflerLagrangeSq_eq_traceMin]",
        "    exact hscore",
        "  apply ReferenceGate.dihedralTurn_implies_bandIso",
        "  exact problem63_minimal_through_25 hb hab hcop hlen x y hx hy hmatrix",
        "",
        "end LatticePathOrders",
        "",
    ])
    write_text(ROOT_OUTPUT, "\n".join(lines))


def main() -> None:
    if LEAN_DIR.parent.resolve() != (ROOT / "lean4").resolve():
        raise RuntimeError("generated target escaped the canonical Lean directory")
    receipt = json.loads(SOURCE_RECEIPT.read_text(encoding="utf-8"))
    assert receipt["max_total_length"] == MAX_TOTAL
    assert receipt["counterexample_count"] == 0
    receipt_hash = hashlib.sha256(SOURCE_RECEIPT.read_bytes()).hexdigest()

    endpoints: list[tuple[int, int]] = []
    generated_paths: set[Path] = {ROOT_OUTPUT}
    total_paths = 0
    total_classes = 0
    total_regions = 0
    for total in range(3, MAX_TOTAL + 1):
        for a in range(total // 2 + 1, total):
            b = total - a
            if math.gcd(a, b) != 1:
                continue
            endpoints.append((a, b))
            paths, classes, class_index = endpoint_data(a, b)
            class_anchors = {
                index: anchor for index, (anchor, _, _) in enumerate(classes)
            }
            regions = split_regions(paths, (1,))
            total_paths += len(paths)
            total_classes += len(classes)
            total_regions += len(regions)
            generated_paths.update(emit_data(a, b, classes, receipt_hash))
            indexed_regions = [
                (index, prefix, members)
                for index, (prefix, members) in enumerate(regions)
            ]
            parts = [
                indexed_regions[index:index + REGIONS_PER_PART]
                for index in range(0, len(indexed_regions), REGIONS_PER_PART)
            ]
            for part_index, region_slice in enumerate(parts):
                generated_paths.add(
                    emit_part(
                        a, b, part_index, region_slice, class_index, class_anchors
                    )
                )
            groups = [
                list(range(index, min(index + PARTS_PER_GROUP, len(parts))))
                for index in range(0, len(parts), PARTS_PER_GROUP)
            ]
            for group_index, part_indices in enumerate(groups):
                generated_paths.add(
                    emit_group(a, b, group_index, part_indices)
                )
            generated_paths.add(
                emit_frontier(a, b, [prefix for prefix, _ in regions])
            )
            generated_paths.add(
                emit_endpoint(a, b, len(regions), len(parts), len(groups))
            )
            print(
                f"generated D({a},{b}): {len(paths)} paths, "
                f"{len(classes)} classes, {len(regions)} regions"
            )

    assert len(endpoints) == receipt["endpoint_count"] == 99
    assert total_paths == receipt["path_count"] == 934_635
    assert total_classes == sum(
        item["lagrange_level_count"] for item in receipt["endpoints"]
    )
    emit_root(endpoints)

    generated_resolved = {path.resolve() for path in generated_paths}
    for stale in LEAN_DIR.glob(f"{GENERATED_PREFIX}*.lean"):
        if stale.resolve() not in generated_resolved:
            stale.unlink()
    print(
        f"generated {len(endpoints)} endpoints, {total_paths} leaves, "
        f"{total_classes} classes, {total_regions} regions"
    )


if __name__ == "__main__":
    main()
