import LatticePathOrdersKernel.EBlockDecomposition

/-! # Score bounds for all three-`E` block words -/

namespace LatticePathOrdersKernel

open LatticePathOrders

theorem odd_two_n_sub_three {n : Nat} (hn : 2 ≤ n) :
    Odd (2 * n - 3) := by
  refine ⟨n - 2, ?_⟩
  omega

theorem threeE_final_score_le_X
    {n i : Nat} (hn : 4 ≤ n) (hi : 1 ≤ i)
    (hiN : i < 2 * n - 3) :
    (threeEBlockProduct (2 * n - 2) i (2 * n - 3)).a11 ≤
      pell (2 * n - 1) + pellF (2 * n - 3) 1 := by
  rw [three_E_formula hi hiN (by omega)]
  have hext := pell_extrema (odd_two_n_sub_three (by omega)) (by omega)
    hi (by omega : i ≤ (2 * n - 3) - 1)
  have hbase : 2 * n - 2 + 1 = 2 * n - 1 := by omega
  have hN : 2 * n - 2 - 1 = 2 * n - 3 := by omega
  rw [hbase, hN]
  unfold pellF threeEInteraction
  have htail : 2 * n - 2 - 1 - (2 * n - 3) = 0 := by omega
  rw [htail]
  simp
  unfold pellF at hext
  simpa using hext.1

theorem exceptional_threeE_ge_Y
    {n : Nat} (hn : 4 ≤ n) :
    pellF (2 * n - 3) 2 + pellF (2 * n - 3) (2 * n - 5) +
        threeEInteraction (2 * n - 2) 2 (2 * n - 5) ≥
      pellF (2 * n - 3) 2 + pellF (2 * n - 3) 4 := by
  by_cases hn4 : n = 4
  · subst n
    norm_num [pellF, threeEInteraction, pell, pellPrevious]
  have hn5 : 5 ≤ n := by omega
  let N := 2 * n - 3
  have hid := pellF_two_step_identity
    (N := N) (k := 2) (by dsimp [N]; omega)
  have heven : Even 2 := ⟨1, by omega⟩
  rw [heven.neg_one_pow] at hid
  have hindex : N - 2 * 2 - 2 = 2 * n - 9 := by dsimp [N]; omega
  rw [hindex] at hid
  have hF4 : pellF N 4 = pellF N 2 + 2 * pell (2 * n - 9) := by
    have hid' : (pellF N 4 : Int) - pellF N 2 =
        2 * pell (2 * n - 9) := by
      norm_num at hid ⊢
      exact hid
    have hcast : (pellF N 4 : Int) =
        pellF N 2 + 2 * pell (2 * n - 9) := by omega
    exact_mod_cast hcast
  have hsym := pellF_symm (N := N) (k := 2 * n - 5) (by dsimp [N]; omega)
  have hsym' : pellF N (2 * n - 5) = pellF N 2 := by
    have hidx : N - (2 * n - 5) = 2 := by dsimp [N]; omega
    rw [hidx] at hsym
    exact hsym
  have hinteraction :
      threeEInteraction (2 * n - 2) 2 (2 * n - 5) =
        4 * pell (2 * n - 9) := by
    unfold threeEInteraction
    have hmid : 2 * n - 5 - 2 - 1 = 2 * n - 8 := by omega
    have htail : 2 * n - 2 - 1 - (2 * n - 5) = 2 := by omega
    rw [hmid, htail]
    have hprev : pellPrevious (2 * n - 8) = pell (2 * n - 9) := by
      have hidx : 2 * n - 8 = (2 * n - 9) + 1 := by omega
      rw [hidx]
      rfl
    rw [hprev]
    norm_num [pell]
    ring
  dsimp [N] at hF4 hsym' ⊢
  rw [hsym', hinteraction, hF4]
  omega

theorem threeEInteraction_pos_of_gap_ne_two
    {m i j : Nat} (hi : 0 < i) (hij : i < j)
    (hj : j ≤ m - 2) (hgap : j ≠ i + 2) :
    0 < threeEInteraction m i j := by
  unfold threeEInteraction
  have hpi := pell_pos hi
  have htailPos : 0 < pell (m - 1 - j) := pell_pos (by omega)
  have hprevPos : 0 < pellPrevious (j - i - 1) := by
    have hidx : 0 < j - i := by omega
    cases h : j - i - 1 with
    | zero => simp [pellPrevious]
    | succ k =>
        cases k with
        | zero =>
            exfalso
            omega
        | succ q =>
            simp [pellPrevious]
            exact pell_pos (by omega)
  positivity

theorem threeEInteraction_eq_zero_implies_gap_two
    {m i j : Nat} (hi : 0 < i) (hij : i < j)
    (hj : j ≤ m - 2)
    (hzero : threeEInteraction m i j = 0) :
    j = i + 2 := by
  by_contra hgap
  exact (Nat.ne_of_gt
    (threeEInteraction_pos_of_gap_ne_two hi hij hj hgap)) hzero

theorem exceptional_threeE_gt_Y
    {n : Nat} (hn : 5 ≤ n) :
    pellF (2 * n - 3) 2 + pellF (2 * n - 3) (2 * n - 5) +
        threeEInteraction (2 * n - 2) 2 (2 * n - 5) >
      pellF (2 * n - 3) 2 + pellF (2 * n - 3) 4 := by
  have hge := exceptional_threeE_ge_Y (by omega : 4 ≤ n)
  have hinterPos := threeEInteraction_pos_of_gap_ne_two
    (m := 2 * n - 2) (i := 2) (j := 2 * n - 5)
    (by omega) (by omega) (by omega) (by omega)
  -- The explicit exceptional calculation in `exceptional_threeE_ge_Y`
  -- has positive margin; replay the same Pell identity to rule out equality.
  let N := 2 * n - 3
  have hid := pellF_two_step_identity
    (N := N) (k := 2) (by dsimp [N]; omega)
  have heven : Even 2 := ⟨1, by omega⟩
  rw [heven.neg_one_pow] at hid
  have hindex : N - 2 * 2 - 2 = 2 * n - 9 := by dsimp [N]; omega
  rw [hindex] at hid
  have hF4 : pellF N 4 = pellF N 2 + 2 * pell (2 * n - 9) := by
    have hid' : (pellF N 4 : Int) - pellF N 2 =
        2 * pell (2 * n - 9) := by norm_num at hid ⊢; exact hid
    have hz : (pellF N 4 : Int) =
        pellF N 2 + 2 * pell (2 * n - 9) := by omega
    exact_mod_cast hz
  have hsym := pellF_symm (N := N) (k := 2 * n - 5) (by dsimp [N]; omega)
  have hidx : N - (2 * n - 5) = 2 := by dsimp [N]; omega
  rw [hidx] at hsym
  have hinter : threeEInteraction (2 * n - 2) 2 (2 * n - 5) =
      4 * pell (2 * n - 9) := by
    unfold threeEInteraction
    have hmid : 2 * n - 5 - 2 - 1 = (2 * n - 9) + 1 := by omega
    have htail : 2 * n - 2 - 1 - (2 * n - 5) = 2 := by omega
    rw [hmid, htail]
    simp [pellPrevious, pell]
    ring
  have hp := pell_pos (n := 2 * n - 9) (by omega)
  dsimp [N] at hF4 hsym ⊢
  rw [hsym, hinter, hF4]
  omega

theorem threeE_nonfinal_score_ge_Y
    {n i j : Nat} (hn : 4 ≤ n) (hi : 1 ≤ i)
    (hij : i < j) (hj : j ≤ 2 * n - 4) :
    pell (2 * n - 1) + pellF (2 * n - 3) 2 +
        pellF (2 * n - 3) 4 ≤
      (threeEBlockProduct (2 * n - 2) i j).a11 := by
  rw [three_E_formula hi hij (by omega)]
  have hbase : 2 * n - 2 + 1 = 2 * n - 1 := by omega
  have hN : 2 * n - 2 - 1 = 2 * n - 3 := by omega
  rw [hbase, hN]
  let N := 2 * n - 3
  have hodd : Odd N := by dsimp [N]; exact odd_two_n_sub_three (by omega)
  have hNfive : 5 ≤ N := by dsimp [N]; omega
  have hiRange : i ≤ N - 1 := by dsimp [N]; omega
  have hjRange : j ≤ N - 1 := by dsimp [N]; omega
  have hiLower := (pell_extrema hodd hNfive hi hiRange).2.1
  have hjLower := (pell_extrema hodd hNfive (by omega) hjRange).2.1
  by_cases hexception : i = 2 ∧ j = N - 2
  · rcases hexception with ⟨rfl, hjEq⟩
    have hjConcrete : N - 2 = 2 * n - 5 := by dsimp [N]; omega
    rw [hjConcrete] at hjEq
    subst j
    have hex := exceptional_threeE_ge_Y hn
    omega
  · by_cases hiMinimum : i = 2 ∨ i = N - 2
    · have hjNot2 : j ≠ 2 := by omega
      have hjNotN2 : j ≠ N - 2 := by
        intro hjEq
        apply hexception
        constructor
        · rcases hiMinimum with hi2 | hiN2
          · exact hi2
          · omega
        · exact hjEq
      have hjAway := pell_extrema_away hodd hNfive (by omega)
        hjRange hjNot2 hjNotN2
      dsimp [N] at hiLower hjAway ⊢
      omega
    · have hiNot2 : i ≠ 2 := fun hi2 => hiMinimum (Or.inl hi2)
      have hiNotN2 : i ≠ N - 2 := fun hiN2 => hiMinimum (Or.inr hiN2)
      have hiAway := pell_extrema_away hodd hNfive hi hiRange
        hiNot2 hiNotN2
      dsimp [N] at hiAway hjLower ⊢
      omega

theorem threeE_nonfinal_eq_Y_positions
    {n i j : Nat} (hn : 4 ≤ n) (hi : 1 ≤ i)
    (hij : i < j) (hj : j ≤ 2 * n - 4)
    (heq : (threeEBlockProduct (2 * n - 2) i j).a11 =
      pell (2 * n - 1) + pellF (2 * n - 3) 2 +
        pellF (2 * n - 3) 4) :
    (i = 2 ∧ j = 4) ∨ (i = 2 * n - 7 ∧ j = 2 * n - 5) := by
  let N := 2 * n - 3
  have hodd : Odd N := by dsimp [N]; exact odd_two_n_sub_three (by omega)
  have hNfive : 5 ≤ N := by dsimp [N]; omega
  have hiRange : i ≤ N - 1 := by dsimp [N]; omega
  have hjRange : j ≤ N - 1 := by dsimp [N]; omega
  have hiExt := pell_extrema hodd hNfive hi hiRange
  have hjExt := pell_extrema hodd hNfive (by omega) hjRange
  have hformula := three_E_formula (m := 2 * n - 2)
    (i := i) (j := j) hi hij (by omega)
  rw [hformula] at heq
  have hbase : 2 * n - 2 + 1 = 2 * n - 1 := by omega
  have hNidx : 2 * n - 2 - 1 = N := by dsimp [N]; omega
  rw [hbase, hNidx] at heq
  have heqClean : pellF N i + pellF N j +
        threeEInteraction (2 * n - 2) i j =
      pellF N 2 + pellF N 4 := by
    dsimp [N] at heq ⊢
    omega
  have hf4gt : pellF N 2 < pellF N 4 := by
    by_cases hn4 : n = 4
    · subst n
      norm_num [N, pellF, pell]
    by_cases hn5 : n = 5
    · subst n
      norm_num [N, pellF, pell]
    · exact pellF_even_gt_second (N := N) (k := 4)
        (by exact ⟨2, by omega⟩) (by omega) (by dsimp [N]; omega)
  by_cases hiMin : i = 2 ∨ i = N - 2
  · by_cases hjMin : j = 2 ∨ j = N - 2
    · have hi2 : i = 2 := by rcases hiMin with h | h <;> omega
      have hjN2 : j = N - 2 := by rcases hjMin with h | h <;> omega
      subst i
      have hjConcrete : N - 2 = 2 * n - 5 := by dsimp [N]; omega
      rw [hjConcrete] at hjN2
      subst j
      by_cases hn4 : n = 4
      · subst n
        norm_num [N, pellF, threeEInteraction, pellPrevious, pell] at heqClean
      · have hstrict := exceptional_threeE_gt_Y (by omega : 5 ≤ n)
        dsimp [N] at heqClean
        exact False.elim ((ne_of_gt hstrict) heqClean)
    · have hiEqMin : pellF N i = pellF N 2 :=
        hiExt.2.2.mpr hiMin
      have hjNot2 : j ≠ 2 := fun h => hjMin (Or.inl h)
      have hjNotN2 : j ≠ N - 2 := fun h => hjMin (Or.inr h)
      have hjAway := pell_extrema_away hodd hNfive (by omega)
        hjRange hjNot2 hjNotN2
      have hinterZero : threeEInteraction (2 * n - 2) i j = 0 := by
        omega
      have hjEq4 : pellF N j = pellF N 4 := by omega
      have hjPos := (pellF_eq_four_iff hodd hNfive (by omega) hjRange
        hjNot2 hjNotN2).mp hjEq4
      have hgap := threeEInteraction_eq_zero_implies_gap_two
        (m := 2 * n - 2) (i := i) (j := j) (by omega) hij (by omega)
        hinterZero
      rcases hiMin with hi2 | hiN2
      · left
        exact ⟨hi2, by omega⟩
      · exfalso
        omega
  · by_cases hjMin : j = 2 ∨ j = N - 2
    · have hjEqMin : pellF N j = pellF N 2 :=
        hjExt.2.2.mpr hjMin
      have hiNot2 : i ≠ 2 := fun h => hiMin (Or.inl h)
      have hiNotN2 : i ≠ N - 2 := fun h => hiMin (Or.inr h)
      have hiAway := pell_extrema_away hodd hNfive hi hiRange
        hiNot2 hiNotN2
      have hinterZero : threeEInteraction (2 * n - 2) i j = 0 := by
        omega
      have hiEq4 : pellF N i = pellF N 4 := by omega
      have hiPos := (pellF_eq_four_iff hodd hNfive hi hiRange
        hiNot2 hiNotN2).mp hiEq4
      have hgap := threeEInteraction_eq_zero_implies_gap_two
        (m := 2 * n - 2) (i := i) (j := j) (by omega) hij (by omega)
        hinterZero
      have hjN2 : j = N - 2 := by rcases hjMin with h | h <;> omega
      right
      dsimp [N] at hjN2 ⊢
      rcases hiPos with hi4 | hiN4
      · omega
      · exact ⟨by omega, by omega⟩
    · have hiAway := pell_extrema_away hodd hNfive hi hiRange
        (fun h => hiMin (Or.inl h)) (fun h => hiMin (Or.inr h))
      have hjAway := pell_extrema_away hodd hNfive (by omega) hjRange
        (fun h => hjMin (Or.inl h)) (fun h => hjMin (Or.inr h))
      omega

end LatticePathOrdersKernel
