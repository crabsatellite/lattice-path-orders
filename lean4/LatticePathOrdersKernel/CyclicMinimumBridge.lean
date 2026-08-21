import LatticePathOrdersKernel.MatrixBridge

/-!
# Equality of the two cyclic minimum implementations

The certificate layer stores cyclic products as a list.  The classical layer
indexes them by `Fin`.  We prove that both take the minimum of exactly the same
literal family.
-/

namespace LatticePathOrdersKernel

open LatticePathOrders

theorem mem_lowerLeftValues_iff {digits : List Nat} {q : Nat} :
    q ∈ lowerLeftValues digits ↔
      ∃ k : LatticePathOrdersClassical.CyclicIndex digits,
        q = LatticePathOrdersClassical.cyclicDenominator digits k := by
  constructor
  · intro hq
    rcases List.mem_map.mp hq with ⟨rotated, hrotated, rfl⟩
    rcases List.mem_map.mp hrotated with ⟨k, hk, rfl⟩
    have hklt : k < digits.length := List.mem_range.mp hk
    refine ⟨⟨k, hklt⟩, ?_⟩
    unfold LatticePathOrdersClassical.cyclicDenominator
      LatticePathOrdersClassical.cyclicProduct
    exact lowerLeft_bridge (digits.rotate k)
  · rintro ⟨k, rfl⟩
    apply List.mem_map.mpr
    refine ⟨digits.rotate k.val, ?_, ?_⟩
    · apply List.mem_map.mpr
      exact ⟨k.val, List.mem_range.mpr k.isLt, rfl⟩
    · unfold LatticePathOrdersClassical.cyclicDenominator
        LatticePathOrdersClassical.cyclicProduct
      exact lowerLeft_bridge (digits.rotate k.val)

theorem lowerLeftValues_ne_nil {digits : List Nat} (hne : digits ≠ []) :
    lowerLeftValues digits ≠ [] := by
  have hlen : 0 < digits.length := by
    cases digits with
    | nil => contradiction
    | cons => simp
  rcases mem_lowerLeftValues_iff.mpr
      ⟨(⟨0, hlen⟩ : LatticePathOrdersClassical.CyclicIndex digits), rfl⟩ with hmem
  exact List.ne_nil_of_mem hmem

theorem cyclicDenominatorMin_eq_qMin {digits : List Nat}
    (hne : digits ≠ []) :
    LatticePathOrdersClassical.cyclicDenominatorMin digits hne = qMin digits := by
  apply le_antisymm
  · cases hmin : (lowerLeftValues digits).min? with
    | none =>
        have hnil := List.min?_eq_none_iff.mp hmin
        exact False.elim (lowerLeftValues_ne_nil hne hnil)
    | some minimum =>
        have hminimumMem : minimum ∈ lowerLeftValues digits :=
          List.min?_mem hmin
        rcases mem_lowerLeftValues_iff.mp hminimumMem with ⟨k, hk⟩
        have hle := LatticePathOrdersClassical.cyclicDenominatorMin_le hne k
        rw [← hk] at hle
        simpa [qMin, hmin] using hle
  · rcases LatticePathOrdersClassical.cyclicDenominatorMin_achieved hne with
      ⟨k, hk⟩
    have hmem : LatticePathOrdersClassical.cyclicDenominator digits k ∈
        lowerLeftValues digits :=
      mem_lowerLeftValues_iff.mpr ⟨k, rfl⟩
    have hle := List.min?_getD_le_of_mem (k := 1) hmem
    rw [hk] at hle
    exact hle

end LatticePathOrdersKernel
