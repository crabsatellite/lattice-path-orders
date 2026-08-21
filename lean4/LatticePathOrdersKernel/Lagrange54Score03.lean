import LatticePathOrdersKernel.Lagrange54Data

set_option maxRecDepth 100000
set_option maxHeartbeats 8000000
set_option linter.unusedSimpArgs false

namespace LatticePathOrdersKernel

open LatticePathOrders

theorem lagrange54_score_03 :
    lagrangeSq (mustParsePath "RRURRURUU") = ((10989221 : Rat) / (1092025 : Rat)) := by
  unfold lagrangeSq
  rw [show lagrangeNumerator (mustParsePath "RRURRURUU") = 10989221 by decide]
  rw [show qMin (cyclicDigits (mustParsePath "RRURRURUU")) = 1045 by decide]
  norm_num

theorem lagrange54_score_03_length : (mustParsePath "RRURRURUU").length = 9 := by
  decide

theorem lagrange54_score_03_lower :
    lagrangeLower 9 (mustParsePath "RRURRURUU") = ((10989221 : Rat) / (1092025 : Rat)) := by
  simp only [lagrangeLower, lagrange54_score_03_length, if_pos, lagrange54_score_03]

theorem lagrange54_score_03_upper :
    lagrangeUpper 9 (mustParsePath "RRURRURUU") = ((10989221 : Rat) / (1092025 : Rat)) := by
  simp only [lagrangeUpper, lagrange54_score_03_length, if_pos, lagrange54_score_03]

theorem lagrange54_score_03_bound :
    lagrangeBound 9 (mustParsePath "RRURRURUU") =
      { pathPrefix := mustParsePath "RRURRURUU", lower := ((10989221 : Rat) / (1092025 : Rat)),
        upper := ((10989221 : Rat) / (1092025 : Rat)) } := by
  simp only [lagrangeBound, lagrange54_score_03_lower, lagrange54_score_03_upper]

theorem lagrange54_score_03_exact :
    exactBound lagrangeSq (mustParsePath "RRURRURUU") =
      { pathPrefix := mustParsePath "RRURRURUU", lower := ((10989221 : Rat) / (1092025 : Rat)),
        upper := ((10989221 : Rat) / (1092025 : Rat)) } := by
  simp only [exactBound, lagrange54_score_03]

end LatticePathOrdersKernel

