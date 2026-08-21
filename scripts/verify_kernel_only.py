#!/usr/bin/env python3
"""Fail-closed trust-zero audit for the kernel-only publication root."""

from __future__ import annotations

import argparse
import re
import subprocess
import sys
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]
LEAN = ROOT / "lean4"
SOURCE_ROOTS = (
    LEAN / "LatticePathOrders",
    LEAN / "LatticePathOrdersClassical",
    LEAN / "LatticePathOrdersKernel",
)
THEOREM_MAP = "LatticePathOrdersKernel/KernelTheoremMap.lean"
FORMULA_MAP = "LatticePathOrdersKernel/ManuscriptFormulaMap.lean"
AXIOM_AUDIT = "LatticePathOrdersKernel/KernelAxiomAudit.lean"
LEAN_MEMORY_MB = "30000"
AGGREGATE_MEMORY_MB = "32000"

STANDARD_AXIOMS = {"propext", "Classical.choice", "Quot.sound"}
PUBLICATION_ENDPOINTS = {
    "LatticePathOrdersKernel.publication_problem63_kernel",
    "LatticePathOrdersKernel.publication_problem63_minimality",
    "LatticePathOrdersKernel.publication_matching_source_identity",
    "LatticePathOrdersKernel.publication_lagrange_source_identity",
    "LatticePathOrdersKernel.publication_periodic_lagrange_formula",
    "LatticePathOrdersKernel.publication_problem65_constructive",
    "LatticePathOrdersKernel.publication_problem65_levels",
    "LatticePathOrdersKernel.publication_matching54_kernel",
    "LatticePathOrdersKernel.publication_matching1312_kernel",
    "LatticePathOrdersKernel.publication_lagrange54_kernel",
    "LatticePathOrdersKernel.publication_band_classes",
    "LatticePathOrdersKernel.publication_band_classes_size",
    "LatticePathOrdersKernel.publication_global_cover",
    "LatticePathOrdersKernel.publication_endpoint_parity",
    "LatticePathOrdersKernel.publication_nonlocal_family",
    "LatticePathOrdersKernel.publication_L_square",
    "LatticePathOrdersKernel.publication_code_recovery",
    "LatticePathOrdersKernel.publication_coefficient_code_recovery",
    "LatticePathOrdersKernel.publication_unique_rotation",
    "LatticePathOrdersKernel.publication_intrinsic_tile_cycle",
    "LatticePathOrdersKernel.publication_band_count",
    "LatticePathOrdersKernel.publication_band_count_near_diagonal",
    "LatticePathOrdersKernel.publication_band_class_semantics",
    "LatticePathOrdersKernel.publication_counter_value",
    "LatticePathOrdersKernel.publication_parity_normal_form",
    "LatticePathOrdersKernel.publication_unit_gap",
    "LatticePathOrdersKernel.publication_local_swap_RR",
    "LatticePathOrdersKernel.publication_local_swap_RU",
    "LatticePathOrdersKernel.publication_local_swap_UR",
    "LatticePathOrdersKernel.publication_local_swap_UU",
    "LatticePathOrdersKernel.publication_local_swap_RU_strict",
    "LatticePathOrdersKernel.publication_local_swap_UR_strict",
    "LatticePathOrdersKernel.publication_matching_bounds",
    "LatticePathOrdersKernel.publication_lagrange_bounds",
    "LatticePathOrdersKernel.publication_best_first_state",
    "LatticePathOrdersKernel.publication_best_first_termination",
    "LatticePathOrdersKernel.publication_best_first_complete",
    "LatticePathOrdersKernel.publication_matching_best_first_exists",
    "LatticePathOrdersKernel.publication_lagrange_best_first_exists",
    "LatticePathOrdersKernel.publication_antichain_matching",
    "LatticePathOrdersKernel.publication_antichain_lagrange",
    "LatticePathOrdersKernel.publication_three_E",
    "LatticePathOrdersKernel.publication_pell_extrema",
    "LatticePathOrdersKernel.publication_pell_extrema_away",
}

THEOREM_MAP_ENDPOINTS = PUBLICATION_ENDPOINTS | {
    "LatticePathOrdersClassical.squareSnakeIncident_iff_endpoints",
    "LatticePathOrdersClassical.squareSnakePerfectEquiv",
    "LatticePathOrdersClassical.squareSnakeNearFalseEquiv",
    "LatticePathOrdersClassical.squareSnakeNearTrueEquiv",
    "LatticePathOrdersClassical.periodicBackward_eq_neg_conjugate",
    "LatticePathOrdersClassical.standardPeriodicLagrangeValue_eq_gapMaximum",
    "LatticePathOrdersKernel.sourceMatchingNumber_eq_matchingScore",
    "LatticePathOrdersKernel.sourceLagrangeValue_sq_eq_lagrangeSq",
    "LatticePathOrdersKernel.problem63_path_band_noniso",
    "LatticePathOrdersKernel.problem63_actual_band_minimal_through_25",
}


def fail(message: str) -> None:
    raise SystemExit(f"[kernel-only-audit:error] {message}")


def run(*args: str) -> str:
    completed = subprocess.run(
        list(args), cwd=LEAN, text=True, encoding="utf-8", errors="replace",
        capture_output=True, check=False,
    )
    output = completed.stdout + completed.stderr
    if completed.returncode:
        fail(f"command failed ({' '.join(args)}):\n{output}")
    return output


def run_python_script(name: str, *args: str) -> None:
    completed = subprocess.run(
        [sys.executable, "-B", str(ROOT / "scripts" / name), *args],
        cwd=ROOT, text=True, encoding="utf-8", errors="replace",
        capture_output=True, check=False,
    )
    if completed.returncode:
        fail(f"{name} failed:\n{completed.stdout}{completed.stderr}")


def module_output(module: str) -> Path:
    return (
        LEAN / ".lake" / "build" / "lib" / "lean" /
        Path(*module.split(".")).with_suffix(".olean")
    )


def compile_module(module: str) -> None:
    source = Path(*module.split(".")).with_suffix(".lean")
    output = module_output(module)
    output.parent.mkdir(parents=True, exist_ok=True)
    run(
        "lake", "env", "lean", "--trust=0", "-M", LEAN_MEMORY_MB,
        "-o", str(output), str(source),
    )


def compile_module_recursive(module: str) -> None:
    """Compile one dependency at a time, preserving the 32 GB aggregate cap."""
    stack = [module]
    active = {module}
    while stack:
        current = stack[-1]
        source = Path(*current.split(".")).with_suffix(".lean")
        output = module_output(current)
        ilean = output.with_suffix(".ilean")
        output.parent.mkdir(parents=True, exist_ok=True)
        completed = subprocess.run(
            [
                "lake", "env", "lean", "--trust=0", "-M", LEAN_MEMORY_MB,
                "-o", str(output), "-i", str(ilean), str(source),
            ],
            cwd=LEAN, text=True, encoding="utf-8", errors="replace",
            capture_output=True, check=False,
        )
        if completed.returncode == 0:
            stack.pop()
            active.remove(current)
            continue
        output_text = completed.stdout + completed.stderr
        missing = re.search(
            r"object file '[^']+\.olean' of module ([A-Za-z0-9_.]+) does not exist",
            output_text,
        )
        if not missing:
            fail(f"direct compilation failed for {current}:\n{output_text}")
        dependency = missing.group(1)
        dependency_source = LEAN / Path(*dependency.split(".")).with_suffix(".lean")
        if not dependency_source.is_file():
            fail(f"missing source for dependency {dependency}")
        if dependency in active:
            fail(f"dependency cycle while compiling {current}: {dependency}")
        stack.append(dependency)
        active.add(dependency)


def scan_sources() -> None:
    forbidden = ("sorry", "admit", "native_decide", "Lean.trustCompiler")
    for source_root in SOURCE_ROOTS:
        for path in source_root.rglob("*.lean"):
            text = path.read_text(encoding="utf-8")
            for token in forbidden:
                if re.search(rf"\b{re.escape(token)}\b", text):
                    fail(f"forbidden token {token!r} in {path.relative_to(LEAN)}")
            declarations = re.findall(
                r"^\s*(axiom|opaque)\s+([A-Za-z0-9_']+)", text, re.M
            )
            if declarations:
                fail(
                    f"hidden declaration in {path.relative_to(LEAN)}: "
                    f"{declarations}"
                )


def build_kernel_root() -> None:
    # The committed minimality sources are already split into cache-sized
    # modules.  The resumable driver enforces the aggregate 32 GB cap.
    run_python_script(
        "build_minimality_lean.py", "--stage", "all", "--workers", "3",
        "--timeout-seconds", "3600", "--memory-cap-mb", AGGREGATE_MEMORY_MB,
    )

    # Establish small shared imports first.  The two 208-corner completeness
    # checks are then compiled strictly one at a time under a 30 GB hard cap.
    run(
        "lake", "build",
        "LatticePathOrdersKernel.BandCoordinateQuotient",
        "LatticePathOrdersKernel.Problem63GraphLeftTableValid",
        "LatticePathOrdersKernel.Problem63GraphRightTableValid",
        "LatticePathOrdersKernel.LiteralPathSnakeMatching",
        "LatticePathOrdersClassical.PeriodicStandardLagrange",
    )
    for module in (
        "LatticePathOrdersKernel.Problem63CoordinateLeftLocal",
        "LatticePathOrdersKernel.Problem63CoordinateLeftComplete",
        "LatticePathOrdersKernel.Problem63CoordinateLeftSurjective",
        "LatticePathOrdersKernel.Problem63CoordinateLeftAdjacency",
        "LatticePathOrdersKernel.Problem63CoordinateRightLocal",
        "LatticePathOrdersKernel.Problem63CoordinateRightComplete",
        "LatticePathOrdersKernel.Problem63CoordinateRightSurjective",
        "LatticePathOrdersKernel.Problem63CoordinateRightAdjacency",
        "LatticePathOrdersKernel.Problem63CoordinateCertificates",
        "LatticePathOrdersKernel.Problem63BandNoniso",
        "LatticePathOrdersKernel.LagrangeOrderBridge",
        "LatticePathOrdersKernel.Problem63Data",
        "LatticePathOrdersKernel.Problem63Root",
        "LatticePathOrdersKernel.Problem63MinimalityRoot",
    ):
        compile_module(module)

    run(
        "lake", "build",
        "LatticePathOrdersKernel.Problem65MatchingExamples",
        "LatticePathOrdersKernel.Problem65LagrangeExample",
    )
    compile_module_recursive("LatticePathOrdersKernel.KernelPublicationRoot")


def names_in_output(output: str) -> set[str]:
    return set(re.findall(r"^'?([A-Za-z0-9_.]+)'?(?:\.\{[^}]+\})?(?:\s|:)", output, re.M))


def audit_theorem_map(output: str) -> None:
    missing = sorted(THEOREM_MAP_ENDPOINTS - names_in_output(output))
    if missing:
        fail(f"theorem map is missing declarations: {missing}")


def audit_formula_map() -> None:
    paper = (ROOT / "paper" / "lattice_path_orders.tex").read_text(encoding="utf-8")
    formula_map = (LEAN / FORMULA_MAP).read_text(encoding="utf-8")
    paper_labels = set(re.findall(r"\\label\{((?:thm|lem|prop|cor|eq):[^}]+)\}", paper))
    mapped_labels = set(re.findall(r"^-- ((?:thm|lem|prop|cor|eq):\S+)", formula_map, re.M))
    missing = sorted(paper_labels - mapped_labels)
    extra = sorted(mapped_labels - paper_labels)
    if missing or extra:
        fail(f"formula-map mismatch: missing={missing}, extra={extra}")


def audit_axioms(output: str) -> None:
    seen_endpoints = set(
        re.findall(r"^'([^']+)' (?:depends|does not depend)", output, re.M)
    )
    missing = sorted(PUBLICATION_ENDPOINTS - seen_endpoints)
    if missing:
        fail(f"axiom audit is missing endpoints: {missing}")
    seen_axioms: set[str] = set()
    for payload in re.findall(r"depends on axioms:\s*\[([^\]]*)\]", output):
        seen_axioms.update(a.strip() for a in payload.split(",") if a.strip())
    unexpected = sorted(seen_axioms - STANDARD_AXIOMS)
    if unexpected:
        fail(f"unexpected axiom dependencies: {unexpected}")


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument(
        "--audit-only", action="store_true",
        help="reuse current OLean caches and run only source/map/axiom audits",
    )
    args = parser.parse_args()
    scan_sources()
    if not args.audit_only:
        build_kernel_root()
    theorem_output = run(
        "lake", "env", "lean", "--trust=0", "-M", LEAN_MEMORY_MB,
        "-q", THEOREM_MAP,
    )
    audit_theorem_map(theorem_output)
    audit_formula_map()
    run(
        "lake", "env", "lean", "--trust=0", "-M", LEAN_MEMORY_MB,
        "-q", FORMULA_MAP,
    )
    axiom_output = run(
        "lake", "env", "lean", "--trust=0", "-M", LEAN_MEMORY_MB,
        "-q", AXIOM_AUDIT,
    )
    audit_axioms(axiom_output)
    print(
        "[kernel-only-audit:ok] source scan, theorem map, trust=0, "
        "exact formula map, publication endpoints, and zero project axioms"
    )


if __name__ == "__main__":
    main()
