# Reproducibility

Run commands from the project root with Python 3.11 or newer.

## Core theorem and certificate suite

    python scripts\verify_release.py

The expected terminal line is `release verification passed`. The suite checks
the standalone Problem 6.3 pair, the matching subset expansion through
`D(13,12)`, both best-first orders for all 59 coprime endpoints of total
length at most 19, 713,704 two-sided prefix-bound incidences, the Pell audit
through `n=30`, the nonlocal-family exhaustion through `n=12`, and all three
committed cover certificates.

## Lean publication root

    python scripts\generate_lean_certificates.py
    python scripts\generate_minimality_lean.py
    python scripts\build_minimality_lean.py --stage all --workers 3
    python scripts\verify_lean.py

The generator records the SHA-256 hash and literal contents of every committed
certificate in Lean source.  The minimality generator emits balanced class
chunks, merge-boundary proofs, bounded prefix-region parts, and compact
prefix-partition tries for 99
endpoints, 934,635 path leaves, 471,455 score classes, and 22,569 regions.
The resumable builder caches each source hash together with the hashes of all
direct dependency sources, enters the project Lake environment once, and
invokes the same Lean executable on every module with `--trust=0`.  An
unchanged dependency may therefore be recompiled without invalidating
thousands of unchanged consumers merely because its `.olean` timestamp moved.
Its default aggregate memory budget is 32,000 MB: 2,000 MB is
reserved for the driver and the balance is divided into hard Lean `-M` limits
for the workers actually active in each stage (10,000 MB each for three jobs,
15,000 MB each for two, or 30,000 MB for a one-file root stage).
The large compact-frontier and endpoint aggregation layers are intentionally
serialized with the 30,000 MB Lean allowance; this preserves the 32,000 MB
aggregate ceiling while retaining all lower class/part/group caches.
`verify_lean.py` delegates to the kernel-only verifier.  The audit reuses the
committed split minimality sources, rebuilds the root in cache order, checks
the theorem map and the exact TeX-label formula map, rejects `sorry`, `admit`,
`native_decide`, every project
`axiom`, and every project `opaque`, and replays
the axiom report with `--trust=0`.  Each of those final single-process Lean
invocations has a 30,000 MB hard limit, leaving 2,000 MB within the same
32,000 MB process budget.  The publication root contains every numbered
manuscript theorem, lemma, proposition, corollary, and equation; the exact
correspondence is in `FORMULA_MAP.md` and
`lean4/LatticePathOrdersKernel/ManuscriptFormulaMap.lean`.  The expected terminal line begins
`[kernel-only-audit:ok]`.

## Independent shortest-length searches

    python scripts\scan_problem_6_3.py --max-total 25 --output data\problem-6-3-through-25.json
    g++ -O3 -std=c++20 scripts\search_problem_6_3.cpp -o tmp\bin\search_problem_6_3.exe
    tmp\bin\search_problem_6_3.exe --max-total 25 --output data\problem-6-3-cpp-through-25.json
    tmp\bin\search_problem_6_3.exe --max-total 31 --output data\problem-6-3-through-31.json

The last command deliberately exits with status `2` after finding the
counterexample. The two length-25 receipts both report 99 endpoints, 934,635
paths, and no counterexample. The length-31 search stops after completing
`D(15,11)` and finding the displayed pair in `D(17,9)`.

An optional hostile audit of the band-graph normal form uses NetworkX 3.6 or
newer:

    python scripts\audit_band_graph_isomorphism.py --max-total 14

It builds the literal Definition 4.1 graphs and compares all 29,460
within-endpoint pairs, rather than assuming that the turn code is canonical.

## Paper

    powershell -NoProfile -ExecutionPolicy Bypass -File scripts\build_paper.ps1

The script runs BibTeX and sufficient `pdflatex` passes, fails closed on
undefined references, overfull boxes, or LaTeX errors, and writes
`output/pdf/lattice_path_orders.pdf`.
