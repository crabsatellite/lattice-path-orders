import LatticePathOrdersKernel.Lagrange54Data

set_option maxRecDepth 100000
set_option maxHeartbeats 8000000
set_option linter.unusedSimpArgs false

namespace LatticePathOrdersKernel

open LatticePathOrders

theorem lagrange54_score_06 :
    lagrangeSq (mustParsePath "RRRUURRUU") = ((14130077 : Rat) / (1385329 : Rat)) := by
  unfold lagrangeSq
  rw [show lagrangeNumerator (mustParsePath "RRRUURRUU") = 14130077 by decide]
  rw [show qMin (cyclicDigits (mustParsePath "RRRUURRUU")) = 1177 by decide]
  norm_num

theorem lagrange54_score_06_length : (mustParsePath "RRRUURRUU").length = 9 := by
  decide

theorem lagrange54_score_06_lower :
    lagrangeLower 9 (mustParsePath "RRRUURRUU") = ((14130077 : Rat) / (1385329 : Rat)) := by
  simp only [lagrangeLower, lagrange54_score_06_length, if_pos, lagrange54_score_06]

theorem lagrange54_score_06_upper :
    lagrangeUpper 9 (mustParsePath "RRRUURRUU") = ((14130077 : Rat) / (1385329 : Rat)) := by
  simp only [lagrangeUpper, lagrange54_score_06_length, if_pos, lagrange54_score_06]

theorem lagrange54_score_06_bound :
    lagrangeBound 9 (mustParsePath "RRRUURRUU") =
      { pathPrefix := mustParsePath "RRRUURRUU", lower := ((14130077 : Rat) / (1385329 : Rat)),
        upper := ((14130077 : Rat) / (1385329 : Rat)) } := by
  simp only [lagrangeBound, lagrange54_score_06_lower, lagrange54_score_06_upper]

theorem lagrange54_score_06_exact :
    exactBound lagrangeSq (mustParsePath "RRRUURRUU") =
      { pathPrefix := mustParsePath "RRRUURRUU", lower := ((14130077 : Rat) / (1385329 : Rat)),
        upper := ((14130077 : Rat) / (1385329 : Rat)) } := by
  simp only [exactBound, lagrange54_score_06]

end LatticePathOrdersKernel

