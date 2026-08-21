import LatticePathOrdersKernel.NormalTileSets

namespace LatticePathOrdersKernel

open LatticePathOrdersClassical
set_option maxHeartbeats 1000000
set_option maxRecDepth 4000

theorem midpoint_successor_intersection_subsingleton
    {n : Nat} (hn : 5 ≤ n) (steps : ZMod n → Direction) (i : ZMod n) :
    ∃ anchor : NormalBandVertex n,
      (normalTileVertexSet steps (.midpoint i) ∩
        normalTileVertexSet steps (.midpoint (i + 1))) ⊆ {anchor} := by
  letI : Fact (1 < n) := ⟨by omega⟩
  have hone : (1 : ZMod n) ≠ 0 := one_ne_zero
  have htwo : (2 : ZMod n) ≠ 0 := zmod_two_ne_zero_of_five_le hn
  have hprev : i - 1 ≠ i := zmod_sub_one_ne_self i
  have hnext : i + 1 ≠ i := by
    intro h
    apply hone
    calc 1 = (i + 1) - i := by ring
      _ = 0 := by rw [h]; ring
  have hfar : i - 1 ≠ i + 1 := by
    intro h
    apply htwo
    calc 2 = (i + 1) - (i - 1) := by ring
      _ = 0 := by rw [h]; ring
  cases hi : steps i with
  | right =>
      rw [normalTileVertexSet_midpoint_right steps i hi]
      cases hj : steps (i + 1) with
      | right =>
          rw [normalTileVertexSet_midpoint_right steps (i + 1) hj]
          refine ⟨(i, cornerZero), ?_⟩
          intro vertex hvertex
          simp [hprev, hnext, hfar, hone, htwo] at hvertex
      | up =>
          rw [normalTileVertexSet_midpoint_up steps (i + 1) hj]
          refine ⟨(i, cornerThree), ?_⟩
          intro vertex hvertex
          simp [hprev, hnext, hfar, hone, htwo] at hvertex ⊢
          aesop
  | up =>
      rw [normalTileVertexSet_midpoint_up steps i hi]
      cases hj : steps (i + 1) with
      | right =>
          rw [normalTileVertexSet_midpoint_right steps (i + 1) hj]
          refine ⟨(i, cornerOne), ?_⟩
          intro vertex hvertex
          simp [hprev, hnext, hfar, hone, htwo] at hvertex ⊢
          aesop
      | up =>
          rw [normalTileVertexSet_midpoint_up steps (i + 1) hj]
          refine ⟨(i, cornerZero), ?_⟩
          intro vertex hvertex
          simp [hprev, hnext, hfar, hone, htwo] at hvertex

theorem midpoint_successor_common_unique
    {n : Nat} (hn : 5 ≤ n) (steps : ZMod n → Direction) (i : ZMod n)
    {first second : NormalBandVertex n}
    (hf₀ : first ∈ normalTileVertexSet steps (.midpoint i))
    (hf₁ : first ∈ normalTileVertexSet steps (.midpoint (i + 1)))
    (hs₀ : second ∈ normalTileVertexSet steps (.midpoint i))
    (hs₁ : second ∈ normalTileVertexSet steps (.midpoint (i + 1))) :
    first = second := by
  rcases midpoint_successor_intersection_subsingleton hn steps i with
    ⟨anchor, hsubset⟩
  have hf : first ∈ ({anchor} : Finset (NormalBandVertex n)) :=
    hsubset (Finset.mem_inter.mpr ⟨hf₀, hf₁⟩)
  have hs : second ∈ ({anchor} : Finset (NormalBandVertex n)) :=
    hsubset (Finset.mem_inter.mpr ⟨hs₀, hs₁⟩)
  have hfirst : first = anchor := by simpa using hf
  have hsecond : second = anchor := by simpa using hs
  exact hfirst.trans hsecond.symm

end LatticePathOrdersKernel
