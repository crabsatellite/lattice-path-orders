import LatticePathOrdersKernel.OneEUnique

namespace LatticePathOrdersKernel
open LatticePathOrders
set_option maxHeartbeats 1000000

/-- The three-`E` paths below `Y_n` are exactly the displayed `A_r` family.
This is the exhaustion step in the initial-level clause of
manuscript Theorem `thm:nonlocal`. -/
theorem below_nonlocalY_three_E_is_initialLevelPath
    {n : Nat} (hn : 4 ≤ n) {word : Path}
    (hword : Carrier n (n - 1) word)
    (hthree : (adjacencyBlocks word).count E = 3)
    (hlt : sourceMatchingNumber word < sourceMatchingNumber (nonlocalY n)) :
    ∃ r ≤ n - 3, word = initialLevelPath n r := by
  have hdata := carrier_nn1_block_data hn hword
  rcases initial_three_E_decomposition hdata.2.1 hdata.2.2.2 hthree with
    ⟨before, middle, after, hdecomp⟩
  by_cases hfinal : after = 0
  · subst after
    simp only [List.replicate_zero, List.append_nil] at hdecomp
    exact final_threeE_path_is_initialLevelPath hn hword hdecomp
  · have hlength :
        1 + before + 1 + middle + 1 + after = 2 * n - 2 := by
      have hlen := congrArg List.length hdecomp
      rw [hdata.1] at hlen
      simp at hlen
      omega
    have hproduct := threeE_decomposition_product hlength
    rw [← hdecomp] at hproduct
    have hge :
        sourceMatchingNumber (nonlocalY n) ≤ sourceMatchingNumber word := by
      rw [nonlocalY_score hn, sourceMatchingNumber_eq_matchingScore]
      unfold matchingScore
      rw [hproduct]
      exact threeE_nonfinal_score_ge_Y hn (by omega) (by omega) (by omega)
    exact False.elim ((not_lt_of_ge hge) hlt)

end LatticePathOrdersKernel
