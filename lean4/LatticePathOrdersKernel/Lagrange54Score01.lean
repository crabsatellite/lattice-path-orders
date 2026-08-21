import LatticePathOrdersKernel.Lagrange54Data

set_option maxRecDepth 100000
set_option maxHeartbeats 8000000
set_option linter.unusedSimpArgs false

namespace LatticePathOrdersKernel

open LatticePathOrders

theorem lagrange54_score_01 :
    lagrangeSq (mustParsePath "RRURURRUU") = ((10909805 : Rat) / (1087849 : Rat)) := by
  unfold lagrangeSq
  rw [show lagrangeNumerator (mustParsePath "RRURURRUU") = 10909805 by decide]
  rw [show qMin (cyclicDigits (mustParsePath "RRURURRUU")) = 1043 by decide]
  norm_num

theorem lagrange54_score_01_length : (mustParsePath "RRURURRUU").length = 9 := by
  decide

theorem lagrange54_score_01_lower :
    lagrangeLower 9 (mustParsePath "RRURURRUU") = ((10909805 : Rat) / (1087849 : Rat)) := by
  simp only [lagrangeLower, lagrange54_score_01_length, if_pos, lagrange54_score_01]

theorem lagrange54_score_01_upper :
    lagrangeUpper 9 (mustParsePath "RRURURRUU") = ((10909805 : Rat) / (1087849 : Rat)) := by
  simp only [lagrangeUpper, lagrange54_score_01_length, if_pos, lagrange54_score_01]

theorem lagrange54_score_01_bound :
    lagrangeBound 9 (mustParsePath "RRURURRUU") =
      { pathPrefix := mustParsePath "RRURURRUU", lower := ((10909805 : Rat) / (1087849 : Rat)),
        upper := ((10909805 : Rat) / (1087849 : Rat)) } := by
  simp only [lagrangeBound, lagrange54_score_01_lower, lagrange54_score_01_upper]

theorem lagrange54_score_01_exact :
    exactBound lagrangeSq (mustParsePath "RRURURRUU") =
      { pathPrefix := mustParsePath "RRURURRUU", lower := ((10909805 : Rat) / (1087849 : Rat)),
        upper := ((10909805 : Rat) / (1087849 : Rat)) } := by
  simp only [exactBound, lagrange54_score_01]

end LatticePathOrdersKernel

