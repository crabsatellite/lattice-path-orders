import LatticePathOrdersKernel.YUniqueOne

namespace LatticePathOrdersKernel
open LatticePathOrders

theorem nonlocalY_score_unique
    {n : Nat} (hn : 4 ≤ n) {word : Path}
    (hword : Carrier n (n - 1) word)
    (hscore : sourceMatchingNumber word = sourceMatchingNumber (nonlocalY n)) :
    word = nonlocalY n := by
  let blocks := adjacencyBlocks word
  have hdata := carrier_nn1_block_data hn hword
  by_cases hone : blocks.count E = 1
  · exact False.elim (one_E_score_ne_nonlocalY hn hword hone hscore)
  by_cases hthree : blocks.count E = 3
  · exact three_E_score_unique hn hword hthree hscore
  · have hmany : 5 ≤ blocks.count E := by
      change 5 ≤ (adjacencyBlocks word).count E
      rcases hdata.2.2.1 with ⟨k, hk⟩
      by_cases hk0 : k = 0
      · subst k; simp at hk; exact False.elim (hone hk)
      by_cases hk1 : k = 1
      · subst k; norm_num at hk; exact False.elim (hthree hk)
      omega
    have hstrict := many_E_path_strictly_above_Y hn hword hmany
    rw [hscore] at hstrict
    exact False.elim (lt_irrefl _ hstrict)

end LatticePathOrdersKernel
