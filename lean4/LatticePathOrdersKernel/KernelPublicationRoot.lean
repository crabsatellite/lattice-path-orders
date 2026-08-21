import LatticePathOrdersKernel.Problem63Root
import LatticePathOrdersKernel.Problem63MinimalityRoot
import LatticePathOrdersKernel.Problem65Root
import LatticePathOrdersKernel.Problem65MatchingExamples
import LatticePathOrdersKernel.Problem65LagrangeExample
import LatticePathOrdersKernel.ManuscriptEndpoints

/-!
# Axiom-free publication root
-/

namespace LatticePathOrdersKernel

def publication_problem63_kernel := problem63_kernel_counterexample

def publication_problem63_minimality := @problem63_actual_band_minimal_through_25

def publication_matching_source_identity := sourceMatchingNumber_eq_matchingScore

def publication_lagrange_source_identity := @sourceLagrangeValue_sq_eq_lagrangeSq

def publication_periodic_lagrange_formula :=
  @LatticePathOrdersClassical.standardPeriodicLagrangeValue_eq_gapMaximum

def publication_problem65_constructive := @problem65_constructive

def publication_problem65_levels := @problem65_level_characterization

def publication_matching54_kernel := matching54_source_cover

def publication_matching1312_kernel := matching1312_source_cover

def publication_lagrange54_kernel := lagrange54_source_cover

/-! Full-manuscript numbered endpoints. -/

def publication_band_classes := @manuscript_thm_band_classes
def publication_band_classes_size := @manuscript_thm_band_classes_size_at_most_two
def publication_global_cover := @manuscript_thm_global_cover
def publication_endpoint_parity := @manuscript_thm_parity
def publication_nonlocal_family := @manuscript_thm_nonlocal
def publication_L_square := @manuscript_eq_L_square
def publication_code_recovery := @manuscript_lem_code_recovery
def publication_coefficient_code_recovery :=
  @manuscript_lem_coefficient_code_recovery
def publication_unique_rotation := @manuscript_lem_unique_rotation
def publication_intrinsic_tile_cycle := @manuscript_lem_intrinsic_tile_cycle
def publication_band_count := @manuscript_cor_band_count
def publication_band_count_near_diagonal := @manuscript_cor_band_count_near_diagonal
def publication_band_class_semantics := @carrierTau_orbitRel_iff_bandIso
def publication_counter_value := manuscript_eq_counter_value
def publication_parity_normal_form := @manuscript_eq_parity_normal_form
def publication_unit_gap := @manuscript_cor_unit_gap
def publication_local_swap_RR := @manuscript_prop_local_swap_RR
def publication_local_swap_RU := @manuscript_prop_local_swap_RU
def publication_local_swap_UR := @manuscript_prop_local_swap_UR
def publication_local_swap_UU := @manuscript_prop_local_swap_UU
def publication_local_swap_RU_strict := @manuscript_prop_local_swap_RU_strict
def publication_local_swap_UR_strict := @manuscript_prop_local_swap_UR_strict
def publication_matching_bounds := @manuscript_eq_M_bounds
def publication_lagrange_bounds := @manuscript_eq_L_bounds
def publication_best_first_state := @operationalBestFirstStep_valid
def publication_best_first_termination :=
  @operationalBestFirst_reaches_terminal_from
def publication_best_first_complete := @manuscript_lem_best_first_complete
def publication_matching_best_first_exists :=
  @exists_matching_completeOperationalBestFirstRun
def publication_lagrange_best_first_exists :=
  @exists_lagrange_completeOperationalBestFirstRun
def publication_antichain_matching := @manuscript_prop_antichain_matching
def publication_antichain_lagrange := @manuscript_prop_antichain_lagrange
def publication_three_E := @manuscript_eq_three_E
def publication_pell_extrema := @manuscript_lem_pell_extrema
def publication_pell_extrema_away := @manuscript_lem_pell_extrema_away

end LatticePathOrdersKernel
