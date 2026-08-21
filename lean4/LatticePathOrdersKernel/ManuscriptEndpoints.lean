import LatticePathOrdersKernel.OperationalBestFirstTermination
import LatticePathOrdersKernel.Problem63SourceValue
import LatticePathOrdersKernel.Problem63MinimalityRoot
import LatticePathOrdersKernel.Problem65Root
import LatticePathOrdersKernel.SignedParityNormalForm
import LatticePathOrdersKernel.CoefficientTurnCode
import LatticePathOrdersKernel.BandCountCatalan
import LatticePathOrdersKernel.BandClassOrbitSemantics
import LatticePathOrdersKernel.LocalSwap
import LatticePathOrdersKernel.PellExtrema
import LatticePathOrdersKernel.PellMatrixExpansion
import LatticePathOrdersKernel.InitialLevelsTheorem

namespace LatticePathOrdersKernel

open LatticePathOrders

def manuscript_thm_counterexample := problem63_kernel_counterexample

def manuscript_prop_minimal := @problem63_actual_band_minimal_through_25

def manuscript_eq_L_square := @sourceLagrangeValue_sq_eq_lagrangeSq

def manuscript_lem_code_recovery :=
  @carrier_turnCode_dihedral_implies_path_dihedral

def manuscript_lem_coefficient_code_recovery :=
  @carrier_coefficientBlocks_dihedral_implies_path_dihedral

def manuscript_lem_unique_rotation := @unique_admissible_rotation

def manuscript_eq_parity_normal_form := @matching_parity_signed_normal_form

def manuscript_thm_parity := @matchingScore_even_iff_three_dvd_difference

def manuscript_cor_unit_gap := @sourceMatchingNumber_unit_gap_cover

def manuscript_prop_local_swap_RR := @localSwap_RR
def manuscript_prop_local_swap_RU := @localSwap_RU
def manuscript_prop_local_swap_UR := @localSwap_UR
def manuscript_prop_local_swap_UU := @localSwap_UU
def manuscript_prop_local_swap_RU_strict := @localSwap_RU_strict
def manuscript_prop_local_swap_UR_strict := @localSwap_UR_strict

def manuscript_eq_M_bounds := @LatticePathOrders.matching_prefix_bound_sound

def manuscript_eq_L_bounds := @lagrange_prefix_bounds_sound

def manuscript_lem_best_first_state := @bestFirst_emission_order_and_batch

def manuscript_lem_best_first_complete :=
  @completeOperationalBestFirstRun_sorted_complete

def manuscript_prop_antichain_matching := @matching_cover_iff_prefix_antichain

def manuscript_prop_antichain_lagrange := @lagrange_cover_iff_prefix_antichain

def manuscript_eq_three_E := @three_E_formula

def manuscript_lem_pell_extrema := @pell_extrema

def manuscript_lem_pell_extrema_away := @pell_extrema_away

def manuscript_eq_counter_value := problem63_sourceLagrangeValue_sq_exact

structure GlobalCoverTheoremCertificate (a b : Nat) : Prop where
  matching_traversal :
    ∃ output, CompleteOperationalBestFirstRun a b matchingScore
      (matchingBestFirstKey (a + b)) output
  lagrange_traversal :
    ∃ output, CompleteOperationalBestFirstRun a b lagrangeSq
      (lagrangeBestFirstKey (a + b)) output
  matching_levels : ∀ {x y : Path}, Carrier a b x → Carrier a b y →
    (PullbackCover (Carrier a b) matchingScore x y ↔
      ConsecutiveRealizedLevels (Carrier a b) matchingScore
        (matchingScore x) (matchingScore y))
  lagrange_levels : ∀ {x y : Path}, Carrier a b x → Carrier a b y →
    (PullbackCover (Carrier a b) lagrangeSq x y ↔
      ConsecutiveRealizedLevels (Carrier a b) lagrangeSq
        (lagrangeSq x) (lagrangeSq y))
  matching_antichain : ∀ {x y : Path}, Carrier a b x → Carrier a b y →
    matchingScore x < matchingScore y →
    (PullbackCover (Carrier a b) matchingScore x y ↔
      ∃ frontier,
        PathPrefixAntichain frontier ∧
        FrontierCovers (Carrier a b) frontier ∧
        (∀ p ∈ frontier, p ≠ []) ∧
        MatchingFrontierOutside (a := a) (b := b) x y frontier)
  lagrange_antichain : ∀ {x y : Path}, Carrier a b x → Carrier a b y →
    lagrangeSq x < lagrangeSq y →
    (PullbackCover (Carrier a b) lagrangeSq x y ↔
      ∃ frontier,
        PathPrefixAntichain frontier ∧
        FrontierCovers (Carrier a b) frontier ∧
        (∀ p ∈ frontier, p ≠ []) ∧
        LagrangeFrontierOutside (a := a) (b := b) x y frontier)

theorem manuscript_thm_global_cover
    {a b : Nat} (ha : 0 < a) (hb : 0 < b) :
    GlobalCoverTheoremCertificate a b where
  matching_traversal :=
    exists_matching_completeOperationalBestFirstRun ha hb
  lagrange_traversal :=
    exists_lagrange_completeOperationalBestFirstRun ha hb
  matching_levels := fun hx hy => problem65_level_characterization hx hy
  lagrange_levels := fun hx hy => problem65_level_characterization hx hy
  matching_antichain := fun hx hy hxy =>
    matching_cover_iff_prefix_antichain ha hx hy hxy
  lagrange_antichain := fun hx hy hxy =>
    lagrange_cover_iff_prefix_antichain ha hb hx hy hxy

end LatticePathOrdersKernel
