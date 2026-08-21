import LatticePathOrdersKernel.Lagrange54Data

set_option maxRecDepth 100000
set_option maxHeartbeats 8000000
set_option linter.unusedSimpArgs false

namespace LatticePathOrdersKernel

open LatticePathOrders

theorem lagrange54_score_04 :
    lagrangeSq (mustParsePath "RRURRRUUU") = ((14861021 : Rat) / (1428025 : Rat)) := by
  unfold lagrangeSq
  rw [show lagrangeNumerator (mustParsePath "RRURRRUUU") = 14861021 by decide]
  rw [show qMin (cyclicDigits (mustParsePath "RRURRRUUU")) = 1195 by decide]
  norm_num

theorem lagrange54_score_04_length : (mustParsePath "RRURRRUUU").length = 9 := by
  decide

theorem lagrange54_score_04_lower :
    lagrangeLower 9 (mustParsePath "RRURRRUUU") = ((14861021 : Rat) / (1428025 : Rat)) := by
  simp only [lagrangeLower, lagrange54_score_04_length, if_pos, lagrange54_score_04]

theorem lagrange54_score_04_upper :
    lagrangeUpper 9 (mustParsePath "RRURRRUUU") = ((14861021 : Rat) / (1428025 : Rat)) := by
  simp only [lagrangeUpper, lagrange54_score_04_length, if_pos, lagrange54_score_04]

theorem lagrange54_score_04_bound :
    lagrangeBound 9 (mustParsePath "RRURRRUUU") =
      { pathPrefix := mustParsePath "RRURRRUUU", lower := ((14861021 : Rat) / (1428025 : Rat)),
        upper := ((14861021 : Rat) / (1428025 : Rat)) } := by
  simp only [lagrangeBound, lagrange54_score_04_lower, lagrange54_score_04_upper]

theorem lagrange54_score_04_exact :
    exactBound lagrangeSq (mustParsePath "RRURRRUUU") =
      { pathPrefix := mustParsePath "RRURRRUUU", lower := ((14861021 : Rat) / (1428025 : Rat)),
        upper := ((14861021 : Rat) / (1428025 : Rat)) } := by
  simp only [exactBound, lagrange54_score_04]

end LatticePathOrdersKernel

