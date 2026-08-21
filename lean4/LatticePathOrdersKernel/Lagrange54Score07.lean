import LatticePathOrdersKernel.Lagrange54Data

set_option maxRecDepth 100000
set_option maxHeartbeats 8000000
set_option linter.unusedSimpArgs false

namespace LatticePathOrdersKernel

open LatticePathOrders

theorem lagrange54_score_07 :
    lagrangeSq (mustParsePath "RRRURUURU") = ((11471765 : Rat) / (1247689 : Rat)) := by
  unfold lagrangeSq
  rw [show lagrangeNumerator (mustParsePath "RRRURUURU") = 11471765 by decide]
  rw [show qMin (cyclicDigits (mustParsePath "RRRURUURU")) = 1117 by decide]
  norm_num

theorem lagrange54_score_07_length : (mustParsePath "RRRURUURU").length = 9 := by
  decide

theorem lagrange54_score_07_lower :
    lagrangeLower 9 (mustParsePath "RRRURUURU") = ((11471765 : Rat) / (1247689 : Rat)) := by
  simp only [lagrangeLower, lagrange54_score_07_length, if_pos, lagrange54_score_07]

theorem lagrange54_score_07_upper :
    lagrangeUpper 9 (mustParsePath "RRRURUURU") = ((11471765 : Rat) / (1247689 : Rat)) := by
  simp only [lagrangeUpper, lagrange54_score_07_length, if_pos, lagrange54_score_07]

theorem lagrange54_score_07_bound :
    lagrangeBound 9 (mustParsePath "RRRURUURU") =
      { pathPrefix := mustParsePath "RRRURUURU", lower := ((11471765 : Rat) / (1247689 : Rat)),
        upper := ((11471765 : Rat) / (1247689 : Rat)) } := by
  simp only [lagrangeBound, lagrange54_score_07_lower, lagrange54_score_07_upper]

theorem lagrange54_score_07_exact :
    exactBound lagrangeSq (mustParsePath "RRRURUURU") =
      { pathPrefix := mustParsePath "RRRURUURU", lower := ((11471765 : Rat) / (1247689 : Rat)),
        upper := ((11471765 : Rat) / (1247689 : Rat)) } := by
  simp only [exactBound, lagrange54_score_07]

end LatticePathOrdersKernel

