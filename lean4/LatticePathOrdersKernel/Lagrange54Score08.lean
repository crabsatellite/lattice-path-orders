import LatticePathOrdersKernel.Lagrange54Data

set_option maxRecDepth 100000
set_option maxHeartbeats 8000000
set_option linter.unusedSimpArgs false

namespace LatticePathOrdersKernel

open LatticePathOrders

theorem lagrange54_score_08 :
    lagrangeSq (mustParsePath "RRRURURUU") = ((11390621 : Rat) / (1113025 : Rat)) := by
  unfold lagrangeSq
  rw [show lagrangeNumerator (mustParsePath "RRRURURUU") = 11390621 by decide]
  rw [show qMin (cyclicDigits (mustParsePath "RRRURURUU")) = 1055 by decide]
  norm_num

theorem lagrange54_score_08_length : (mustParsePath "RRRURURUU").length = 9 := by
  decide

theorem lagrange54_score_08_lower :
    lagrangeLower 9 (mustParsePath "RRRURURUU") = ((11390621 : Rat) / (1113025 : Rat)) := by
  simp only [lagrangeLower, lagrange54_score_08_length, if_pos, lagrange54_score_08]

theorem lagrange54_score_08_upper :
    lagrangeUpper 9 (mustParsePath "RRRURURUU") = ((11390621 : Rat) / (1113025 : Rat)) := by
  simp only [lagrangeUpper, lagrange54_score_08_length, if_pos, lagrange54_score_08]

theorem lagrange54_score_08_bound :
    lagrangeBound 9 (mustParsePath "RRRURURUU") =
      { pathPrefix := mustParsePath "RRRURURUU", lower := ((11390621 : Rat) / (1113025 : Rat)),
        upper := ((11390621 : Rat) / (1113025 : Rat)) } := by
  simp only [lagrangeBound, lagrange54_score_08_lower, lagrange54_score_08_upper]

theorem lagrange54_score_08_exact :
    exactBound lagrangeSq (mustParsePath "RRRURURUU") =
      { pathPrefix := mustParsePath "RRRURURUU", lower := ((11390621 : Rat) / (1113025 : Rat)),
        upper := ((11390621 : Rat) / (1113025 : Rat)) } := by
  simp only [exactBound, lagrange54_score_08]

end LatticePathOrdersKernel

