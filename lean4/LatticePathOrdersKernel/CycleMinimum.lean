import LatticePathOrdersKernel.CycleBalance

/-!
# Distinct cyclic prefix sums and the unique minimum
-/

namespace LatticePathOrdersKernel

open LatticePathOrders

theorem proper_segment_balance_ne_zero
    {a b : Nat} (ha : 0 < a) (hb : 0 < b)
    (hcoprime : Nat.Coprime a b) {word : Path}
    (hr : Path.countR word = a) (hu : Path.countU word = b)
    {i j : Nat} (hij : i < j) (hj : j < word.length) :
    prefixBalance a b word i ≠ prefixBalance a b word j := by
  intro heq
  let segment := (word.take j).drop i
  have hsegmentBalance : wordBalance a b segment = 0 := by
    have hsub := prefixBalance_subsegment a b word hij.le hj.le
    dsimp [segment]
    linarith
  have hsegmentSub : List.Sublist segment word := by
    exact (List.drop_sublist i (word.take j)).trans (List.take_sublist j word)
  have hcountsLe := segment_counts_le_total hsegmentSub
  rw [hr, hu] at hcountsLe
  have hnatBalance : b * Path.countR segment = a * Path.countU segment := by
    rw [wordBalance_eq_counts] at hsegmentBalance
    have hcast : (b * Path.countR segment : Int) =
        (a * Path.countU segment : Int) := by omega
    exact_mod_cast hcast
  have hextreme := coprime_balance_segment_extreme ha hb hcoprime
    hcountsLe.1 hcountsLe.2 hnatBalance
  have hlen : segment.length = j - i := by
    dsimp [segment]
    rw [List.length_drop, List.length_take_of_le hj.le]
  rcases hextreme with hzero | hall
  · have hzeroLen : segment.length = 0 := by
      rw [← countR_add_countU segment, hzero.1, hzero.2]
    omega
  · have hallLen : segment.length = word.length := by
      have hwordLen : word.length = a + b := by
        rw [← countR_add_countU word, hr, hu]
      rw [← countR_add_countU segment, hall.1, hall.2, hwordLen]
    omega

theorem proper_prefixBalance_injective
    {a b : Nat} (ha : 0 < a) (hb : 0 < b)
    (hcoprime : Nat.Coprime a b) {word : Path}
    (hr : Path.countR word = a) (hu : Path.countU word = b) :
    Set.InjOn (prefixBalance a b word)
      {k : Nat | k < word.length} := by
  intro i hi j hj heq
  by_cases hij : i = j
  · exact hij
  · rcases lt_or_gt_of_ne hij with hlt | hgt
    · exact False.elim
        (proper_segment_balance_ne_zero ha hb hcoprime hr hu hlt hj heq)
    · exact False.elim
        (proper_segment_balance_ne_zero ha hb hcoprime hr hu hgt hi heq.symm)

theorem exists_unique_minimum_prefix
    {a b : Nat} (ha : 0 < a) (hb : 0 < b)
    (hcoprime : Nat.Coprime a b) {word : Path}
    (hr : Path.countR word = a) (hu : Path.countU word = b) :
    ∃! k : Fin word.length, ∀ j : Fin word.length,
      prefixBalance a b word k.val ≤ prefixBalance a b word j.val := by
  have hlength : 0 < word.length := by
    rw [← countR_add_countU word, hr, hu]
    omega
  letI : Nonempty (Fin word.length) := ⟨⟨0, hlength⟩⟩
  rcases Finset.exists_min_image Finset.univ
      (fun k : Fin word.length => prefixBalance a b word k.val)
      Finset.univ_nonempty with ⟨k, _, hk⟩
  refine ⟨k, fun j => hk j (by simp), ?_⟩
  intro other hother
  apply Fin.ext
  have hle := hk other (by simp)
  have hle' := hother k
  have heq := le_antisymm hle hle'
  exact proper_prefixBalance_injective ha hb hcoprime hr hu
    other.isLt k.isLt heq.symm

noncomputable def minimumPrefixIndex
    (a b : Nat) (word : Path) (hword : 0 < word.length) : Fin word.length := by
  letI : Nonempty (Fin word.length) := ⟨⟨0, hword⟩⟩
  exact Classical.choose (Finset.exists_min_image Finset.univ
    (fun k : Fin word.length => prefixBalance a b word k.val)
    Finset.univ_nonempty)

theorem minimumPrefixIndex_spec
    (a b : Nat) (word : Path) (hword : 0 < word.length)
    (j : Fin word.length) :
    prefixBalance a b word (minimumPrefixIndex a b word hword).val ≤
      prefixBalance a b word j.val := by
  letI : Nonempty (Fin word.length) := ⟨⟨0, hword⟩⟩
  unfold minimumPrefixIndex
  exact (Classical.choose_spec (Finset.exists_min_image Finset.univ
    (fun k : Fin word.length => prefixBalance a b word k.val)
    Finset.univ_nonempty)).2 j (by simp)

end LatticePathOrdersKernel
