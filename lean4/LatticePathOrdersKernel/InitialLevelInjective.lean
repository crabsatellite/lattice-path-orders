import LatticePathOrdersKernel.InitialLevelScoreNe

namespace LatticePathOrdersKernel
open LatticePathOrders
set_option maxHeartbeats 1000000

theorem initialLevelPath_score_injective
    {n r s : Nat} (hn : 4 ≤ n) (hr : r ≤ n - 3)
    (hs : s ≤ n - 3)
    (heq : sourceMatchingNumber (initialLevelPath n r) =
      sourceMatchingNumber (initialLevelPath n s)) : r = s := by
  rcases lt_trichotomy r s with hrs | hrs | hrs
  · exact False.elim (initialLevelPath_score_ne_of_lt hn hr hs hrs heq)
  · exact hrs
  · exact False.elim
      (initialLevelPath_score_ne_of_lt hn hs hr hrs heq.symm)

theorem initialLevel_index_count {n : Nat} (hn : 4 ≤ n) :
    (Finset.Icc 0 (n - 3)).card = n - 2 := by
  simp
  omega

end LatticePathOrdersKernel
