# Lagrange Collisions and Cover Relations for Rational Dyck Paths

This repository contains the manuscript, exact finite certificates,
reproducibility scripts, and a premise-free Lean 4 formalization of the
paper's numbered results.

## Main results

- Two paths in `D(17,9)` have the same periodic Lagrange value but
  nonisomorphic band graphs, answering Schiffler's Problem 6.3 negatively.
- Two independent enumerations, replayed by Lean, prove computational
  minimality through total length 25.
- Exact matching and Lagrange prefix bounds yield an operational best-first
  traversal of every fixed endpoint and a necessary-and-sufficient finite
  prefix-antichain certificate for every cover relation.
- Band-graph isomorphism classes are classified as the orbits of an explicit
  involution and counted by a closed Burnside formula.
- Endpoint parity, unit-gap covers, exact local-swap formulas, and an
  unbounded-distance family of matching covers are proved uniformly.

## Formal verification

The publication root is
`lean4/LatticePathOrdersKernel/KernelPublicationRoot.lean`. It contains no
project axiom, Reference Gate, `sorry`, `admit`, opaque theorem, or native
evaluation bridge. Every numbered theorem, lemma, proposition, corollary, and
displayed formula in the manuscript is listed in `FORMULA_MAP.md` and in the
machine-readable Lean formula map.

The best-first result is formalized as an actual frontier transition system:
a selected nonleaf is replaced by precisely its feasible children, while a
selected leaf is appended to the output. A strictly decreasing ternary
potential proves termination, and the terminal output is a score-sorted
permutation of all carrier paths.

The final axiom report for the publication endpoints contains only Lean's
standard `propext`, `Classical.choice`, and `Quot.sound` principles.

## Contents

- `paper/`: canonical TeX manuscript and bibliography.
- `paper/Li_Lattice_Path_Orders_2026.pdf`: camera-ready manuscript PDF.
- `lean4/`: complete Lean source tree and generated kernel certificates.
- `data/`: exact certificate and enumeration data.
- `scripts/`: independent checkers, generators, cached Lean builder, and
  paper build script.
- `FORMULA_MAP.md`: paper-label to Lean-declaration correspondence.
- `REPRODUCIBILITY.md`: exact verification and build commands.

## Reproduction

From the repository root:

```powershell
python scripts\verify_release.py
python scripts\verify_lean.py
powershell -NoProfile -ExecutionPolicy Bypass -File scripts\build_paper.ps1
```

The expected Lean audit receipt is:

```text
[kernel-only-audit:ok] source scan, theorem map, trust=0, exact formula map,
publication endpoints, and zero project axioms
```

## Prebuilt Lean cache

Release `v1.0.0` includes source-bound project cache shards, a SHA-256
manifest, and the camera-ready PDF. The cache contains only `.olean`,
`.ilean`, `.trace`, and `.hash` artifacts corresponding to the public Lean
transitive closure; it does not bundle Mathlib or abandoned/internal modules.

On a checkout of the release tag, obtain Mathlib's upstream cache first, then
download and install the project cache:

```powershell
Set-Location lean4
lake exe cache get
Set-Location ..
New-Item -ItemType Directory -Force cache-assets | Out-Null
gh release download v1.0.0 --repo crabsatellite/lattice-path-orders `
  --dir cache-assets --pattern "lattice-path-orders-lean-cache-v1.0.0-*"
python -B scripts\install_release_cache.py --asset-dir cache-assets
```

The installer fails closed on a commit or toolchain mismatch, verifies every
shard before extraction, and then verifies every installed cache file against
the release manifest. `scripts/package_release_cache.py` reproduces the
sharding and manifest generation from a fully built public checkout.

The canonical repository is
[crabsatellite/lattice-path-orders](https://github.com/crabsatellite/lattice-path-orders).
Versioned releases are archived through Zenodo.

## Licensing

See `LICENSE.md`. Lean sources, verification scripts, data, and repository
documentation are Apache-2.0; manuscript source and rendered PDFs are CC BY
4.0.
