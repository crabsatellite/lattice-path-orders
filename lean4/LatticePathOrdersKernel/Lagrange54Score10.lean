import LatticePathOrdersKernel.Lagrange54Data

set_option maxRecDepth 100000
set_option maxHeartbeats 8000000
set_option linter.unusedSimpArgs false

namespace LatticePathOrdersKernel

open LatticePathOrders

theorem lagrange54_score_10 :
    lagrangeSq (mustParsePath "RRRRUUURU") = ((15610397 : Rat) / (1495729 : Rat)) := by
  unfold lagrangeSq
  rw [show lagrangeNumerator (mustParsePath "RRRRUUURU") = 15610397 by decide]
  rw [show qMin (cyclicDigits (mustParsePath "RRRRUUURU")) = 1223 by decide]
  norm_num

theorem lagrange54_score_10_length : (mustParsePath "RRRRUUURU").length = 9 := by
  decide

theorem lagrange54_score_10_lower :
    lagrangeLower 9 (mustParsePath "RRRRUUURU") = ((15610397 : Rat) / (1495729 : Rat)) := by
  simp only [lagrangeLower, lagrange54_score_10_length, if_pos, lagrange54_score_10]

theorem lagrange54_score_10_upper :
    lagrangeUpper 9 (mustParsePath "RRRRUUURU") = ((15610397 : Rat) / (1495729 : Rat)) := by
  simp only [lagrangeUpper, lagrange54_score_10_length, if_pos, lagrange54_score_10]

theorem lagrange54_score_10_bound :
    lagrangeBound 9 (mustParsePath "RRRRUUURU") =
      { pathPrefix := mustParsePath "RRRRUUURU", lower := ((15610397 : Rat) / (1495729 : Rat)),
        upper := ((15610397 : Rat) / (1495729 : Rat)) } := by
  simp only [lagrangeBound, lagrange54_score_10_lower, lagrange54_score_10_upper]

theorem lagrange54_score_10_exact :
    exactBound lagrangeSq (mustParsePath "RRRRUUURU") =
      { pathPrefix := mustParsePath "RRRRUUURU", lower := ((15610397 : Rat) / (1495729 : Rat)),
        upper := ((15610397 : Rat) / (1495729 : Rat)) } := by
  simp only [exactBound, lagrange54_score_10]

end LatticePathOrdersKernel

