#!/usr/bin/env python3
"""Generate literal Lean data and replay the committed matching certificates."""

from __future__ import annotations

import hashlib
import json
import math
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
OUTPUT = ROOT / "lean4" / "LatticePathOrders" / "GeneratedMatchingCertificates.lean"
LAGRANGE_OUTPUT = ROOT / "lean4" / "LatticePathOrders" / "GeneratedLagrangeCertificate.lean"

SPECS = (
    ("matching54", ROOT / "data" / "matching-cover-certificate-5-4.json"),
    ("matching1312", ROOT / "data" / "matching-nonlocal-cover-certificate-13-12.json"),
)


def lean_path(text: str) -> str:
    return f'mustParsePath "{text}"'


def emit_certificate(name: str, source: Path) -> str:
    raw = source.read_bytes()
    data = json.loads(raw)
    assert data["order"] == "matching"
    assert data["is_cover"] is True
    a, b = data["a"], data["b"]
    total = a + b
    lower_path = data["lower_path"]
    upper_path = data["upper_path"]
    lower_score = data["lower_score"]
    upper_score = data["upper_score"]
    assert lower_score[1] == upper_score[1] == 1

    entries: list[str] = []
    for entry in data["frontier"]:
        low = entry["lower_bound"]
        high = entry["upper_bound"]
        assert low[1] == high[1] == 1
        entries.append(
            "  { pathPrefix := " + lean_path(entry["prefix"])
            + f", lower := {low[0]}, upper := {high[0]} }}"
        )

    hash_value = hashlib.sha256(raw).hexdigest()
    lines = [
        f"/-- SHA-256 `{hash_value}` of `{source.relative_to(ROOT).as_posix()}`. -/",
        f"def {name}JsonCertificate : List (PrefixBound Nat) := [",
        ",\n".join(entries),
        "]",
        "",
        f"def {name}Frontier : List Path :=",
        f"  {name}JsonCertificate.map PrefixBound.pathPrefix",
        "",
        f"def {name}Lower : Path := {lean_path(lower_path)}",
        f"def {name}Upper : Path := {lean_path(upper_path)}",
        "",
        f"theorem {name}_json_bounds_exact :",
        f"    {name}JsonCertificate = matchingCertificate {total} {name}Frontier := by",
        "  decide",
        "",
        f"theorem {name}_endpoint_data :",
        f"    Carrier {a} {b} {name}Lower ∧ Carrier {a} {b} {name}Upper ∧",
        f"      matchingScore {name}Lower = {lower_score[0]} ∧",
        f"      matchingScore {name}Upper = {upper_score[0]} := by",
        "  decide",
        "",
        f"theorem {name}_partition :",
        f"    partitionCheck {a} {b} {name}Frontier ({total} - 1) [Step.R] = true := by",
        "  decide",
        "",
        f"theorem {name}_nonempty : ∀ p ∈ {name}Frontier, p ≠ [] := by",
        "  intro p hp",
        f"  simp only [{name}Frontier, {name}JsonCertificate, List.map_cons, List.map_nil,",
        "    List.mem_cons, List.mem_nil_iff, or_false] at hp",
        "  rcases hp with " + " | ".join("rfl" for _ in entries) + " <;> decide",
        "",
        f"theorem {name}_outside : ∀ p ∈ {name}Frontier,",
        f"    matchingUpper p ({total} - p.length) ≤ matchingScore {name}Lower ∨",
        f"      matchingScore {name}Upper ≤ matchingLower p ({total} - p.length) := by",
        "  intro p hp",
        f"  simp only [{name}Frontier, {name}JsonCertificate, List.map_cons, List.map_nil,",
        "    List.mem_cons, List.mem_nil_iff, or_false] at hp",
        "  rcases hp with " + " | ".join("rfl" for _ in entries) + " <;> decide",
        "",
        f"theorem {name}_json_certificate_valid :",
        f"    ValidCoverCertificate (Carrier {a} {b}) matchingScore",
        f"      (matchingScore {name}Lower) (matchingScore {name}Upper)",
        f"      {name}JsonCertificate := by",
        f"  rw [{name}_json_bounds_exact]",
        f"  exact validMatchingCertificate (a := {a}) (b := {b}) (by decide)",
        f"    {name}_partition {name}_nonempty {name}_outside",
        "",
        f"theorem {name}_matrix_cover :",
        f"    PullbackCover (Carrier {a} {b}) matchingScore {name}Lower {name}Upper := by",
        f"  apply matchingCover_from_certificate (a := {a}) (b := {b}) (by decide)",
        f"    {name}_endpoint_data.1 {name}_endpoint_data.2.1 (by decide)",
        f"    {name}_partition {name}_nonempty {name}_outside",
        "",
        f"theorem {name}_schiffler_cover :",
        f"    PullbackCover (Carrier {a} {b}) ReferenceGate.SchifflerMatching",
        f"      {name}Lower {name}Upper :=",
        f"  matchingCover_to_Schiffler {name}_matrix_cover",
        "",
    ]
    return "\n".join(lines)


def rational(pair: list[int]) -> str:
    return f"(({pair[0]} : Rat) / ({pair[1]} : Rat))"


def rational_dyck_paths(a: int, b: int) -> list[str]:
    paths: list[str] = []

    def visit(prefix: str, r_count: int, u_count: int) -> None:
        if r_count == a and u_count == b:
            paths.append(prefix)
            return
        if r_count < a:
            visit(prefix + "R", r_count + 1, u_count)
        if u_count < b and a * (u_count + 1) <= b * r_count:
            visit(prefix + "U", r_count, u_count + 1)

    visit("R", 1, 0)
    return paths


def emit_lagrange(source: Path) -> str:
    raw = source.read_bytes()
    data = json.loads(raw)
    assert data["order"] == "lagrange" and data["is_cover"] is True
    a, b = data["a"], data["b"]
    total = a + b
    leaves = rational_dyck_paths(a, b)
    entries: list[str] = []
    for entry in data["frontier"]:
        entries.append(
            "  { pathPrefix := " + lean_path(entry["prefix"])
            + f", lower := {rational(entry['lower_bound'])}"
            + f", upper := {rational(entry['upper_bound'])} }}"
        )
    leaf_lines = [f"  {lean_path(path)}" for path in leaves]
    lower_path = data["lower_path"]
    upper_path = data["upper_path"]
    hash_value = hashlib.sha256(raw).hexdigest()
    frontier_cases = " | ".join("rfl" for _ in entries)
    leaf_cases = " | ".join("rfl" for _ in leaves)
    scores: dict[str, tuple[str, list[int], int]] = {}
    score_blocks: list[str] = []
    bound_names: list[str] = []
    lower_names: list[str] = []
    upper_names: list[str] = []
    exact_names: list[str] = []
    for index, entry in enumerate(data["frontier"]):
        path = entry["prefix"]
        value = entry["lower_bound"]
        assert value == entry["upper_bound"]
        q_value = math.isqrt(value[1])
        assert q_value * q_value == value[1]
        theorem_name = f"lagrange54_score_{index:02d}"
        scores[path] = (theorem_name, value, q_value)
        score_blocks.extend([
            f"theorem {theorem_name} :",
            f"    lagrangeSq ({lean_path(path)}) = {rational(value)} := by",
            "  unfold lagrangeSq",
            f"  rw [show lagrangeNumerator ({lean_path(path)}) = {value[0]} by decide]",
            f"  rw [show qMin (cyclicDigits ({lean_path(path)})) = {q_value} by decide]",
            "  norm_num",
            "",
            f"theorem {theorem_name}_length : ({lean_path(path)}).length = {total} := by",
            "  decide",
            "",
            f"theorem {theorem_name}_lower :",
            f"    lagrangeLower {total} ({lean_path(path)}) = {rational(value)} := by",
            f"  simp only [lagrangeLower, {theorem_name}_length, if_pos, {theorem_name}]",
            "",
            f"theorem {theorem_name}_upper :",
            f"    lagrangeUpper {total} ({lean_path(path)}) = {rational(value)} := by",
            f"  simp only [lagrangeUpper, {theorem_name}_length, if_pos, {theorem_name}]",
            "",
            f"theorem {theorem_name}_bound :",
            f"    lagrangeBound {total} ({lean_path(path)}) =",
            f"      {{ pathPrefix := {lean_path(path)}, lower := {rational(value)},",
            f"        upper := {rational(value)} }} := by",
            f"  simp only [lagrangeBound, {theorem_name}_lower, {theorem_name}_upper]",
            "",
            f"theorem {theorem_name}_exact :",
            f"    exactBound lagrangeSq ({lean_path(path)}) =",
            f"      {{ pathPrefix := {lean_path(path)}, lower := {rational(value)},",
            f"        upper := {rational(value)} }} := by",
            f"  simp only [exactBound, {theorem_name}]",
            "",
        ])
        lower_names.append(theorem_name + "_lower")
        upper_names.append(theorem_name + "_upper")
        bound_names.append(theorem_name + "_bound")
        exact_names.append(theorem_name + "_exact")
    score_simp = ", ".join(
        name for value in scores.values() for name in (value[0], value[0] + "_length")
    )
    interval_simp = ", ".join(lower_names + upper_names)
    bound_simp = ", ".join(bound_names)
    exact_simp = ", ".join(exact_names)
    lower_score_name = scores[lower_path][0]
    upper_score_name = scores[upper_path][0]
    return "\n".join([
        "import LatticePathOrders.LagrangeBounds",
        "import LatticePathOrders.PartitionCertificate",
        "import LatticePathOrders.ReferenceGate",
        "",
        "set_option maxRecDepth 100000",
        "set_option maxHeartbeats 8000000",
        "set_option linter.unusedSimpArgs false",
        "",
        "namespace LatticePathOrders",
        "",
        f"/-- SHA-256 `{hash_value}` of `{source.relative_to(ROOT).as_posix()}`. -/",
        "def lagrange54JsonCertificate : List (PrefixBound Rat) := [",
        ",\n".join(entries),
        "]",
        "",
        "def lagrange54Frontier : List Path :=",
        "  lagrange54JsonCertificate.map PrefixBound.pathPrefix",
        "",
        f"def lagrange54Lower : Path := {lean_path(lower_path)}",
        f"def lagrange54Upper : Path := {lean_path(upper_path)}",
        "",
        "def lagrange54Leaves : List Path := [",
        ",\n".join(leaf_lines),
        "]",
        "",
        *score_blocks,
        "theorem lagrange54_json_bounds_exact :",
        f"    lagrange54JsonCertificate = lagrangeCertificate {total} lagrange54Frontier := by",
        "  simp only [lagrange54JsonCertificate, lagrange54Frontier, lagrangeCertificate,",
        "    List.map_cons, List.map_nil, PrefixBound.pathPrefix,",
        f"    {bound_simp}]",
        "",
        "theorem lagrange54_json_exact_leaf :",
        "    lagrange54JsonCertificate =",
        "      lagrange54Frontier.map (exactBound lagrangeSq) := by",
        "  simp only [lagrange54JsonCertificate, lagrange54Frontier, List.map_cons,",
        "    List.map_nil, PrefixBound.pathPrefix,",
        f"    {exact_simp}]",
        "",
        "theorem lagrange54_endpoint_data :",
        f"    Carrier {a} {b} lagrange54Lower ∧ Carrier {a} {b} lagrange54Upper ∧",
        f"      lagrangeSq lagrange54Lower = {rational(data['lower_score'])} ∧",
        f"      lagrangeSq lagrange54Upper = {rational(data['upper_score'])} := by",
        "  refine ⟨by decide, by decide, ?_, ?_⟩",
        f"  · simpa [lagrange54Lower] using {lower_score_name}",
        f"  · simpa [lagrange54Upper] using {upper_score_name}",
        "",
        "theorem lagrange54_compressed_partition :",
        f"    partitionCheck {a} {b} lagrange54Frontier ({total} - 1) [Step.R] = true := by",
        "  decide",
        "",
        "theorem lagrange54_compressed_nonempty : ∀ p ∈ lagrange54Frontier, p ≠ [] := by",
        "  intro p hp",
        "  simp only [lagrange54Frontier, lagrange54JsonCertificate, List.map_cons, List.map_nil,",
        "    List.mem_cons, List.mem_nil_iff, or_false] at hp",
        f"  rcases hp with {frontier_cases} <;> decide",
        "",
        f"theorem lagrange54_compressed_length : ∀ p ∈ lagrange54Frontier, p.length = {total} := by",
        "  intro p hp",
        "  simp only [lagrange54Frontier, lagrange54JsonCertificate, List.map_cons, List.map_nil,",
        "    List.mem_cons, List.mem_nil_iff, or_false] at hp",
        f"  rcases hp with {frontier_cases} <;> decide",
        "",
        "theorem lagrange54_compressed_outside : ∀ p ∈ lagrange54Frontier,",
        f"    lagrangeUpper {total} p ≤ lagrangeSq lagrange54Lower ∨",
        f"      lagrangeSq lagrange54Upper ≤ lagrangeLower {total} p := by",
        "  intro p hp",
        "  simp only [lagrange54Frontier, lagrange54JsonCertificate, List.map_cons, List.map_nil,",
        "    List.mem_cons, List.mem_nil_iff, or_false] at hp",
        f"  rcases hp with {frontier_cases} <;>",
        f"    simp only [lagrange54Lower, lagrange54Upper, {score_simp}, {interval_simp}] <;>",
        "    norm_num",
        "",
        "theorem lagrange54_compressed_score_outside : ∀ p ∈ lagrange54Frontier,",
        "    lagrangeSq p ≤ lagrangeSq lagrange54Lower ∨",
        "      lagrangeSq lagrange54Upper ≤ lagrangeSq p := by",
        "  intro p hp",
        "  simp only [lagrange54Frontier, lagrange54JsonCertificate, List.map_cons, List.map_nil,",
        "    List.mem_cons, List.mem_nil_iff, or_false] at hp",
        f"  rcases hp with {frontier_cases} <;>",
        f"    simp only [lagrange54Lower, lagrange54Upper, {score_simp}] <;>",
        "    norm_num",
        "",
        "theorem lagrange54_json_certificate_valid :",
        f"    ValidCoverCertificate (Carrier {a} {b}) lagrangeSq",
        "      (lagrangeSq lagrange54Lower) (lagrangeSq lagrange54Upper)",
        "      lagrange54JsonCertificate := by",
        "  rw [lagrange54_json_exact_leaf]",
        "  exact validExactLeafCertificate lagrange54Frontier",
        f"    (coversCarrier_of_partitionCheck (a := {a}) (b := {b}) (by decide)",
        "      lagrange54_compressed_partition)",
        "    (fun _ hw => carrier_length hw) lagrange54_compressed_length",
        "    lagrange54_compressed_score_outside",
        "",
        "theorem lagrange54_leaf_partition :",
        f"    partitionCheck {a} {b} lagrange54Leaves ({total} - 1) [Step.R] = true := by",
        "  decide",
        "",
        f"theorem lagrange54_leaf_length : ∀ p ∈ lagrange54Leaves, p.length = {total} := by",
        "  intro p hp",
        "  simp only [lagrange54Leaves, List.mem_cons, List.mem_nil_iff, or_false] at hp",
        f"  rcases hp with {leaf_cases} <;> decide",
        "",
        "theorem lagrange54_leaf_outside : ∀ p ∈ lagrange54Leaves,",
        "    lagrangeSq p ≤ lagrangeSq lagrange54Lower ∨",
        "      lagrangeSq lagrange54Upper ≤ lagrangeSq p := by",
        "  intro p hp",
        "  simp only [lagrange54Leaves, List.mem_cons, List.mem_nil_iff, or_false] at hp",
        f"  rcases hp with {leaf_cases} <;>",
        f"    simp only [lagrange54Lower, lagrange54Upper, {score_simp}] <;>",
        "    norm_num",
        "",
        "theorem lagrange54_leaf_replay_cover :",
        f"    PullbackCover (Carrier {a} {b}) lagrangeSq lagrange54Lower lagrange54Upper := by",
        "  apply pullbackCover_of_leaf_partition lagrange54Leaves",
        "    lagrange54_endpoint_data.1 lagrange54_endpoint_data.2.1 (by",
        "      rw [lagrange54_endpoint_data.2.2.1, lagrange54_endpoint_data.2.2.2]",
        "      norm_num)",
        f"    (coversCarrier_of_partitionCheck (a := {a}) (b := {b}) (by decide) lagrange54_leaf_partition)",
        "    (fun _ hw => carrier_length hw) lagrange54_leaf_length lagrange54_leaf_outside",
        "",
        "theorem lagrange54_matrix_cover :",
        f"    PullbackCover (Carrier {a} {b}) lagrangeSq lagrange54Lower lagrange54Upper := by",
        "  apply pullbackCover_of_certificate lagrange54_endpoint_data.1 lagrange54_endpoint_data.2.1",
        "  · rw [lagrange54_endpoint_data.2.2.1, lagrange54_endpoint_data.2.2.2]",
        "    norm_num",
        "  · exact lagrange54_json_certificate_valid",
        "",
        "theorem lagrange54_schiffler_cover :",
        f"    PullbackCover (Carrier {a} {b}) ReferenceGate.SchifflerLagrangeSq",
        "      lagrange54Lower lagrange54Upper := by",
        "  simpa only [PullbackCover, ReferenceGate.schifflerLagrangeSq_eq_traceMin] using",
        "    lagrange54_matrix_cover",
        "",
        "end LatticePathOrders",
        "",
    ])


def main() -> None:
    body = [
        "import LatticePathOrders.MatchingCertificate",
        "",
        "set_option maxRecDepth 100000",
        "set_option maxHeartbeats 8000000",
        "set_option linter.unusedSimpArgs false",
        "",
        "namespace LatticePathOrders",
        "",
        "/-! This file is generated from the committed JSON certificates. -/",
        "",
    ]
    for name, source in SPECS:
        body.append(emit_certificate(name, source))
    body.append("end LatticePathOrders\n")
    OUTPUT.write_text("\n".join(body), encoding="utf-8", newline="\n")
    lagrange_source = ROOT / "data" / "lagrange-cover-certificate-5-4.json"
    LAGRANGE_OUTPUT.write_text(emit_lagrange(lagrange_source), encoding="utf-8", newline="\n")
    print(f"generated {OUTPUT}")
    print(f"generated {LAGRANGE_OUTPUT}")


if __name__ == "__main__":
    main()
