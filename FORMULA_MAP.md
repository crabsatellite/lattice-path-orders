# Manuscript-to-Lean formula map

Canonical manuscript: `paper/lattice_path_orders.tex`  
Kernel namespace: `LatticePathOrdersKernel`

Every entry below is imported by `KernelPublicationRoot.lean`.  A row with
multiple Lean constants corresponds to a displayed result with multiple cases
or two score specializations; it is not a weaker replacement statement.

| Paper label | Exact Lean endpoint(s) | Correspondence |
|---|---|---|
| `thm:band-classes` | `manuscript_thm_band_classes`; `manuscript_thm_band_classes_size_at_most_two` | Literal `PathBandIso` iff equality or `tau`, plus the at-most-two conclusion. |
| `thm:counterexample` | `manuscript_thm_counterexample` | Both carrier facts, equality of the source Lagrange values, and nonisomorphism of the literal quotient bands. |
| `thm:global-cover` | `manuscript_thm_global_cover` | Constructed complete matching/Lagrange best-first runs, consecutive-level characterizations, and both prefix-antichain iff criteria. |
| `thm:parity` | `manuscript_thm_parity` | The literal matching number is even iff `3 ∣ a-b`; hence the parity is endpoint-dependent only. |
| `thm:nonlocal` | `manuscript_thm_nonlocal` | Cover, Hamming distance `2n-6`, the first `n` singleton levels, their displayed block words and order, and uniqueness/exhaustion. |
| `eq:L-square` | `manuscript_eq_L_square` | Square of the source periodic Lagrange value equals the exact rational `lagrangeSq`, whose numerator and denominator are the displayed trace discriminant and `qMin²`. |
| `lem:code-recovery` | `decodeCoefficientCode_encode`; `cyclicCoefficientWord_eq_iff_turnCode_eq`; `manuscript_lem_code_recovery`; `manuscript_lem_coefficient_code_recovery` | The literal `11`/`2` coefficient encoding has a kernel-checked left inverse; cyclic turn-code and canonically parsed coefficient-block symmetries recover a word up to complement, and unequal fixed endpoint counts eliminate complement. |
| `lem:unique-rotation` | `manuscript_lem_unique_rotation` | Exactly one `Fin word.length` rotation lies in `Carrier a b`. |
| `lem:tile-cycle` | `manuscript_lem_intrinsic_tile_cycle` | Literal quotient-band isomorphism iff the closed equality/difference codes are dihedrally related, including totals 3 and 4. |
| `cor:band-count` | `manuscript_cor_band_count`; `manuscript_cor_band_count_near_diagonal`; `carrierTau_orbitRel_iff_bandIso` | The counted orbit quotient is exactly band isomorphism; the general piecewise `R_{a,b}` formula and Catalan specialization are both proved. |
| `eq:counter-value` | `manuscript_eq_counter_value` | The squares of both literal real periodic Lagrange values equal the displayed rational number `401364347302339644605 / 39219898323948748849`. |
| `prop:minimal` | `manuscript_prop_minimal` | Every coprime endpoint of total length at most 25 has no Lagrange-equal, band-nonisomorphic pair. |
| `eq:parity-normal-form` | `manuscript_eq_parity_normal_form`; `fSignedPow_difference_eq_natural_form` | The adjacency product over `F₂` is literally `fSignedPow ((b:Int)-(a:Int)) * S`; its equality with the natural residue representative `fPow (b+2a) * S` is proved in the kernel. |
| `cor:unit-gap` | `manuscript_cor_unit_gap` | A literal source matching-number gap of two is a pullback cover. |
| `prop:local-swap` | `manuscript_prop_local_swap_RR`, `_RU`, `_UR`, `_UU`, `_RU_strict`, `_UR_strict` | All four displayed matrix formulas and both asserted strict signs. |
| `eq:M-bounds` | `manuscript_eq_M_bounds` | Every completion lies between the literal `Pα D^r` and `Pα E^r` upper-left entries. |
| `eq:L-lower`, `eq:L-upper` | `manuscript_eq_L_bounds` | The displayed trace/denominator lower bound and Fibonacci-denominator upper bound, with exact leaf replacement. |
| `lem:best-first` | `operationalBestFirstStep_valid`; `operationalBestFirst_reaches_terminal_from`; `manuscript_lem_best_first_complete`; `exists_matching_completeOperationalBestFirstRun`; `exists_lagrange_completeOperationalBestFirstRun` | The literal expand/emit transitions preserve the frontier/output invariant; a strictly decreasing ternary potential proves termination; terminal outputs are sorted permutations of all carrier paths for both manuscript keys. |
| `prop:antichain` | `manuscript_prop_antichain_matching`; `manuscript_prop_antichain_lagrange` | The finite prefix-antichain interval-exclusion certificate is necessary and sufficient for both orders. |
| `eq:three-E` | `manuscript_eq_three_E` | Exact Pell expansion with the `P₋₁=1` convention represented by `pellPrevious 0`. |
| `lem:pell-extrema` | `manuscript_lem_pell_extrema`; `manuscript_lem_pell_extrema_away` | Upper/lower extrema, exact equality positions, and the away-from-extrema `f(4)` bound. |

The machine-readable version of this table is
`lean4/LatticePathOrdersKernel/ManuscriptFormulaMap.lean`.
