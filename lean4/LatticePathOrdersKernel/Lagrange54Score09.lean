import LatticePathOrdersKernel.Lagrange54Data

set_option maxRecDepth 100000
set_option maxHeartbeats 8000000
set_option linter.unusedSimpArgs false

namespace LatticePathOrdersKernel

open LatticePathOrders

theorem lagrange54_score_09 :
    lagrangeSq (mustParsePath "RRRURRUUU") = ((14861021 : Rat) / (1428025 : Rat)) := by
  unfold lagrangeSq
  rw [show lagrangeNumerator (mustParsePath "RRRURRUUU") = 14861021 by decide]
  rw [show qMin (cyclicDigits (mustParsePath "RRRURRUUU")) = 1195 by decide]
  norm_num

theorem lagrange54_score_09_length : (mustParsePath "RRRURRUUU").length = 9 := by
  decide

theorem lagrange54_score_09_lower :
    lagrangeLower 9 (mustParsePath "RRRURRUUU") = ((14861021 : Rat) / (1428025 : Rat)) := by
  simp only [lagrangeLower, lagrange54_score_09_length, if_pos, lagrange54_score_09]

theorem lagrange54_score_09_upper :
    lagrangeUpper 9 (mustParsePath "RRRURRUUU") = ((14861021 : Rat) / (1428025 : Rat)) := by
  simp only [lagrangeUpper, lagrange54_score_09_length, if_pos, lagrange54_score_09]

theorem lagrange54_score_09_bound :
    lagrangeBound 9 (mustParsePath "RRRURRUUU") =
      { pathPrefix := mustParsePath "RRRURRUUU", lower := ((14861021 : Rat) / (1428025 : Rat)),
        upper := ((14861021 : Rat) / (1428025 : Rat)) } := by
  simp only [lagrangeBound, lagrange54_score_09_lower, lagrange54_score_09_upper]

theorem lagrange54_score_09_exact :
    exactBound lagrangeSq (mustParsePath "RRRURRUUU") =
      { pathPrefix := mustParsePath "RRRURRUUU", lower := ((14861021 : Rat) / (1428025 : Rat)),
        upper := ((14861021 : Rat) / (1428025 : Rat)) } := by
  simp only [exactBound, lagrange54_score_09]

end LatticePathOrdersKernel

