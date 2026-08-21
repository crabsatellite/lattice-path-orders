import LatticePathOrdersKernel.Lagrange54Data

set_option maxRecDepth 100000
set_option maxHeartbeats 8000000
set_option linter.unusedSimpArgs false

namespace LatticePathOrdersKernel

open LatticePathOrders

theorem lagrange54_score_12 :
    lagrangeSq (mustParsePath "RRRRURUUU") = ((15610397 : Rat) / (1495729 : Rat)) := by
  unfold lagrangeSq
  rw [show lagrangeNumerator (mustParsePath "RRRRURUUU") = 15610397 by decide]
  rw [show qMin (cyclicDigits (mustParsePath "RRRRURUUU")) = 1223 by decide]
  norm_num

theorem lagrange54_score_12_length : (mustParsePath "RRRRURUUU").length = 9 := by
  decide

theorem lagrange54_score_12_lower :
    lagrangeLower 9 (mustParsePath "RRRRURUUU") = ((15610397 : Rat) / (1495729 : Rat)) := by
  simp only [lagrangeLower, lagrange54_score_12_length, if_pos, lagrange54_score_12]

theorem lagrange54_score_12_upper :
    lagrangeUpper 9 (mustParsePath "RRRRURUUU") = ((15610397 : Rat) / (1495729 : Rat)) := by
  simp only [lagrangeUpper, lagrange54_score_12_length, if_pos, lagrange54_score_12]

theorem lagrange54_score_12_bound :
    lagrangeBound 9 (mustParsePath "RRRRURUUU") =
      { pathPrefix := mustParsePath "RRRRURUUU", lower := ((15610397 : Rat) / (1495729 : Rat)),
        upper := ((15610397 : Rat) / (1495729 : Rat)) } := by
  simp only [lagrangeBound, lagrange54_score_12_lower, lagrange54_score_12_upper]

theorem lagrange54_score_12_exact :
    exactBound lagrangeSq (mustParsePath "RRRRURUUU") =
      { pathPrefix := mustParsePath "RRRRURUUU", lower := ((15610397 : Rat) / (1495729 : Rat)),
        upper := ((15610397 : Rat) / (1495729 : Rat)) } := by
  simp only [exactBound, lagrange54_score_12]

end LatticePathOrdersKernel

