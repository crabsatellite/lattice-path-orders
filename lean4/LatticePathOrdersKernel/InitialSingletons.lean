import LatticePathOrdersKernel.InitialLevelOrder

namespace LatticePathOrdersKernel
open LatticePathOrders
set_option maxHeartbeats 1000000

theorem minimumLevelPath_lt_nonlocalY {n : Nat} (hn : 4 ≤ n) :
    sourceMatchingNumber (minimumLevelPath n) <
      sourceMatchingNumber (nonlocalY n) :=
  (minimumLevelPath_lt_initialLevelPath (r := 0) hn (by omega)).trans
    (initialLevelPath_lt_nonlocalY (r := 0) hn (by omega))

theorem minimumLevelPath_score_unique
    {n : Nat} (hn : 4 ≤ n) {word : Path}
    (hword : Carrier n (n - 1) word)
    (hscore : sourceMatchingNumber word =
      sourceMatchingNumber (minimumLevelPath n)) :
    word = minimumLevelPath n := by
  have hlt : sourceMatchingNumber word < sourceMatchingNumber (nonlocalY n) :=
    hscore.trans_lt (minimumLevelPath_lt_nonlocalY hn)
  rcases below_nonlocalY_classification hn hword hlt with hminimum | hinitial
  · exact hminimum
  · rcases hinitial with ⟨r, hr, hwordEq⟩
    subst word
    exact False.elim
      ((minimumLevelPath_lt_initialLevelPath hn hr).ne' hscore)

theorem initialLevelPath_score_unique
    {n r : Nat} (hn : 4 ≤ n) (hr : r ≤ n - 3) {word : Path}
    (hword : Carrier n (n - 1) word)
    (hscore : sourceMatchingNumber word =
      sourceMatchingNumber (initialLevelPath n r)) :
    word = initialLevelPath n r := by
  have hlt : sourceMatchingNumber word < sourceMatchingNumber (nonlocalY n) :=
    hscore.trans_lt (initialLevelPath_lt_nonlocalY hn hr)
  rcases below_nonlocalY_classification hn hword hlt with hminimum | hinitial
  · subst word
    exact False.elim
      ((minimumLevelPath_lt_initialLevelPath hn hr).ne hscore)
  · rcases hinitial with ⟨s, hs, hwordEq⟩
    subst word
    have hsr := initialLevelPath_score_injective hn hs hr hscore
    subst s
    rfl

end LatticePathOrdersKernel
