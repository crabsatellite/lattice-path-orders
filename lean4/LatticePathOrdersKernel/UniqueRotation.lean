import LatticePathOrdersKernel.CycleMinimum

/-!
# The coprime cycle lemma

This is manuscript Lemma `lem:unique-rotation` for the literal rational-Dyck
carrier.
-/

namespace LatticePathOrdersKernel

open LatticePathOrders

theorem prefixBalance_rotate
    {a b : Nat} {word : Path} {N k t : Nat}
    (hlen : word.length = N) (hk : k < N) (ht : t ≤ N)
    (htotal : wordBalance a b word = 0) :
    prefixBalance a b (word.rotate k) t =
      if k + t ≤ N then
        prefixBalance a b word (k + t) - prefixBalance a b word k
      else
        prefixBalance a b word (k + t - N) - prefixBalance a b word k := by
  have hrotate : word.rotate k = word.drop k ++ word.take k :=
    List.rotate_eq_drop_append_take (by omega)
  by_cases hnowrap : k + t ≤ N
  · rw [if_pos hnowrap]
    have htDrop : t ≤ (word.drop k).length := by
      simp [List.length_drop, hlen]
      omega
    have htake : (word.rotate k).take t = (word.drop k).take t := by
      rw [hrotate, List.take_append_of_le_length htDrop]
    have hsegment : (word.drop k).take t = (word.take (k + t)).drop k := by
      rw [List.drop_take]
      congr 1
      omega
    unfold prefixBalance
    rw [htake, hsegment]
    have hsub := prefixBalance_subsegment a b word
      (i := k) (j := k + t) (by omega) (by omega)
    unfold prefixBalance at hsub
    linarith
  · rw [if_neg hnowrap]
    let rest := k + t - N
    have hdropLen : (word.drop k).length = N - k := by
      simp [List.length_drop, hlen]
    have hrest : rest ≤ k := by
      dsimp [rest]
      omega
    have htSplit : t = (word.drop k).length + rest := by
      rw [hdropLen]
      dsimp [rest]
      omega
    have htake : (word.rotate k).take t =
        word.drop k ++ (word.take k).take rest := by
      rw [hrotate, htSplit, List.take_length_add_append]
    have htakeRest : (word.take k).take rest = word.take rest := by
      rw [List.take_take, Nat.min_eq_left hrest]
    have htotalSplit : wordBalance a b word =
        wordBalance a b (word.take k) + wordBalance a b (word.drop k) := by
      rw [← wordBalance_append, List.take_append_drop]
    unfold prefixBalance
    rw [htake, htakeRest, wordBalance_append]
    dsimp [rest]
    linarith

theorem rotate_counts
    (word : Path) (k : Nat) :
    Path.countR (word.rotate k) = Path.countR word ∧
      Path.countU (word.rotate k) = Path.countU word := by
  have hp := List.rotate_perm word k
  exact ⟨by simpa [Path.countR] using hp.count Step.R,
    by simpa [Path.countU] using hp.count Step.U⟩

theorem minimum_rotation_carrier
    {a b : Nat} (ha : 0 < a) (hb : 0 < b)
    {word : Path} (hr : Path.countR word = a)
    (hu : Path.countU word = b) :
    let hlength : 0 < word.length := by
      rw [← countR_add_countU word, hr, hu]; omega
    Carrier a b
      (word.rotate (minimumPrefixIndex a b word hlength).val) := by
  let hlength : 0 < word.length := by
    rw [← countR_add_countU word, hr, hu]
    omega
  let minimum := minimumPrefixIndex a b word hlength
  have hlen : word.length = a + b := by
    rw [← countR_add_countU word, hr, hu]
  have htotal := wordBalance_zero_of_counts hr hu
  apply carrier_iff_balance.mpr
  have hcounts := rotate_counts word minimum.val
  refine ⟨hcounts.1.trans hr, hcounts.2.trans hu, ?_⟩
  intro t ht
  have hminimumLt : minimum.val < a + b := by
    rw [← hlen]
    exact minimum.isLt
  have htTotal : t ≤ a + b := by
    simpa [List.length_rotate, hlen] using ht
  rw [prefixBalance_rotate hlen hminimumLt htTotal htotal]
  split
  · rename_i hnowrap
    by_cases hproper : minimum.val + t < word.length
    · let j : Fin word.length := ⟨minimum.val + t, hproper⟩
      exact sub_nonneg.mpr (minimumPrefixIndex_spec a b word hlength j)
    · have htotalIndex : minimum.val + t = word.length := by
        omega
      rw [htotalIndex]
      have htotal := wordBalance_zero_of_counts hr hu
      have hfull : prefixBalance a b word word.length = 0 := by
        unfold prefixBalance
        rw [List.take_length]
        exact htotal
      rw [hfull]
      have hzero := minimumPrefixIndex_spec a b word hlength
        ⟨0, hlength⟩
      simpa [prefixBalance, wordBalance] using hzero
  · rename_i hwrap
    have hproper : minimum.val + t - word.length < word.length := by
      omega
    let j : Fin word.length :=
      ⟨minimum.val + t - word.length, hproper⟩
    apply sub_nonneg.mpr
    have hspec := minimumPrefixIndex_spec a b word hlength j
    have hminimum : minimum.val =
        (minimumPrefixIndex a b word hlength).val := rfl
    have hindex : minimum.val + t - (a + b) = j.val := by
      dsimp [j]
      rw [← hlen]
    rw [hminimum, hindex]
    exact hspec

theorem carrier_rotation_is_prefix_minimum
    {a b : Nat} {word : Path} {k : Nat}
    (hr : Path.countR word = a) (hu : Path.countU word = b)
    (hk : k < word.length) (hcarrier : Carrier a b (word.rotate k)) :
    ∀ j, j < word.length →
      prefixBalance a b word k ≤ prefixBalance a b word j := by
  intro j hj
  have hlen : word.length = a + b := by
    rw [← countR_add_countU word, hr, hu]
  have htotal := wordBalance_zero_of_counts hr hu
  have hkTotal : k < a + b := by simpa [← hlen] using hk
  have hfeasible := (carrier_iff_balance.mp hcarrier).2.2
  by_cases hkj : k ≤ j
  · let t := j - k
    have ht : t ≤ word.length := by dsimp [t]; omega
    have hrot := hfeasible t (by simpa [List.length_rotate] using ht)
    have htTotal : t ≤ a + b := by simpa [← hlen] using ht
    rw [prefixBalance_rotate hlen hkTotal htTotal htotal] at hrot
    have hnowrap : k + t ≤ a + b := by dsimp [t]; omega
    rw [if_pos hnowrap] at hrot
    have hindex : k + t = j := by dsimp [t]; omega
    rw [hindex] at hrot
    omega
  · by_cases hjzero : j = 0
    · subst j
      let t := word.length - k
      have hcancel : k + t = word.length := by
        dsimp [t]
        omega
      have ht : t ≤ word.length := by dsimp [t]; omega
      have hrot := hfeasible t (by simpa [List.length_rotate] using ht)
      have htTotal : t ≤ a + b := by simpa [← hlen] using ht
      rw [prefixBalance_rotate hlen hkTotal htTotal htotal] at hrot
      have hnowrap : k + t ≤ a + b := by omega
      rw [if_pos hnowrap, hcancel] at hrot
      have hfull : prefixBalance a b word word.length = 0 := by
        unfold prefixBalance
        rw [List.take_length]
        exact htotal
      have hzero : prefixBalance a b word 0 = 0 := by
        simp [prefixBalance, wordBalance]
      rw [hfull] at hrot
      rw [hzero]
      omega
    · let t := word.length - k + j
      have hcancel : k + (word.length - k) = word.length := by omega
      have ht : t ≤ word.length := by dsimp [t]; omega
      have hrot := hfeasible t (by simpa [List.length_rotate] using ht)
      have htTotal : t ≤ a + b := by simpa [← hlen] using ht
      rw [prefixBalance_rotate hlen hkTotal htTotal htotal] at hrot
      have hwrap : ¬ k + t ≤ a + b := by dsimp [t]; omega
      rw [if_neg hwrap] at hrot
      have hindex : k + t - (a + b) = j := by dsimp [t]; omega
      rw [hindex] at hrot
      omega

/-- Manuscript Lemma `lem:unique-rotation`. -/
theorem unique_admissible_rotation
    {a b : Nat} (ha : 0 < a) (hb : 0 < b)
    (hcoprime : Nat.Coprime a b) {word : Path}
    (hr : Path.countR word = a) (hu : Path.countU word = b) :
    ∃! k : Fin word.length, Carrier a b (word.rotate k.val) := by
  have hlength : 0 < word.length := by
    rw [← countR_add_countU word, hr, hu]
    omega
  let minimum := minimumPrefixIndex a b word hlength
  refine ⟨minimum, minimum_rotation_carrier ha hb hr hu, ?_⟩
  intro other hother
  apply Fin.ext
  have hminimum := carrier_rotation_is_prefix_minimum hr hu other.isLt hother
  have hotherLe : prefixBalance a b word other.val ≤
      prefixBalance a b word minimum.val :=
    hminimum minimum.val minimum.isLt
  have hminimumLe := minimumPrefixIndex_spec a b word hlength other
  have heq := le_antisymm hotherLe hminimumLe
  exact proper_prefixBalance_injective ha hb hcoprime hr hu
    other.isLt minimum.isLt heq

end LatticePathOrdersKernel
