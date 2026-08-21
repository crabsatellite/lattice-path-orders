import LatticePathOrdersKernel.NormalFourCycleLift

namespace LatticePathOrdersKernel

open LatticePathOrdersClassical

theorem zmod_sub_one_ne_self
    {n : Nat} [Fact (1 < n)] (i : ZMod n) : i - 1 ≠ i := by
  intro h
  have hone : (1 : ZMod n) = 0 := by
    calc
      1 = i - (i - 1) := by ring
      _ = 0 := by rw [h]; ring
  exact one_ne_zero hone

theorem normalTileCorner_injective
    {n : Nat} [Fact (1 < n)] (steps : ZMod n → Direction)
    (tile : BandTile n) : Function.Injective (normalTileCorner steps tile) := by
  intro left right h
  cases tile with
  | vertex i => exact congrArg Prod.snd h
  | midpoint i =>
      have hprev := zmod_sub_one_ne_self i
      cases hdir : steps i <;> fin_cases left <;> fin_cases right <;>
        simp [normalTileCorner, normalizedBandPair, rawBandCornerPair,
          normalizeRawBandCorner, hdir, hprev, hprev.symm] at h ⊢

theorem normalTileCorner_mem
    {n : Nat} (steps : ZMod n → Direction) (tile : BandTile n)
    (corner : CornerIndex) :
    normalTileCorner steps tile corner ∈ normalTileVertexSet steps tile := by
  exact Finset.mem_image.mpr ⟨corner, Finset.mem_univ _, rfl⟩

theorem normalTile_simple_four_cycle
    {n : Nat} [Fact (1 < n)] (steps : ZMod n → Direction)
    (tile : BandTile n) :
    NormalSimpleFourCycle steps
      (normalTileCorner steps tile cornerZero)
      (normalTileCorner steps tile cornerOne)
      (normalTileCorner steps tile cornerTwo)
      (normalTileCorner steps tile cornerThree) := by
  have hinjective := normalTileCorner_injective steps tile
  have hne {left right : CornerIndex} (h : left ≠ right) :
      normalTileCorner steps tile left ≠ normalTileCorner steps tile right :=
    fun heq => h (hinjective heq)
  refine ⟨hne (by decide), hne (by decide), hne (by decide),
    hne (by decide), hne (by decide), hne (by decide), ?_, ?_, ?_, ?_⟩
  · exact (normalBandAdj_iff_tile_side steps _ _).mpr
      ⟨tile, cornerZero, Or.inl ⟨rfl, rfl⟩⟩
  · exact (normalBandAdj_iff_tile_side steps _ _).mpr
      ⟨tile, cornerOne, Or.inl ⟨rfl, rfl⟩⟩
  · exact (normalBandAdj_iff_tile_side steps _ _).mpr
      ⟨tile, cornerTwo, Or.inl ⟨rfl, rfl⟩⟩
  · exact (normalBandAdj_iff_tile_side steps _ _).mpr
      ⟨tile, cornerThree, Or.inl ⟨rfl, by rfl⟩⟩

end LatticePathOrdersKernel
