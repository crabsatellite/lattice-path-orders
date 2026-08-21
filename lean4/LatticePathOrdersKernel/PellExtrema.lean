import LatticePathOrdersKernel.PellCore

/-!
# Extremal Pell products

This file proves manuscript Lemma `lem:pell-extrema` in its literal range,
including both equality and away-from-minimum clauses.
-/

namespace LatticePathOrdersKernel

theorem pellF_odd_le_first
    {N k : Nat} (hk : Odd k) (hkpos : 1 ≤ k) (hhalf : 2 * k < N) :
    pellF N k ≤ pellF N 1 := by
  rcases hk with ⟨t, rfl⟩
  induction t with
  | zero => simp
  | succ t ih =>
      have hprevOdd : Odd (2 * t + 1) := ⟨t, by omega⟩
      have hstep := pellF_odd_two_step_decreases
        (N := N) (k := 2 * t + 1) hprevOdd (by omega)
      have hindex : 2 * t + 1 + 2 = 2 * (t + 1) + 1 := by omega
      rw [hindex] at hstep
      have ihBound : pellF N (2 * t + 1) ≤ pellF N 1 :=
        ih (by omega) (by omega)
      omega

theorem pellF_even_ge_second
    {N k : Nat} (hk : Even k) (hk2 : 2 ≤ k) (hhalf : 2 * k < N) :
    pellF N 2 ≤ pellF N k := by
  rcases hk with ⟨t, rfl⟩
  have ht : 1 ≤ t := by omega
  obtain ⟨s, rfl⟩ : ∃ s, t = s + 1 := by
    exact ⟨t - 1, by omega⟩
  induction s with
  | zero => simp
  | succ s ih =>
      have hprevEven : Even (2 * (s + 1)) := ⟨s + 1, by omega⟩
      have hstep := pellF_even_two_step_increases
        (N := N) (k := 2 * (s + 1)) hprevEven (by omega)
      have ihRaw := ih (by omega) (by omega) (by omega)
      have hprevIndex : (s + 1) + (s + 1) = 2 * (s + 1) := by omega
      rw [hprevIndex] at ihRaw
      have ihBound : pellF N 2 ≤ pellF N (2 * (s + 1)) := ihRaw
      have hchain := ihBound.trans hstep.le
      have hcurrentIndex : (s + 1 + 1) + (s + 1 + 1) =
          2 * (s + 1) + 2 := by omega
      rw [hcurrentIndex]
      exact hchain

theorem pellF_even_gt_second
    {N k : Nat} (hk : Even k) (hk2 : 2 < k) (hhalf : 2 * k < N) :
    pellF N 2 < pellF N k := by
  rcases hk with ⟨t, rfl⟩
  have ht : 1 < t := by omega
  obtain ⟨s, rfl⟩ : ∃ s, t = s + 2 := by
    exact ⟨t - 2, by omega⟩
  have hprevEven : Even (2 * (s + 1)) := ⟨s + 1, by omega⟩
  have hprevBound := pellF_even_ge_second
    (N := N) (k := 2 * (s + 1)) hprevEven (by omega) (by omega)
  have hstep := pellF_even_two_step_increases
    (N := N) (k := 2 * (s + 1)) hprevEven (by omega)
  have hchain := hprevBound.trans_lt hstep
  have hcurrentIndex : (s + 2) + (s + 2) =
      2 * (s + 1) + 2 := by omega
  rw [hcurrentIndex]
  exact hchain

theorem pellF_half_upper
    {N k : Nat} (hkpos : 1 ≤ k) (hhalf : 2 * k < N) :
    pellF N k ≤ pellF N 1 := by
  rcases Nat.even_or_odd k with hkEven | hkOdd
  · have hk2 : 2 ≤ k := by
      rcases hkEven with ⟨t, rfl⟩
      omega
    have hprevOdd : Odd (k - 1) := by
      rcases hkEven with ⟨t, ht⟩
      have htpos : 0 < t := by omega
      refine ⟨t - 1, ?_⟩
      omega
    have hprev := pellF_odd_le_first
      (N := N) (k := k - 1) hprevOdd (by omega) (by omega)
    have hstep := pellF_odd_gt_next
      (N := N) (k := k - 1) hprevOdd (by omega)
    have hnext : k - 1 + 1 = k := by omega
    rw [hnext] at hstep
    omega
  · exact pellF_odd_le_first hkOdd hkpos hhalf

theorem pellF_half_lower
    {N k : Nat} (hN : 5 ≤ N) (hkpos : 1 ≤ k)
    (hhalf : 2 * k < N) :
    pellF N 2 ≤ pellF N k := by
  rcases Nat.even_or_odd k with hkEven | hkOdd
  · have hk2 : 2 ≤ k := by
      rcases hkEven with ⟨t, rfl⟩
      omega
    exact pellF_even_ge_second hkEven hk2 hhalf
  · by_cases hk1 : k = 1
    · subst k
      have hstep := pellF_odd_gt_next
        (N := N) (k := 1) (by exact ⟨0, by omega⟩) (by omega)
      norm_num at hstep
      omega
    · have hk3 : 3 ≤ k := by
        rcases hkOdd with ⟨t, ht⟩
        omega
      have hprevEven : Even (k - 1) := by
        rcases hkOdd with ⟨t, ht⟩
        refine ⟨t, ?_⟩
        omega
      have hprev := pellF_even_ge_second
        (N := N) (k := k - 1) hprevEven (by omega) (by omega)
      have hstep := pellF_even_lt_next
        (N := N) (k := k - 1) hprevEven (by omega)
      have hnext : k - 1 + 1 = k := by omega
      rw [hnext] at hstep
      omega

theorem pellF_half_eq_second_iff
    {N k : Nat} (hN : 5 ≤ N) (hkpos : 1 ≤ k)
    (hhalf : 2 * k < N) :
    pellF N k = pellF N 2 ↔ k = 2 := by
  constructor
  · intro heq
    rcases Nat.even_or_odd k with hkEven | hkOdd
    · by_contra hkne
      have hkgt : 2 < k := by
        rcases hkEven with ⟨t, rfl⟩
        omega
      exact (ne_of_gt (pellF_even_gt_second hkEven hkgt hhalf)) heq
    · have hstrict : pellF N 2 < pellF N k := by
        by_cases hk1 : k = 1
        · subst k
          exact pellF_odd_gt_next
            (N := N) (k := 1) ⟨0, by omega⟩ (by omega)
        · have hk3 : 3 ≤ k := by
            rcases hkOdd with ⟨t, ht⟩
            omega
          have hprevEven : Even (k - 1) := by
            rcases hkOdd with ⟨t, ht⟩
            exact ⟨t, by omega⟩
          have hprev := pellF_even_ge_second
            (N := N) (k := k - 1) hprevEven (by omega) (by omega)
          have hstep := pellF_even_lt_next
            (N := N) (k := k - 1) hprevEven (by omega)
          have hnext : k - 1 + 1 = k := by omega
          rw [hnext] at hstep
          omega
      exfalso
      exact (ne_of_gt hstrict) heq
  · rintro rfl
    rfl

theorem pellF_reduce_min {N k : Nat} (hk : k ≤ N) :
    pellF N k = pellF N (min k (N - k)) := by
  by_cases hle : k ≤ N - k
  · rw [min_eq_left hle]
  · rw [min_eq_right (Nat.le_of_not_ge hle)]
    exact pellF_symm hk

/-- Manuscript Lemma `lem:pell-extrema`, first two inequalities and the exact
minimum equality cases. -/
theorem pell_extrema
    {N k : Nat} (hNOdd : Odd N) (hN : 5 ≤ N)
    (hk1 : 1 ≤ k) (hkN : k ≤ N - 1) :
    pellF N k ≤ pellF N 1 ∧
      pellF N 2 ≤ pellF N k ∧
      (pellF N k = pellF N 2 ↔ k = 2 ∨ k = N - 2) := by
  let reduced := min k (N - k)
  have hkLeN : k ≤ N := by omega
  have hNkPos : 1 ≤ N - k := by omega
  have hreducedPos : 1 ≤ reduced := by
    dsimp [reduced]
    omega
  have hreducedTwice : 2 * reduced ≤ N := by
    dsimp [reduced]
    omega
  have hreducedHalf : 2 * reduced < N := by
    rcases hNOdd with ⟨s, hs⟩
    omega
  have hreduce := pellF_reduce_min hkLeN
  have hupper := pellF_half_upper hreducedPos hreducedHalf
  have hlower := pellF_half_lower hN hreducedPos hreducedHalf
  have heq := pellF_half_eq_second_iff hN hreducedPos hreducedHalf
  rw [hreduce]
  refine ⟨hupper, hlower, ?_⟩
  constructor
  · intro hkEq
    have hr : reduced = 2 := heq.mp hkEq
    dsimp [reduced] at hr
    by_cases hle : k ≤ N - k
    · left
      rw [min_eq_left hle] at hr
      exact hr
    · right
      rw [min_eq_right (Nat.le_of_not_ge hle)] at hr
      omega
  · intro hkCases
    apply heq.mpr
    rcases hkCases with rfl | rfl
    · dsimp [reduced]
      rw [min_eq_left (by omega)]
    · dsimp [reduced]
      rw [min_eq_right (by omega)]
      omega

theorem pellF_even_ge_four
    {N k : Nat} (hk : Even k) (hk4 : 4 ≤ k) (hhalf : 2 * k < N) :
    pellF N 4 ≤ pellF N k := by
  rcases hk with ⟨t, rfl⟩
  have ht : 2 ≤ t := by omega
  obtain ⟨s, rfl⟩ : ∃ s, t = s + 2 := by
    exact ⟨t - 2, by omega⟩
  induction s with
  | zero => norm_num
  | succ s ih =>
      have hprevEven : Even (2 * (s + 2)) := ⟨s + 2, by omega⟩
      have hstep := pellF_even_two_step_increases
        (N := N) (k := 2 * (s + 2)) hprevEven (by omega)
      have ihBound := ih (by omega) (by omega) (by omega)
      have hprevIndex : (s + 2) + (s + 2) = 2 * (s + 2) := by omega
      rw [hprevIndex] at ihBound
      have ihBound' : pellF N 4 ≤ pellF N (2 * (s + 2)) := ihBound
      have hchain := ihBound'.trans hstep.le
      have hcurrentIndex : (s + 1 + 2) + (s + 1 + 2) =
          2 * (s + 2) + 2 := by omega
      rw [hcurrentIndex]
      exact hchain

theorem pellF_even_gt_four
    {N k : Nat} (hk : Even k) (hk4 : 4 < k) (hhalf : 2 * k < N) :
    pellF N 4 < pellF N k := by
  rcases hk with ⟨t, rfl⟩
  have ht : 2 < t := by omega
  obtain ⟨s, rfl⟩ : ∃ s, t = s + 3 := by
    exact ⟨t - 3, by omega⟩
  have hprevEven : Even (2 * (s + 2)) := ⟨s + 2, by omega⟩
  have hprev := pellF_even_ge_four
    (N := N) (k := 2 * (s + 2)) hprevEven (by omega) (by omega)
  have hstep := pellF_even_two_step_increases
    (N := N) (k := 2 * (s + 2)) hprevEven (by omega)
  have hchain := hprev.trans_lt hstep
  have hindex : (s + 3) + (s + 3) = 2 * (s + 2) + 2 := by omega
  rw [hindex]
  exact hchain

theorem pellF_eq_four_iff
    {N k : Nat} (hNOdd : Odd N) (hN : 5 ≤ N)
    (hk1 : 1 ≤ k) (hkN : k ≤ N - 1)
    (hk2 : k ≠ 2) (hkN2 : k ≠ N - 2) :
    pellF N k = pellF N 4 ↔ k = 4 ∨ k = N - 4 := by
  by_cases hN5 : N = 5
  · subst N
    interval_cases k <;> norm_num [pellF, pell] at *
  by_cases hN7 : N = 7
  · subst N
    interval_cases k <;> norm_num [pellF, pell] at *
  by_cases hN9 : N = 9
  · subst N
    interval_cases k <;> norm_num [pellF, pell] at *
  have hN11 : 11 ≤ N := by
    rcases hNOdd with ⟨s, hs⟩
    omega
  let r := min k (N - k)
  have hkLeN : k ≤ N := by omega
  have hrPos : 1 ≤ r := by dsimp [r]; omega
  have hrHalf : 2 * r < N := by
    rcases hNOdd with ⟨s, hs⟩
    dsimp [r]
    omega
  have hrNe2 : r ≠ 2 := by
    intro hr
    have hreduce := pellF_reduce_min hkLeN
    change pellF N k = pellF N r at hreduce
    rw [hr] at hreduce
    have heqMin := (pell_extrema hNOdd hN hk1 hkN).2.2.mp hreduce
    exact heqMin.elim hk2 hkN2
  have hreduce := pellF_reduce_min hkLeN
  change pellF N k = pellF N r at hreduce
  constructor
  · intro heq
    have hrEq : pellF N r = pellF N 4 := hreduce.symm.trans heq
    have hr4 : r = 4 := by
      rcases Nat.even_or_odd r with hrEven | hrOdd
      · by_cases heq4 : r = 4
        · exact heq4
        · have hrGt : 4 < r := by
            rcases hrEven with ⟨t, ht⟩
            omega
          exact False.elim ((ne_of_gt
            (pellF_even_gt_four hrEven hrGt hrHalf)) hrEq)
      · have hstrict : pellF N 4 < pellF N r := by
          by_cases hr1 : r = 1
          · subst r
            have h13 := pellF_odd_two_step_decreases
              (N := N) (k := 1) (by exact ⟨0, by omega⟩) (by omega)
            have h34 := pellF_odd_gt_next
              (N := N) (k := 3) (by exact ⟨1, by omega⟩) (by omega)
            norm_num at h13
            have hchain := h34.trans h13
            simpa [hr1] using hchain
          · have hr3 : 3 ≤ r := by
              rcases hrOdd with ⟨t, ht⟩
              omega
            by_cases hr3eq : r = 3
            · have h34 := pellF_odd_gt_next
                (N := N) (k := 3) (by exact ⟨1, by omega⟩) (by omega)
              simpa [hr3eq] using h34
            · have hr5 : 5 ≤ r := by
                rcases hrOdd with ⟨t, ht⟩
                omega
              by_cases hcentral : N = 2 * r + 1
              · have hprevEven : Even (r - 1) := by
                  rcases hrOdd with ⟨t, ht⟩
                  exact ⟨t, by omega⟩
                have hstep := pellF_even_lt_next
                  (N := N) (k := r - 1) hprevEven (by omega)
                have hidx : r - 1 + 1 = r := by omega
                rw [hidx] at hstep
                by_cases hrEq5 : r = 5
                · have hprev : r - 1 = 4 := by omega
                  rw [hprev] at hstep
                  exact hstep
                · have hprev := pellF_even_gt_four
                    (N := N) (k := r - 1) hprevEven (by omega) (by omega)
                  exact hprev.trans hstep
              · have hnextEven : Even (r + 1) := hrOdd.add_one
                have hnextHalf : 2 * (r + 1) < N := by
                  rcases hNOdd with ⟨s, hs⟩
                  omega
                have hnext := pellF_even_gt_four
                  (N := N) (k := r + 1) hnextEven (by omega) hnextHalf
                have hstep := pellF_odd_gt_next
                  (N := N) (k := r) hrOdd (by omega)
                exact hnext.trans hstep
        exact False.elim ((ne_of_gt hstrict) hrEq)
    dsimp [r] at hr4
    by_cases hle : k ≤ N - k
    · left
      rw [min_eq_left hle] at hr4
      exact hr4
    · right
      rw [min_eq_right (Nat.le_of_not_ge hle)] at hr4
      omega
  · intro hcases
    rcases hcases with rfl | rfl
    · rfl
    · have hsym := pellF_symm (N := N) (k := N - 4) (by omega)
      have hidx : N - (N - 4) = 4 := by omega
      rw [hidx] at hsym
      exact hsym

/-- Away from the two minimum positions, the uniform `f(4)` lower bound in
manuscript Lemma `lem:pell-extrema`. -/
theorem pell_extrema_away
    {N k : Nat} (hNOdd : Odd N) (hN : 5 ≤ N)
    (hk1 : 1 ≤ k) (hkN : k ≤ N - 1)
    (hk2 : k ≠ 2) (hkN2 : k ≠ N - 2) :
    pellF N 4 ≤ pellF N k := by
  have hfourRange : 4 ≤ N - 1 := by omega
  have hfourUpper := (pell_extrema hNOdd hN (k := 4)
    (by omega) hfourRange).1
  have hkLower := (pell_extrema hNOdd hN hk1 hkN).2.1
  have hkStrict : pellF N 2 < pellF N k := by
    have hEqCases := (pell_extrema hNOdd hN hk1 hkN).2.2
    exact lt_of_le_of_ne hkLower (fun heq => by
      have cases := hEqCases.mp heq.symm
      exact cases.elim hk2 hkN2)
  let r := min k (N - k)
  have hkLeN : k ≤ N := by omega
  have hrPos : 1 ≤ r := by dsimp [r]; omega
  have hrHalf : 2 * r < N := by
    rcases hNOdd with ⟨s, hs⟩
    dsimp [r]
    omega
  have hrNe2 : r ≠ 2 := by
    intro hr
    have hreduce := pellF_reduce_min hkLeN
    change pellF N k = pellF N r at hreduce
    rw [hr] at hreduce
    exact (ne_of_gt hkStrict) hreduce
  rw [pellF_reduce_min hkLeN]
  change pellF N 4 ≤ pellF N r
  rcases Nat.even_or_odd r with hrEven | hrOdd
  · have hr4 : 4 ≤ r := by
      rcases hrEven with ⟨t, ht⟩
      omega
    exact pellF_even_ge_four hrEven hr4 hrHalf
  · by_cases hr1 : r = 1
    · simpa only [hr1] using hfourUpper
    · have hr3 : 3 ≤ r := by
        rcases hrOdd with ⟨t, ht⟩
        omega
      by_cases hcentral : N = 2 * r + 1
      · by_cases hrEq3 : r = 3
        · have hN7 : N = 7 := by omega
          rw [hN7]
          simpa only [hrEq3] using
            (show pellF 7 4 ≤ pellF 7 3 by norm_num [pellF, pell])
        · have hr5 : 5 ≤ r := by
            rcases hrOdd with ⟨t, ht⟩
            omega
          have hprevEven : Even (r - 1) := by
            rcases hrOdd with ⟨t, ht⟩
            exact ⟨t, by omega⟩
          have hprevBound := pellF_even_ge_four
            (N := N) (k := r - 1) hprevEven (by omega) (by omega)
          have hstep := pellF_even_lt_next
            (N := N) (k := r - 1) hprevEven (by omega)
          have hnext : r - 1 + 1 = r := by omega
          rw [hnext] at hstep
          omega
      · have hnextEven : Even (r + 1) := hrOdd.add_one
        have hnextHalf : 2 * (r + 1) < N := by
          rcases hNOdd with ⟨s, hs⟩
          omega
        have hnextBound := pellF_even_ge_four
          (N := N) (k := r + 1) hnextEven (by omega) hnextHalf
        have hstep := pellF_odd_gt_next
          (N := N) (k := r) hrOdd (by omega)
        omega

end LatticePathOrdersKernel
