import LatticePathOrdersKernel.OperationalBestFirstDefs
import LatticePathOrdersKernel.Tau

namespace LatticePathOrdersKernel

open LatticePathOrders

theorem pathPrefix_refl (word : Path) : IsPrefix word word :=
  ⟨[], by simp⟩

theorem pathPrefix_trans {first second third : Path}
    (hfirst : IsPrefix first second) (hsecond : IsPrefix second third) :
    IsPrefix first third := by
  rcases hfirst with ⟨middle, rfl⟩
  rcases hsecond with ⟨last, rfl⟩
  exact ⟨middle ++ last, by simp [List.append_assoc]⟩

theorem pathPrefix_of_common_extension
    {left right word : Path} (hleft : IsPrefix left word)
    (hright : IsPrefix right word) (hlen : left.length ≤ right.length) :
    IsPrefix left right := by
  rcases hleft with ⟨leftSuffix, hleftEq⟩
  rcases hright with ⟨rightSuffix, hrightEq⟩
  refine ⟨right.drop left.length, ?_⟩
  have htakeLeft : word.take left.length = left := by
    rw [hleftEq]
    simp
  have htakeRight : word.take left.length = right.take left.length := by
    rw [hrightEq, List.take_append_of_le_length hlen]
  calc
    right = right.take left.length ++ right.drop left.length :=
      (List.take_append_drop left.length right).symm
    _ = left ++ right.drop left.length := by rw [← htakeRight, htakeLeft]

theorem pathPrefix_comparable_of_common_extension
    {left right word : Path} (hleft : IsPrefix left word)
    (hright : IsPrefix right word) :
    IsPrefix left right ∨ IsPrefix right left := by
  rcases le_total left.length right.length with h | h
  · exact Or.inl (pathPrefix_of_common_extension hleft hright h)
  · exact Or.inr (pathPrefix_of_common_extension hright hleft h)

theorem feasibleChildren_mem_iff
    {a b : Nat} {pfx child : Path} :
    child ∈ feasibleChildren a b pfx ↔
      (child = pfx ++ [Step.R] ∨ child = pfx ++ [Step.U]) ∧
        HasCarrierCompletion a b child := by
  simp [feasibleChildren]

theorem feasibleChild_extends
    {a b : Nat} {pfx child : Path}
    (hchild : child ∈ feasibleChildren a b pfx) :
    IsPrefix pfx child := by
  rcases (feasibleChildren_mem_iff.mp hchild).1 with rfl | rfl <;>
    exact ⟨[_], rfl⟩

theorem feasibleChild_length
    {a b : Nat} {pfx child : Path}
    (hchild : child ∈ feasibleChildren a b pfx) :
    child.length = pfx.length + 1 := by
  rcases (feasibleChildren_mem_iff.mp hchild).1 with rfl | rfl <;> simp

theorem feasibleChild_completion
    {a b : Nat} {pfx child : Path}
    (hchild : child ∈ feasibleChildren a b pfx) :
    HasCarrierCompletion a b child :=
  (feasibleChildren_mem_iff.mp hchild).2

theorem carrier_prefix_has_feasible_child
    {a b : Nat} {pfx word : Path}
    (hword : Carrier a b word) (hpref : IsPrefix pfx word)
    (hshort : pfx.length < a + b) :
    ∃ child ∈ feasibleChildren a b pfx, IsPrefix child word := by
  rcases hpref with ⟨suffix, hwordEq⟩
  have hsuffix : suffix ≠ [] := by
    intro hnil
    subst suffix
    simp at hwordEq
    subst word
    rw [carrier_length hword] at hshort
    omega
  rcases suffix with _ | ⟨step, rest⟩
  · exact False.elim (hsuffix rfl)
  · let child := pfx ++ [step]
    have hchildPrefix : IsPrefix child word := by
      refine ⟨rest, ?_⟩
      rw [hwordEq]
      simp [child, List.append_assoc]
    have hcompletion : HasCarrierCompletion a b child :=
      ⟨word, hword, hchildPrefix⟩
    refine ⟨child, ?_, hchildPrefix⟩
    cases step <;> simp [feasibleChildren, child, hcompletion]

theorem feasibleChildren_partition
    {a b : Nat} {pfx word : Path}
    (hword : Carrier a b word) (hshort : pfx.length < a + b) :
    IsPrefix pfx word ↔
      ∃ child ∈ feasibleChildren a b pfx, IsPrefix child word := by
  constructor
  · exact fun hpref => carrier_prefix_has_feasible_child hword hpref hshort
  · rintro ⟨child, hchild, hpref⟩
    exact pathPrefix_trans (feasibleChild_extends hchild) hpref

theorem feasibleChildren_antichain
    {a b : Nat} (pfx : Path) :
    PrefixFinsetAntichain (feasibleChildren a b pfx) := by
  intro left hleft right hright hne
  have hleftLength := feasibleChild_length hleft
  have hrightLength := feasibleChild_length hright
  constructor
  · intro hpref
    exact hne (eq_of_prefix_of_eq_length hpref
      (hleftLength.trans hrightLength.symm))
  · intro hpref
    exact hne.symm (eq_of_prefix_of_eq_length hpref
      (hrightLength.trans hleftLength.symm))

theorem carrier_exists {a b : Nat} (ha : 0 < a) (hb : 0 < b) :
    ∃ word, Carrier a b word := by
  let base : Path := List.replicate a Step.R ++ List.replicate b Step.U
  have hR : Path.countR base = a := by
    simp [base, Path.countR, List.count_replicate, beq_iff_eq]
  have hU : Path.countU base = b := by
    simp [base, Path.countU, List.count_replicate, beq_iff_eq]
  exact ⟨canonicalRotate a b base,
    canonicalRotate_carrier ha hb hR hU⟩

theorem initialBestFirstState_valid
    {a b : Nat} (ha : 0 < a) (hb : 0 < b)
    {alpha : Type*} [LinearOrder alpha] (score : Path → alpha) :
    OperationalBestFirstValid a b score initialBestFirstState := by
  rcases carrier_exists ha hb with ⟨witness, hwitness⟩
  have hwitnessPrefix := carrier_starts_R ha hwitness
  refine {
    frontier_antichain := ?_
    frontier_nonempty := ?_
    frontier_length := ?_
    frontier_completion := ?_
    output_nodup := by simp [initialBestFirstState]
    output_sound := by simp [initialBestFirstState]
    output_length := by simp [initialBestFirstState]
    carrier_partition := ?_
    output_pairwise := by simp [initialBestFirstState]
    output_le_unemitted := by simp [initialBestFirstState] }
  · intro left hleft right hright hne
    simp [initialBestFirstState] at hleft hright
    exact False.elim (hne (hleft.trans hright.symm))
  · intro pfx hpfx
    have hpfxEq : pfx = [Step.R] := by
      simpa [initialBestFirstState] using hpfx
    subst pfx
    decide
  · intro pfx hpfx
    simp [initialBestFirstState] at hpfx
    subst pfx
    simp
    omega
  · intro pfx hpfx
    simp [initialBestFirstState] at hpfx
    subst pfx
    exact ⟨witness, hwitness, hwitnessPrefix⟩
  · intro word hword
    have hpref := carrier_starts_R ha hword
    simp [initialBestFirstState, PrefixCovered, hpref]

end LatticePathOrdersKernel
