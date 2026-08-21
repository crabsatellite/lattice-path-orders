import LatticePathOrdersKernel.Lagrange54Data

set_option maxRecDepth 100000
set_option maxHeartbeats 8000000
set_option linter.unusedSimpArgs false

namespace LatticePathOrdersKernel

open LatticePathOrders

theorem lagrange54_score_11 :
    lagrangeSq (mustParsePath "RRRRUURUU") = ((14953685 : Rat) / (1456849 : Rat)) := by
  unfold lagrangeSq
  rw [show lagrangeNumerator (mustParsePath "RRRRUURUU") = 14953685 by decide]
  rw [show qMin (cyclicDigits (mustParsePath "RRRRUURUU")) = 1207 by decide]
  norm_num

theorem lagrange54_score_11_length : (mustParsePath "RRRRUURUU").length = 9 := by
  decide

theorem lagrange54_score_11_lower :
    lagrangeLower 9 (mustParsePath "RRRRUURUU") = ((14953685 : Rat) / (1456849 : Rat)) := by
  simp only [lagrangeLower, lagrange54_score_11_length, if_pos, lagrange54_score_11]

theorem lagrange54_score_11_upper :
    lagrangeUpper 9 (mustParsePath "RRRRUURUU") = ((14953685 : Rat) / (1456849 : Rat)) := by
  simp only [lagrangeUpper, lagrange54_score_11_length, if_pos, lagrange54_score_11]

theorem lagrange54_score_11_bound :
    lagrangeBound 9 (mustParsePath "RRRRUURUU") =
      { pathPrefix := mustParsePath "RRRRUURUU", lower := ((14953685 : Rat) / (1456849 : Rat)),
        upper := ((14953685 : Rat) / (1456849 : Rat)) } := by
  simp only [lagrangeBound, lagrange54_score_11_lower, lagrange54_score_11_upper]

theorem lagrange54_score_11_exact :
    exactBound lagrangeSq (mustParsePath "RRRRUURUU") =
      { pathPrefix := mustParsePath "RRRRUURUU", lower := ((14953685 : Rat) / (1456849 : Rat)),
        upper := ((14953685 : Rat) / (1456849 : Rat)) } := by
  simp only [exactBound, lagrange54_score_11]

end LatticePathOrdersKernel

