import LatticePathOrdersKernel.BelowYThree

namespace LatticePathOrdersKernel
open LatticePathOrders

/-- Literal exhaustion of all carrier paths below `Y_n`, used to turn the
displayed candidates into the first matching levels of Theorem `thm:nonlocal`.
-/
theorem below_nonlocalY_classification
    {n : Nat} (hn : 4 ≤ n) {word : Path}
    (hword : Carrier n (n - 1) word)
    (hlt : sourceMatchingNumber word < sourceMatchingNumber (nonlocalY n)) :
    word = minimumLevelPath n ∨
      ∃ r ≤ n - 3, word = initialLevelPath n r := by
  let blocks := adjacencyBlocks word
  have hdata := carrier_nn1_block_data hn hword
  by_cases hone : blocks.count E = 1
  · exact Or.inl (one_E_carrier_eq_minimumLevelPath hn hword hone)
  by_cases hthree : blocks.count E = 3
  · exact Or.inr
      (below_nonlocalY_three_E_is_initialLevelPath hn hword hthree hlt)
  · have hmany : 5 ≤ blocks.count E := by
      change 5 ≤ (adjacencyBlocks word).count E
      rcases hdata.2.2.1 with ⟨k, hk⟩
      by_cases hk0 : k = 0
      · subst k
        simp at hk
        exact False.elim (hone hk)
      by_cases hk1 : k = 1
      · subst k
        norm_num at hk
        exact False.elim (hthree hk)
      omega
    have hgt := many_E_path_strictly_above_Y hn hword hmany
    exact False.elim ((not_lt_of_ge (Nat.le_of_lt hgt)) hlt)

end LatticePathOrdersKernel
