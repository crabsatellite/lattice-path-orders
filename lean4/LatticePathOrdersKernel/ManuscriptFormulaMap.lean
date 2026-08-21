import LatticePathOrdersKernel.ManuscriptEndpoints

/-!
# Exact manuscript label map

Every numbered theorem, lemma, proposition, corollary, and equation in
`paper/lattice_path_orders.tex` is listed below.  Labels with several displayed
cases intentionally map to several kernel endpoints.
-/

-- thm:band-classes
#check LatticePathOrdersKernel.manuscript_thm_band_classes
#check LatticePathOrdersKernel.manuscript_thm_band_classes_size_at_most_two

-- thm:counterexample
#check LatticePathOrdersKernel.manuscript_thm_counterexample

-- thm:global-cover
#check LatticePathOrdersKernel.manuscript_thm_global_cover

-- thm:parity
#check LatticePathOrdersKernel.manuscript_thm_parity

-- thm:nonlocal
#check LatticePathOrdersKernel.manuscript_thm_nonlocal

-- eq:L-square
#check LatticePathOrdersKernel.manuscript_eq_L_square

-- lem:code-recovery
#check LatticePathOrdersKernel.decodeCoefficientCode_encode
#check LatticePathOrdersKernel.cyclicCoefficientWord_eq_iff_turnCode_eq
#check LatticePathOrdersKernel.closedTurnCode_recovers_up_to_flip
#check LatticePathOrdersKernel.manuscript_lem_code_recovery
#check LatticePathOrdersKernel.manuscript_lem_coefficient_code_recovery

-- lem:unique-rotation
#check LatticePathOrdersKernel.manuscript_lem_unique_rotation

-- lem:tile-cycle
#check LatticePathOrdersKernel.manuscript_lem_intrinsic_tile_cycle

-- cor:band-count (general and near-diagonal displays)
#check LatticePathOrdersKernel.manuscript_cor_band_count
#check LatticePathOrdersKernel.manuscript_cor_band_count_near_diagonal
#check LatticePathOrdersKernel.carrierTau_orbitRel_iff_bandIso

-- eq:counter-value
#check LatticePathOrdersKernel.manuscript_eq_counter_value

-- prop:minimal
#check LatticePathOrdersKernel.manuscript_prop_minimal

-- eq:parity-normal-form
#check LatticePathOrdersKernel.manuscript_eq_parity_normal_form
#check LatticePathOrdersKernel.fSignedPow_difference_eq_natural_form

-- cor:unit-gap
#check LatticePathOrdersKernel.manuscript_cor_unit_gap

-- prop:local-swap (four rows and the two strict signs)
#check LatticePathOrdersKernel.manuscript_prop_local_swap_RR
#check LatticePathOrdersKernel.manuscript_prop_local_swap_RU
#check LatticePathOrdersKernel.manuscript_prop_local_swap_UR
#check LatticePathOrdersKernel.manuscript_prop_local_swap_UU
#check LatticePathOrdersKernel.manuscript_prop_local_swap_RU_strict
#check LatticePathOrdersKernel.manuscript_prop_local_swap_UR_strict

-- eq:M-bounds
#check LatticePathOrdersKernel.manuscript_eq_M_bounds

-- eq:L-lower
-- eq:L-upper
#check LatticePathOrdersKernel.manuscript_eq_L_bounds

-- lem:best-first
#check LatticePathOrdersKernel.operationalBestFirstStep_valid
#check LatticePathOrdersKernel.operationalBestFirst_reaches_terminal_from
#check LatticePathOrdersKernel.manuscript_lem_best_first_complete
#check LatticePathOrdersKernel.exists_matching_completeOperationalBestFirstRun
#check LatticePathOrdersKernel.exists_lagrange_completeOperationalBestFirstRun

-- prop:antichain
#check LatticePathOrdersKernel.manuscript_prop_antichain_matching
#check LatticePathOrdersKernel.manuscript_prop_antichain_lagrange

-- eq:three-E
#check LatticePathOrdersKernel.manuscript_eq_three_E

-- lem:pell-extrema
#check LatticePathOrdersKernel.manuscript_lem_pell_extrema
#check LatticePathOrdersKernel.manuscript_lem_pell_extrema_away
