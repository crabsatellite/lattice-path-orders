import LatticePathOrdersKernel.NormalTileCycles

namespace LatticePathOrdersKernel

open LatticePathOrdersClassical

def normalTileIndexSet {n : Nat} (steps : ZMod n → Direction)
    (tile : BandTile n) : Finset (ZMod n) :=
  (normalTileVertexSet steps tile).image Prod.fst

theorem normalTileIndexSet_vertex
    {n : Nat} (steps : ZMod n → Direction) (i : ZMod n) :
    normalTileIndexSet steps (.vertex i) = {i} := by
  ext value
  simp [normalTileIndexSet, normalTileVertexSet, normalTileCorner,
    normalizedBandPair, rawBandCornerPair, normalizeRawBandCorner, eq_comm]

theorem normalTileIndexSet_midpoint
    {n : Nat} (steps : ZMod n → Direction) (i : ZMod n) :
    normalTileIndexSet steps (.midpoint i) = {i - 1, i} := by
  ext value
  constructor
  · intro hvalue
    rcases Finset.mem_image.mp hvalue with ⟨vertex, hvertex, rfl⟩
    rcases Finset.mem_image.mp hvertex with ⟨corner, _, rfl⟩
    cases hdir : steps i <;> fin_cases corner <;>
      simp [normalTileCorner, normalizedBandPair, rawBandCornerPair,
        normalizeRawBandCorner, hdir]
  · intro hvalue
    simp only [Finset.mem_insert, Finset.mem_singleton] at hvalue
    rcases hvalue with hvalue | hvalue
    · subst value
      apply Finset.mem_image.mpr
      refine ⟨normalTileCorner steps (.midpoint i) cornerZero,
        normalTileCorner_mem steps (.midpoint i) cornerZero, ?_⟩
      cases hdir : steps i <;>
        simp [normalTileCorner, normalizedBandPair, rawBandCornerPair,
          normalizeRawBandCorner, hdir]
    · subst value
      apply Finset.mem_image.mpr
      refine ⟨normalTileCorner steps (.midpoint i) cornerTwo,
        normalTileCorner_mem steps (.midpoint i) cornerTwo, ?_⟩
      cases hdir : steps i <;>
        simp [normalTileCorner, normalizedBandPair, rawBandCornerPair,
          normalizeRawBandCorner, hdir]

theorem zmod_two_ne_zero_of_five_le
    {n : Nat} (hn : 5 ≤ n) : (2 : ZMod n) ≠ 0 := by
  intro h
  have hval := congrArg ZMod.val h
  rw [ZMod.val_two_eq_two_mod, Nat.mod_eq_of_lt (by omega)] at hval
  simp at hval

theorem normalTileVertexSet_injective
    {n : Nat} (hn : 5 ≤ n) (steps : ZMod n → Direction) :
    Function.Injective (normalTileVertexSet steps) := by
  letI : Fact (1 < n) := ⟨by omega⟩
  intro left right hsets
  have hindices := congrArg (Finset.image Prod.fst) hsets
  change normalTileIndexSet steps left = normalTileIndexSet steps right at hindices
  cases left with
  | vertex i =>
      cases right with
      | vertex j =>
          rw [normalTileIndexSet_vertex, normalTileIndexSet_vertex] at hindices
          have hij : i = j := by simpa using hindices
          subst j
          rfl
      | midpoint j =>
          rw [normalTileIndexSet_vertex, normalTileIndexSet_midpoint] at hindices
          have hcard := congrArg Finset.card hindices
          have hprev := zmod_sub_one_ne_self j
          simp [Finset.card_pair, hprev] at hcard
  | midpoint i =>
      cases right with
      | vertex j =>
          rw [normalTileIndexSet_midpoint, normalTileIndexSet_vertex] at hindices
          have hcard := congrArg Finset.card hindices
          have hprev := zmod_sub_one_ne_self i
          simp [Finset.card_pair, hprev] at hcard
      | midpoint j =>
          rw [normalTileIndexSet_midpoint, normalTileIndexSet_midpoint] at hindices
          have hi : i = j - 1 ∨ i = j := by
            have : i ∈ ({j - 1, j} : Finset (ZMod n)) := by
              rw [← hindices]
              simp
            simpa [or_comm] using this
          rcases hi with hi | hi
          · have hiprev : i - 1 = j - 1 ∨ i - 1 = j := by
              have : i - 1 ∈ ({j - 1, j} : Finset (ZMod n)) := by
                rw [← hindices]
                simp
              simpa [or_comm] using this
            rcases hiprev with hiprev | hiprev
            · have : i = j := by
                calc i = (i - 1) + 1 := by ring
                  _ = (j - 1) + 1 := by rw [hiprev]
                  _ = j := by ring
              exact False.elim (zmod_sub_one_ne_self j (hi.symm.trans this))
            · have htwo : (2 : ZMod n) = 0 := by
                calc
                  2 = (j : ZMod n) - (j - 2) := by ring
                  _ = j - (i - 1) := by rw [hi]; ring
                  _ = 0 := by rw [hiprev]; ring
              exact False.elim (zmod_two_ne_zero_of_five_le hn htwo)
          · subst j
            rfl

end LatticePathOrdersKernel
