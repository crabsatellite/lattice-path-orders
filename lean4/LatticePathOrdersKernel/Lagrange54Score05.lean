import LatticePathOrdersKernel.Lagrange54Data

set_option maxRecDepth 100000
set_option maxHeartbeats 8000000
set_option linter.unusedSimpArgs false

namespace LatticePathOrdersKernel

open LatticePathOrders

theorem lagrange54_score_05 :
    lagrangeSq (mustParsePath "RRRUURURU") = ((11390621 : Rat) / (1113025 : Rat)) := by
  unfold lagrangeSq
  rw [show lagrangeNumerator (mustParsePath "RRRUURURU") = 11390621 by decide]
  rw [show qMin (cyclicDigits (mustParsePath "RRRUURURU")) = 1055 by decide]
  norm_num

theorem lagrange54_score_05_length : (mustParsePath "RRRUURURU").length = 9 := by
  decide

theorem lagrange54_score_05_lower :
    lagrangeLower 9 (mustParsePath "RRRUURURU") = ((11390621 : Rat) / (1113025 : Rat)) := by
  simp only [lagrangeLower, lagrange54_score_05_length, if_pos, lagrange54_score_05]

theorem lagrange54_score_05_upper :
    lagrangeUpper 9 (mustParsePath "RRRUURURU") = ((11390621 : Rat) / (1113025 : Rat)) := by
  simp only [lagrangeUpper, lagrange54_score_05_length, if_pos, lagrange54_score_05]

theorem lagrange54_score_05_bound :
    lagrangeBound 9 (mustParsePath "RRRUURURU") =
      { pathPrefix := mustParsePath "RRRUURURU", lower := ((11390621 : Rat) / (1113025 : Rat)),
        upper := ((11390621 : Rat) / (1113025 : Rat)) } := by
  simp only [lagrangeBound, lagrange54_score_05_lower, lagrange54_score_05_upper]

theorem lagrange54_score_05_exact :
    exactBound lagrangeSq (mustParsePath "RRRUURURU") =
      { pathPrefix := mustParsePath "RRRUURURU", lower := ((11390621 : Rat) / (1113025 : Rat)),
        upper := ((11390621 : Rat) / (1113025 : Rat)) } := by
  simp only [exactBound, lagrange54_score_05]

end LatticePathOrdersKernel

