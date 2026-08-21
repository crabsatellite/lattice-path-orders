import LatticePathOrdersKernel.StrictBlockMonotonicity

namespace LatticePathOrdersKernel
open LatticePathOrders
set_option maxHeartbeats 1000000

theorem many_E_path_strictly_above_Y
    {n : Nat} (hn : 4 ≤ n) {word : Path}
    (hword : Carrier n (n - 1) word)
    (hmany : 5 ≤ (adjacencyBlocks word).count E) :
    sourceMatchingNumber (nonlocalY n) < sourceMatchingNumber word := by
  have hdata := carrier_nn1_block_data hn hword
  cases hblocks : adjacencyBlocks word with
  | nil => rw [hblocks] at hdata; simp at hdata
  | cons first tail =>
      rw [hblocks] at hdata hmany
      have hfirst : first = E := by simpa using hdata.2.1
      subst first
      have hDE : DEWord (E :: tail) := hdata.2.2.2
      have htailMany : 4 ≤ tail.count E := by simpa using hmany
      rcases decompose_two_E hDE.tail (by omega) with
        ⟨before, middle, after, htail, hafterCount, hafterDE⟩
      have hafterTwo : 2 ≤ after.count E := by omega
      have hdecomp : adjacencyBlocks word =
          [E] ++ List.replicate before D ++ [E] ++
            List.replicate middle D ++ [E] ++ after := by
        rw [hblocks, htail]
        simp [List.append_assoc]
      have hlength : 1 + before + 1 + middle + 1 + after.length =
          2 * n - 2 := by
        have hlen := congrArg List.length hdecomp
        have hwordLen := (carrier_nn1_block_data hn hword).1
        rw [hwordLen] at hlen
        simp at hlen
        omega
      have hproduct := threeE_decomposition_product hlength
      let common := [E] ++ List.replicate before D ++ [E] ++
        List.replicate middle D ++ [E]
      have hcommonDE : DEWord common := by
        dsimp [common]
        have h := DEWord.singletonE.append ((DEWord.replicateD before).append
          (DEWord.singletonE.append ((DEWord.replicateD middle).append
            DEWord.singletonE)))
        simpa only [List.append_assoc] using h
      have hcommonNe : common ≠ [] := by simp [common]
      have hstrict := common_replicateD_strict_of_twoE
        hcommonDE hcommonNe hafterDE hafterTwo
      have hlowerList : common ++ List.replicate after.length D =
          [E] ++ List.replicate before D ++ [E] ++
            List.replicate middle D ++ [E] ++ List.replicate after.length D := by rfl
      have hupperList : common ++ after = adjacencyBlocks word := by rw [hdecomp]
      rw [hlowerList, hupperList] at hstrict
      have hYlower : sourceMatchingNumber (nonlocalY n) ≤
          (matrixProduct ([E] ++ List.replicate before D ++ [E] ++
            List.replicate middle D ++ [E] ++
            List.replicate after.length D)).a11 := by
        rw [nonlocalY_score hn, hproduct]
        exact threeE_nonfinal_score_ge_Y hn (by omega) (by omega) (by
          have hcountLen : after.count E ≤ after.length := List.count_le_length
          omega)
      exact (by simpa only [sourceMatchingNumber_eq_matchingScore] using
        hYlower.trans_lt hstrict)

end LatticePathOrdersKernel
