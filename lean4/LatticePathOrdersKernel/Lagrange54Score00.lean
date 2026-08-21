import LatticePathOrdersKernel.Lagrange54Data

set_option maxRecDepth 100000
set_option maxHeartbeats 8000000
set_option linter.unusedSimpArgs false

namespace LatticePathOrdersKernel

open LatticePathOrders

theorem lagrange54_score_00 :
    lagrangeSq (mustParsePath "RRURURURU") = ((8732021 : Rat) / (970225 : Rat)) := by
  unfold lagrangeSq
  rw [show lagrangeNumerator (mustParsePath "RRURURURU") = 8732021 by decide]
  rw [show qMin (cyclicDigits (mustParsePath "RRURURURU")) = 985 by decide]
  norm_num

theorem lagrange54_score_00_length : (mustParsePath "RRURURURU").length = 9 := by
  decide

theorem lagrange54_score_00_lower :
    lagrangeLower 9 (mustParsePath "RRURURURU") = ((8732021 : Rat) / (970225 : Rat)) := by
  simp only [lagrangeLower, lagrange54_score_00_length, if_pos, lagrange54_score_00]

theorem lagrange54_score_00_upper :
    lagrangeUpper 9 (mustParsePath "RRURURURU") = ((8732021 : Rat) / (970225 : Rat)) := by
  simp only [lagrangeUpper, lagrange54_score_00_length, if_pos, lagrange54_score_00]

theorem lagrange54_score_00_bound :
    lagrangeBound 9 (mustParsePath "RRURURURU") =
      { pathPrefix := mustParsePath "RRURURURU", lower := ((8732021 : Rat) / (970225 : Rat)),
        upper := ((8732021 : Rat) / (970225 : Rat)) } := by
  simp only [lagrangeBound, lagrange54_score_00_lower, lagrange54_score_00_upper]

theorem lagrange54_score_00_exact :
    exactBound lagrangeSq (mustParsePath "RRURURURU") =
      { pathPrefix := mustParsePath "RRURURURU", lower := ((8732021 : Rat) / (970225 : Rat)),
        upper := ((8732021 : Rat) / (970225 : Rat)) } := by
  simp only [exactBound, lagrange54_score_00]

end LatticePathOrdersKernel

