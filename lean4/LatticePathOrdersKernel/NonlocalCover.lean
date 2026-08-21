import LatticePathOrdersKernel.ThreeEBounds

/-!
# Uniform nonlocal matching cover
-/

namespace LatticePathOrdersKernel

open LatticePathOrders

theorem matrixProduct_mono_of_forall₂
    {lower upper : List Mat2} (h : List.Forall₂ Mat2.LE lower upper) :
    Mat2.LE (matrixProduct lower) (matrixProduct upper) := by
  simp only [Mat2.matrixProduct_eq_productR]
  induction h with
  | nil => exact Mat2.le_refl 1
  | cons hhead _ ih => exact Mat2.mul_mono hhead ih

theorem replicate_D_forall₂_DE
    {blocks : List Mat2} (hDE : DEWord blocks) :
    List.Forall₂ Mat2.LE (List.replicate blocks.length D) blocks := by
  induction blocks with
  | nil => exact List.Forall₂.nil
  | cons block tail ih =>
      simp only [List.length_cons, List.replicate_succ]
      apply List.Forall₂.cons
      · rcases hDE block (by simp) with rfl | rfl
        · exact Mat2.le_refl D
        · exact Mat2.D_le_E
      · exact ih hDE.tail

theorem matrixProduct_replicate_D_le_DE
    {blocks : List Mat2} (hDE : DEWord blocks) :
    Mat2.LE (matrixProduct (List.replicate blocks.length D))
      (matrixProduct blocks) :=
  matrixProduct_mono_of_forall₂ (replicate_D_forall₂_DE hDE)

theorem one_E_score
    {m : Nat} (hm : 1 ≤ m) :
    (matrixProduct ([E] ++ List.replicate (m - 1) D)).a11 = pell (m + 1) := by
  rw [matrixProduct_append, matrixProduct_replicate_D]
  have hsingle : matrixProduct [E] = E := by
    unfold matrixProduct
    simp only [List.foldl_cons, List.foldl_nil]
    exact Mat2.one_mul E
  rw [hsingle]
  have hrow := E_left_a11_eq_D_left (Mat2.pow D (m - 1))
  rw [hrow]
  have hpow : D * Mat2.pow D (m - 1) = Mat2.pow D m := by
    rw [show D * Mat2.pow D (m - 1) =
      Mat2.pow D 1 * Mat2.pow D (m - 1) by rw [pow_D_one],
      pow_D_mul_pow_D]
    congr 1
    omega
  rw [hpow, pow_D_pell]

theorem threeE_decomposition_product
    {m before middle after : Nat}
    (hlength : 1 + before + 1 + middle + 1 + after = m) :
    matrixProduct
        ([E] ++ List.replicate before D ++ [E] ++
          List.replicate middle D ++ [E] ++ List.replicate after D) =
      threeEBlockProduct m (before + 1) (before + middle + 2) := by
  have hi : before + 1 - 1 = before := by omega
  have hmid : before + middle + 2 - (before + 1) - 1 = middle := by omega
  have htail : m - 1 - (before + middle + 2) = after := by omega
  have h := matrixProduct_pattern_threeE m (before + 1) (before + middle + 2)
  rw [hi, hmid, htail] at h
  exact h

theorem three_E_path_outside
    {n : Nat} (hn : 4 ≤ n) {word : Path}
    (hword : Carrier n (n - 1) word)
    (hthree : (adjacencyBlocks word).count E = 3) :
    sourceMatchingNumber word ≤ sourceMatchingNumber (nonlocalX n) ∨
      sourceMatchingNumber (nonlocalY n) ≤ sourceMatchingNumber word := by
  let blocks := adjacencyBlocks word
  have hdata := carrier_nn1_block_data hn hword
  have hDE : DEWord blocks := hdata.2.2.2
  rcases initial_three_E_decomposition hdata.2.1 hDE hthree with
    ⟨before, middle, after, hdecomp⟩
  have hlength : 1 + before + 1 + middle + 1 + after = 2 * n - 2 := by
    have := congrArg List.length hdecomp
    simp at this
    omega
  have hproduct := threeE_decomposition_product hlength
  rw [← hdecomp] at hproduct
  rw [sourceMatchingNumber_eq_matchingScore]
  unfold matchingScore
  rw [hproduct]
  by_cases hfinal : after = 0
  · left
    subst after
    have hj : before + middle + 2 = 2 * n - 3 := by omega
    rw [hj]
    rw [nonlocalX_score hn]
    exact threeE_final_score_le_X hn (by omega) (by omega)
  · right
    rw [nonlocalY_score hn]
    exact threeE_nonfinal_score_ge_Y hn (by omega) (by omega) (by omega)

theorem many_E_reduced_product_le
    {before middle : Nat} {after : List Mat2}
    (hafterDE : DEWord after) :
    (matrixProduct
        ([E] ++ List.replicate before D ++ [E] ++
          List.replicate middle D ++ [E] ++
          List.replicate after.length D)).a11 ≤
      (matrixProduct
        ([E] ++ List.replicate before D ++ [E] ++
          List.replicate middle D ++ [E] ++ after)).a11 := by
  let commonBlocks := [E] ++ List.replicate before D ++ [E] ++
    List.replicate middle D ++ [E]
  have hlower : matrixProduct
      ([E] ++ List.replicate before D ++ [E] ++
        List.replicate middle D ++ [E] ++ List.replicate after.length D) =
      matrixProduct commonBlocks *
        matrixProduct (List.replicate after.length D) := by
    rw [show [E] ++ List.replicate before D ++ [E] ++
        List.replicate middle D ++ [E] ++ List.replicate after.length D =
        commonBlocks ++ List.replicate after.length D by rfl,
      matrixProduct_append]
  have hupper : matrixProduct
      ([E] ++ List.replicate before D ++ [E] ++
        List.replicate middle D ++ [E] ++ after) =
      matrixProduct commonBlocks * matrixProduct after := by
    rw [show [E] ++ List.replicate before D ++ [E] ++
        List.replicate middle D ++ [E] ++ after = commonBlocks ++ after by rfl,
      matrixProduct_append]
  rw [hlower, hupper]
  exact (Mat2.mul_mono_left (matrixProduct commonBlocks)
    (matrixProduct_replicate_D_le_DE hafterDE)).1

theorem many_E_path_above_Y
    {n : Nat} (hn : 4 ≤ n) {word : Path}
    (hword : Carrier n (n - 1) word)
    (hmany : 5 ≤ (adjacencyBlocks word).count E) :
    sourceMatchingNumber (nonlocalY n) ≤ sourceMatchingNumber word := by
  let blocks := adjacencyBlocks word
  have hdata := carrier_nn1_block_data hn hword
  have hDE : DEWord blocks := hdata.2.2.2
  dsimp [blocks] at hdata hDE
  cases hblocks : adjacencyBlocks word with
  | nil =>
      rw [hblocks] at hdata
      simp at hdata
  | cons first tail =>
      rw [hblocks] at hdata hDE hmany
      have hhead : first = E := by
        simpa using hdata.2.1
      subst first
      have htailMany : 4 ≤ tail.count E := by
        simpa using hmany
      rcases decompose_two_E hDE.tail (by omega) with
        ⟨before, middle, after, htail, hafterCount, hafterDE⟩
      have hafterTwo : 2 ≤ after.count E := by omega
      have hafterLength : 2 ≤ after.length := by
        have hcountLen : after.count E ≤ after.length := List.count_le_length
        omega
      have hdecomp : adjacencyBlocks word =
          [E] ++ List.replicate before D ++ [E] ++
            List.replicate middle D ++ [E] ++ after := by
        rw [hblocks, htail]
        simp [List.append_assoc]
      have hlength : 1 + before + 1 + middle + 1 + after.length =
          2 * n - 2 := by
        have := congrArg List.length hdecomp
        rw [hblocks, hdata.1] at this
        simp at this
        omega
      have hproduct := threeE_decomposition_product hlength
      have hmono := many_E_reduced_product_le
        (before := before) (middle := middle) hafterDE
      rw [← hdecomp] at hmono
      rw [sourceMatchingNumber_eq_matchingScore,
        sourceMatchingNumber_eq_matchingScore]
      unfold matchingScore
      apply le_trans ?_ hmono
      have hy := nonlocalY_score hn
      rw [sourceMatchingNumber_eq_matchingScore] at hy
      unfold matchingScore at hy
      rw [hy]
      rw [hproduct]
      exact threeE_nonfinal_score_ge_Y hn (by omega) (by omega) (by omega)

/-- Interval-exclusion core of manuscript Theorem `thm:nonlocal`. -/
theorem every_nn1_path_outside_nonlocal_interval
    {n : Nat} (hn : 4 ≤ n) {word : Path}
    (hword : Carrier n (n - 1) word) :
    sourceMatchingNumber word ≤ sourceMatchingNumber (nonlocalX n) ∨
      sourceMatchingNumber (nonlocalY n) ≤ sourceMatchingNumber word := by
  let blocks := adjacencyBlocks word
  have hdata := carrier_nn1_block_data hn hword
  dsimp only at hdata
  have hodd := hdata.2.2.1
  by_cases hone : blocks.count E = 1
  · left
    have hdecomp := initial_one_E_decomposition hdata.2.1 hdata.2.2.2 hone
    rw [sourceMatchingNumber_eq_matchingScore, nonlocalX_score hn]
    unfold matchingScore
    rw [hdecomp, one_E_score (by omega)]
    have hlength := hdata.1
    have hbase : blocks.length + 1 = 2 * n - 1 := by
      dsimp [blocks]
      have := hdata.1
      omega
    rw [hbase]
    omega
  · by_cases hthree : blocks.count E = 3
    · exact three_E_path_outside hn hword hthree
    · right
      apply many_E_path_above_Y hn hword
      rcases hodd with ⟨k, hk⟩
      by_cases hk0 : k = 0
      · subst k
        simp at hk
        exact False.elim (hone hk)
      by_cases hk1 : k = 1
      · subst k
        norm_num at hk
        exact False.elim (hthree hk)
      omega

/-- Cover clause of manuscript Theorem `thm:nonlocal`. -/
theorem nonlocal_matching_cover {n : Nat} (hn : 4 ≤ n) :
    PullbackCover (Carrier n (n - 1)) sourceMatchingNumber
      (nonlocalX n) (nonlocalY n) := by
  refine ⟨nonlocalX_carrier hn, nonlocalY_carrier hn,
    nonlocalX_lt_nonlocalY hn, ?_⟩
  intro word hword
  intro hbetween
  rcases every_nn1_path_outside_nonlocal_interval hn hword with hbelow | habove
  · exact (not_lt_of_ge hbelow) hbetween.1
  · exact (not_lt_of_ge habove) hbetween.2

end LatticePathOrdersKernel
