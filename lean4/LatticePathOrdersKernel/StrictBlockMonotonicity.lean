import LatticePathOrdersKernel.InitialLevelClassification

/-! # Strict monotonicity when a nonfinal `D` is replaced by `E` -/

namespace LatticePathOrdersKernel

open LatticePathOrders

theorem matrixProduct_DE_a12_pos
    {blocks : List Mat2} (hDE : DEWord blocks) (hne : blocks ≠ []) :
    0 < (matrixProduct blocks).a12 := by
  have hbetween : ∀ block ∈ blocks, Mat2.Between block := by
    intro block hblock
    rcases hDE block hblock with rfl | rfl
    · exact Mat2.D_between
    · exact Mat2.E_between
  have hbounds := Mat2.matrixProduct_bounds hbetween
  have hlen : 0 < blocks.length := List.length_pos_iff.mpr hne
  have hpell : 0 < pell blocks.length := pell_pos hlen
  have hpow := pow_D_pell blocks.length
  have hlower := hbounds.1.2.1
  rw [hpow] at hlower
  exact lt_of_lt_of_le hpell hlower

theorem matrixProduct_DE_a21_pos
    {blocks : List Mat2} (hDE : DEWord blocks) (hne : blocks ≠ []) :
    0 < (matrixProduct blocks).a21 := by
  have hbetween : ∀ block ∈ blocks, Mat2.Between block := by
    intro block hblock
    rcases hDE block hblock with rfl | rfl
    · exact Mat2.D_between
    · exact Mat2.E_between
  have hbounds := Mat2.matrixProduct_bounds hbetween
  have hlen : 0 < blocks.length := List.length_pos_iff.mpr hne
  have hpell : 0 < pell blocks.length := pell_pos hlen
  have hpow := pow_D_pell blocks.length
  have hlower := hbounds.1.2.2.1
  rw [hpow] at hlower
  exact lt_of_lt_of_le hpell hlower

theorem context_E_gt_D
    (A S : Mat2) (hA : 0 < A.a12) (hS : 0 < S.a21) :
    (A * D * S).a11 < (A * E * S).a11 := by
  cases A
  cases S
  simp [Mat2.mul, D, E, T] at hA hS ⊢
  nlinarith

theorem common_replicateD_strict_of_twoE
    {common after : List Mat2}
    (hcommonDE : DEWord common) (hcommon : common ≠ [])
    (hafterDE : DEWord after) (htwo : 2 ≤ after.count E) :
    (matrixProduct (common ++ List.replicate after.length D)).a11 <
      (matrixProduct (common ++ after)).a11 := by
  rcases split_first_E hafterDE (by omega) with
    ⟨before, rest, hsplit, hrestCount, hrestDE⟩
  have hrestCountPos : 0 < rest.count E := by omega
  have hrestNe : rest ≠ [] := by
    intro hnil
    simp [hnil] at hrestCountPos
  have hlength : after.length = before + 1 + rest.length := by
    have := congrArg List.length hsplit
    simp at this
    omega
  let leftBlocks := common ++ List.replicate before D
  have hleftDE : DEWord leftBlocks := by
    intro block hblock
    rcases List.mem_append.mp hblock with hblock | hblock
    · exact hcommonDE block hblock
    · have : block = D := List.eq_of_mem_replicate hblock
      exact Or.inl this
  have hleftNe : leftBlocks ≠ [] := by
    dsimp [leftBlocks]
    exact List.append_ne_nil_of_left_ne_nil hcommon _
  have hA := matrixProduct_DE_a12_pos hleftDE hleftNe
  have hS : 0 < (matrixProduct (List.replicate rest.length D)).a21 := by
    rw [matrixProduct_replicate_D, pow_D_pell]
    exact pell_pos (List.length_pos_iff.mpr hrestNe)
  have hstrict := context_E_gt_D
    (matrixProduct leftBlocks)
    (matrixProduct (List.replicate rest.length D)) hA hS
  have hlowerDecomp :
      matrixProduct (common ++ List.replicate after.length D) =
        matrixProduct leftBlocks * D *
          matrixProduct (List.replicate rest.length D) := by
    rw [hlength]
    have hlist : List.replicate (before + 1 + rest.length) D =
        List.replicate before D ++ [D] ++ List.replicate rest.length D := by
      rw [show before + 1 + rest.length = before + (1 + rest.length) by omega,
        List.replicate_add]
      rw [Nat.add_comm 1 rest.length, List.replicate_succ]
      simp
    have hsingle : matrixProduct [D] = D := by
      unfold matrixProduct
      simp only [List.foldl_cons, List.foldl_nil]
      exact Mat2.one_mul D
    have hword : common ++ List.replicate (before + 1 + rest.length) D =
        leftBlocks ++ ([D] ++ List.replicate rest.length D) := by
      dsimp [leftBlocks]
      rw [hlist]
      simp [List.append_assoc]
    have hsuffix : matrixProduct ([D] ++ List.replicate rest.length D) =
        D * matrixProduct (List.replicate rest.length D) := by
      rw [matrixProduct_append, hsingle]
    rw [hword, matrixProduct_append, hsuffix]
    exact (Mat2.mul_assoc _ _ _).symm
  let middleBlocks := common ++ List.replicate before D ++ [E] ++
    List.replicate rest.length D
  have hmiddleDecomp : matrixProduct middleBlocks =
      matrixProduct leftBlocks * E *
        matrixProduct (List.replicate rest.length D) := by
    have hsingle : matrixProduct [E] = E := by
      unfold matrixProduct
      simp only [List.foldl_cons, List.foldl_nil]
      exact Mat2.one_mul E
    have hword : middleBlocks =
        leftBlocks ++ ([E] ++ List.replicate rest.length D) := by
      dsimp [middleBlocks, leftBlocks]
      simp [List.append_assoc]
    have hsuffix : matrixProduct ([E] ++ List.replicate rest.length D) =
        E * matrixProduct (List.replicate rest.length D) := by
      rw [matrixProduct_append, hsingle]
    rw [hword, matrixProduct_append, hsuffix]
    exact (Mat2.mul_assoc _ _ _).symm
  have hrestMono := matrixProduct_replicate_D_le_DE hrestDE
  have hmiddleUpper :
      (matrixProduct middleBlocks).a11 ≤
        (matrixProduct (common ++ after)).a11 := by
    let midPrefix := common ++ List.replicate before D ++ [E]
    have hmiddleWord : middleBlocks =
        midPrefix ++ List.replicate rest.length D := by
      dsimp [middleBlocks, midPrefix]
    have hupperWord : common ++ after = midPrefix ++ rest := by
      rw [hsplit]
      dsimp [midPrefix]
      simp [List.append_assoc]
    rw [hmiddleWord, hupperWord]
    rw [matrixProduct_append midPrefix (List.replicate rest.length D),
      matrixProduct_append midPrefix rest]
    exact (Mat2.mul_mono_left (matrixProduct midPrefix) hrestMono).1
  have hstrictLists :
      (matrixProduct (common ++ List.replicate after.length D)).a11 <
        (matrixProduct middleBlocks).a11 := by
    rw [hlowerDecomp, hmiddleDecomp]
    exact hstrict
  exact hstrictLists.trans_le hmiddleUpper

end LatticePathOrdersKernel
