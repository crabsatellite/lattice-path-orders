import LatticePathOrdersKernel.PositionsTwoFour

namespace LatticePathOrdersKernel
open LatticePathOrders
set_option maxHeartbeats 1000000

theorem three_E_score_unique
    {n : Nat} (hn : 4 ≤ n) {word : Path}
    (hword : Carrier n (n - 1) word)
    (hthree : (adjacencyBlocks word).count E = 3)
    (hscore : sourceMatchingNumber word = sourceMatchingNumber (nonlocalY n)) :
    word = nonlocalY n := by
  have hdata := carrier_nn1_block_data hn hword
  rcases initial_three_E_decomposition hdata.2.1 hdata.2.2.2 hthree with
    ⟨before, middle, after, hdecomp⟩
  have hlength : 1 + before + 1 + middle + 1 + after = 2 * n - 2 := by
    have hlen := congrArg List.length hdecomp
    rw [hdata.1] at hlen
    simp at hlen
    omega
  have hproduct := threeE_decomposition_product hlength
  rw [← hdecomp] at hproduct
  by_cases hfinal : after = 0
  · have hbelow := threeE_final_score_le_X hn (i := before + 1)
        (by omega) (by omega)
    have hjEq : before + middle + 2 = 2 * n - 3 := by omega
    rw [hjEq] at hproduct
    rw [← hproduct] at hbelow
    rw [sourceMatchingNumber_eq_matchingScore] at hscore
    unfold matchingScore at hscore
    rw [hscore, nonlocalY_score hn] at hbelow
    have hXY := nonlocalX_lt_nonlocalY hn
    rw [nonlocalX_score hn, nonlocalY_score hn] at hXY
    exact False.elim ((not_lt_of_ge hbelow) hXY)
  · have hEqProduct :
        (threeEBlockProduct (2 * n - 2) (before + 1)
          (before + middle + 2)).a11 =
        pell (2 * n - 1) + pellF (2 * n - 3) 2 + pellF (2 * n - 3) 4 := by
      calc
        (threeEBlockProduct (2 * n - 2) (before + 1)
            (before + middle + 2)).a11 =
            (matrixProduct (adjacencyBlocks word)).a11 :=
          congrArg Mat2.a11 hproduct.symm
        _ = sourceMatchingNumber word := by
          rw [sourceMatchingNumber_eq_matchingScore]
          rfl
        _ = sourceMatchingNumber (nonlocalY n) := hscore
        _ = pell (2 * n - 1) + pellF (2 * n - 3) 2 +
            pellF (2 * n - 3) 4 := nonlocalY_score hn
    have hpositions := threeE_nonfinal_eq_Y_positions hn
      (i := before + 1) (j := before + middle + 2)
      (by omega) (by omega) (by omega) hEqProduct
    rcases hpositions with hfirst | hsecond
    · have hbefore : before = 1 := by omega
      have hmiddle : middle = 1 := by omega
      have hafter : after = 2 * n - 7 := by omega
      rw [hbefore, hmiddle, hafter] at hdecomp
      have hbad : adjacencyBlocks word =
          [E, D, E, D, E] ++ List.replicate (2 * n - 7) D := by simpa using hdecomp
      exact False.elim (positions_two_four_not_carrier hn hword hbad)
    · have hbefore : before = 2 * n - 8 := by omega
      have hmiddle : middle = 1 := by omega
      have hafter : after = 2 := by omega
      rw [hbefore, hmiddle, hafter] at hdecomp
      apply carrier_adjacencyBlocks_injective (by omega) hword (nonlocalY_carrier hn)
      rw [nonlocalY_adjacencyBlocks hn]
      simpa using hdecomp

end LatticePathOrdersKernel
