import LatticePathOrdersKernel.Lagrange54Data

set_option maxRecDepth 100000
set_option maxHeartbeats 8000000
set_option linter.unusedSimpArgs false

namespace LatticePathOrdersKernel

open LatticePathOrders

theorem lagrange54_score_02 :
    lagrangeSq (mustParsePath "RRURRUURU") = ((10989221 : Rat) / (1092025 : Rat)) := by
  unfold lagrangeSq
  rw [show lagrangeNumerator (mustParsePath "RRURRUURU") = 10989221 by decide]
  rw [show qMin (cyclicDigits (mustParsePath "RRURRUURU")) = 1045 by decide]
  norm_num

theorem lagrange54_score_02_length : (mustParsePath "RRURRUURU").length = 9 := by
  decide

theorem lagrange54_score_02_lower :
    lagrangeLower 9 (mustParsePath "RRURRUURU") = ((10989221 : Rat) / (1092025 : Rat)) := by
  simp only [lagrangeLower, lagrange54_score_02_length, if_pos, lagrange54_score_02]

theorem lagrange54_score_02_upper :
    lagrangeUpper 9 (mustParsePath "RRURRUURU") = ((10989221 : Rat) / (1092025 : Rat)) := by
  simp only [lagrangeUpper, lagrange54_score_02_length, if_pos, lagrange54_score_02]

theorem lagrange54_score_02_bound :
    lagrangeBound 9 (mustParsePath "RRURRUURU") =
      { pathPrefix := mustParsePath "RRURRUURU", lower := ((10989221 : Rat) / (1092025 : Rat)),
        upper := ((10989221 : Rat) / (1092025 : Rat)) } := by
  simp only [lagrangeBound, lagrange54_score_02_lower, lagrange54_score_02_upper]

theorem lagrange54_score_02_exact :
    exactBound lagrangeSq (mustParsePath "RRURRUURU") =
      { pathPrefix := mustParsePath "RRURRUURU", lower := ((10989221 : Rat) / (1092025 : Rat)),
        upper := ((10989221 : Rat) / (1092025 : Rat)) } := by
  simp only [exactBound, lagrange54_score_02]

end LatticePathOrdersKernel

