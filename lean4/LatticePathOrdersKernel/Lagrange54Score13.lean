import LatticePathOrdersKernel.Lagrange54Data

set_option maxRecDepth 100000
set_option maxHeartbeats 8000000
set_option linter.unusedSimpArgs false

namespace LatticePathOrdersKernel

open LatticePathOrders

theorem lagrange54_score_13 :
    lagrangeSq (mustParsePath "RRRRRUUUU") = ((21372125 : Rat) / (2042041 : Rat)) := by
  unfold lagrangeSq
  rw [show lagrangeNumerator (mustParsePath "RRRRRUUUU") = 21372125 by decide]
  rw [show qMin (cyclicDigits (mustParsePath "RRRRRUUUU")) = 1429 by decide]
  norm_num

theorem lagrange54_score_13_length : (mustParsePath "RRRRRUUUU").length = 9 := by
  decide

theorem lagrange54_score_13_lower :
    lagrangeLower 9 (mustParsePath "RRRRRUUUU") = ((21372125 : Rat) / (2042041 : Rat)) := by
  simp only [lagrangeLower, lagrange54_score_13_length, if_pos, lagrange54_score_13]

theorem lagrange54_score_13_upper :
    lagrangeUpper 9 (mustParsePath "RRRRRUUUU") = ((21372125 : Rat) / (2042041 : Rat)) := by
  simp only [lagrangeUpper, lagrange54_score_13_length, if_pos, lagrange54_score_13]

theorem lagrange54_score_13_bound :
    lagrangeBound 9 (mustParsePath "RRRRRUUUU") =
      { pathPrefix := mustParsePath "RRRRRUUUU", lower := ((21372125 : Rat) / (2042041 : Rat)),
        upper := ((21372125 : Rat) / (2042041 : Rat)) } := by
  simp only [lagrangeBound, lagrange54_score_13_lower, lagrange54_score_13_upper]

theorem lagrange54_score_13_exact :
    exactBound lagrangeSq (mustParsePath "RRRRRUUUU") =
      { pathPrefix := mustParsePath "RRRRRUUUU", lower := ((21372125 : Rat) / (2042041 : Rat)),
        upper := ((21372125 : Rat) / (2042041 : Rat)) } := by
  simp only [exactBound, lagrange54_score_13]

end LatticePathOrdersKernel

