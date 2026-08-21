import LatticePathOrdersKernel.BelowYClassification

namespace LatticePathOrdersKernel
open LatticePathOrders

theorem minimumLevelPath_lt_initialLevelPath
    {n r : Nat} (hn : 4 ≤ n) (hr : r ≤ n - 3) :
    sourceMatchingNumber (minimumLevelPath n) <
      sourceMatchingNumber (initialLevelPath n r) := by
  rw [minimumLevelPath_score hn, initialLevelPath_score hn hr]
  have hleft : 0 < pell (2 * r + 1) := pell_pos (by omega)
  have hright : 0 < pell (2 * n - 3 - (2 * r + 1)) := pell_pos (by omega)
  have hproduct :
      0 < pell (2 * r + 1) * pell (2 * n - 3 - (2 * r + 1)) :=
    Nat.mul_pos hleft hright
  unfold pellF
  omega

/-- The displayed `A_r` scores strictly decrease with increasing `r`, over
the complete literal range `0 ≤ r ≤ n-3`. -/
theorem initialLevelPath_score_strict_of_lt
    {n r s : Nat} (hn : 4 ≤ n) (hr : r ≤ n - 3)
    (hs : s ≤ n - 3) (hrs : r < s) :
    sourceMatchingNumber (initialLevelPath n s) <
      sourceMatchingNumber (initialLevelPath n r) := by
  have hrs' : r + 1 ≤ s := by omega
  induction s, hrs' using Nat.le_induction with
  | base => exact initialLevelPath_score_adjacent hn (by omega)
  | succ s hrs' ih =>
      have hadj := initialLevelPath_score_adjacent (n := n) (r := s) hn (by omega)
      exact hadj.trans (ih (by omega) (by omega))

theorem initialLevelPath_le_nonlocalX
    {n r : Nat} (hn : 4 ≤ n) (hr : r ≤ n - 3) :
    sourceMatchingNumber (initialLevelPath n r) ≤
      sourceMatchingNumber (nonlocalX n) := by
  have hext := (pell_extrema (N := 2 * n - 3) (k := 2 * r + 1)
    (odd_two_n_sub_three (by omega)) (by omega) (by omega) (by omega)).1
  rw [initialLevelPath_score hn hr, nonlocalX_score hn]
  omega

theorem initialLevelPath_lt_nonlocalY
    {n r : Nat} (hn : 4 ≤ n) (hr : r ≤ n - 3) :
    sourceMatchingNumber (initialLevelPath n r) <
      sourceMatchingNumber (nonlocalY n) :=
  (initialLevelPath_le_nonlocalX hn hr).trans_lt (nonlocalX_lt_nonlocalY hn)

end LatticePathOrdersKernel
