# Lean formalization

This directory is the kernel-checking layer for the manuscript.  The canonical
publication modules are split into source/classical mathematics and
project-local mathematics:

- `LatticePathOrdersClassical/` contains premise-free classical source proofs;
- `LatticePathOrdersKernel/KernelPublicationRoot.lean` contains only earned
  theorem composition;
- `LatticePathOrdersKernel/KernelTheoremMap.lean` lists the manuscript-facing
  declarations;
- `LatticePathOrdersKernel/ManuscriptFormulaMap.lean` maps every numbered
  manuscript label to its exact kernel endpoint;
- `LatticePathOrdersKernel/KernelAxiomAudit.lean` reports the exact trust
  boundary;
- finite witnesses are data consumed by executable definitions and theorem
  proofs, never theorem-valued assumptions.

There are no Reference Gates in the canonical root.  The matching score is the
cardinality of explicit edge selections on a finite square snake, with a
kernel-checked local recurrence.  The Lagrange score is the standard maximum
of forward-plus-backward periodic cut values; reversal-transpose and conjugate
lemmas derive the trace/minimum-denominator formula.  The legacy
`LatticePathOrders/ReferenceGate.lean` name is now an axiom-free compatibility
module for older generated sources and is not imported by the canonical root.

The current root closes the core formal targets:

- the exact Problem 6.3 counterexample;
- the bounded minimality theorem for every coprime endpoint of total length at
  most 25, replaying 934,635 path leaves in balanced cached modules;
- the unconditional sound-and-complete finite-certificate characterization
  of Problem 6.5 for every linearly ordered score on `D(a,b)`;
- consecutive realized levels and their complete-bipartite cover blocks;
- entrywise matching-prefix bounds and all four local-swap identities;
- the committed matching certificates on `D(5,4)` and `D(13,12)` and the
  committed Lagrange certificate on `D(5,4)`, including the literal JSON
  values, carrier partitions, interval exclusions, and semantic endpoints;
- the intrinsic tile-cycle lemma and the complete literal band-isomorphism
  classification, including the total-length 3 and 4 boundary cases;
- the coprime carrier count, reflection fixed-point count, Burnside band-class
  formula, and the near-diagonal Catalan specialization;
- the endpoint-parity and unit-gap theorems, uniform matching and Lagrange
  prefix bounds, operational best-first traversals with literal frontier
  expand/emit transitions and a kernel-checked termination potential, both prefix-antichain iff
  criteria, the exact three-`E` expansion, the Pell extrema, and the full
  nonlocal cover family with its initial-level classification.

The manuscript-facing bridges use the literal objects printed in the paper:
the `11`/`2` coefficient word has an explicit kernel-checked decoder, the
parity normal form uses the signed integer exponent `b-a`, and the displayed
counterexample value is stated for the square of the real periodic Lagrange
value rather than only for its rational comparison cache.

Every numbered manuscript result is now an endpoint of the Lean publication
root.  The exact label correspondence is recorded in `../FORMULA_MAP.md` and
the machine-readable map named above.

The minimality certificate deliberately uses small compilation units.  Score
classes are stored in leaves of a balanced `ClassTable`; every leaf proves its
own order, every merge proves only its boundary, and path assignments are
partitioned into at most 64 leaves per region, four regions per part, and 16
cached parts per lightweight aggregation group.  A separate compact
`PrefixPartitionTree` checks global carrier coverage without repeating a
linear membership scan through all region prefixes.  The frontier and endpoint
aggregation layers are serialized with the full 30,000 MB Lean allowance; all
lower class, part, and group caches remain independently reusable.  The
resumable builder records source hashes, enters the Lake environment once, and
compiles each module directly with the same Lean executable and `--trust=0`,
so an interrupted or local rebuild does not repay unrelated certificate work
or repeated Lake startup cost.  Its default 32,000 MB aggregate budget reserves
2,000 MB for the driver and enforces the remaining per-worker shares with
Lean's `-M` option; a stage with only one or two active jobs receives the
unused worker shares while keeping the same aggregate ceiling.  The
publication-root, theorem-map, and axiom-audit
invocations are single-process and use a 30,000 MB `-M` limit under the same
32,000 MB budget.

`MinimalityClassTable.lean` is a separate cache boundary from
`MinimalityCertificate.lean`.  Each assignment leaf stores an explicit
orientation and rotation taking its turn code to the class anchor; Lean checks
that witness directly instead of searching the whole dihedral orbit.  Score
and orbit data are still recomputed in the kernel.
