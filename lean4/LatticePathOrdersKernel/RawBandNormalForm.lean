import LatticePathOrdersKernel.InitialLevelsTheorem

/-! # Normal representatives for cyclic-band quotient vertices

Every raw corner of a midpoint tile is glued to a unique corner of a
path-vertex tile.  The midpoint tile has opposite incoming and outgoing
shared edges, so these four assignments exhaust its corners.  Consequently
every quotient vertex has one unique representative on a path-vertex tile.
-/

namespace LatticePathOrdersKernel

open LatticePathOrdersClassical

attribute [simp] cornerZero cornerOne cornerTwo cornerThree
  outgoingCorner incomingCorner

def normalizeRawBandCorner {n : Nat} (steps : ZMod n → Direction) :
    RawBandCorner n → RawBandCorner n
  | ⟨BandTile.vertex i, corner⟩ => ⟨BandTile.vertex i, corner⟩
  | ⟨BandTile.midpoint i, corner⟩ =>
      match steps i with
      | .right =>
          if corner = cornerZero then
            ⟨BandTile.vertex (i - 1), cornerOne⟩
          else if corner = cornerOne then
            ⟨BandTile.vertex i, cornerZero⟩
          else if corner = cornerTwo then
            ⟨BandTile.vertex i, cornerThree⟩
          else
            ⟨BandTile.vertex (i - 1), cornerTwo⟩
      | .up =>
          if corner = cornerZero then
            ⟨BandTile.vertex (i - 1), cornerThree⟩
          else if corner = cornerOne then
            ⟨BandTile.vertex (i - 1), cornerTwo⟩
          else if corner = cornerTwo then
            ⟨BandTile.vertex i, cornerOne⟩
          else
            ⟨BandTile.vertex i, cornerZero⟩

@[simp] theorem normalizeRawBandCorner_vertex
    {n : Nat} (steps : ZMod n → Direction) (i : ZMod n)
    (corner : CornerIndex) :
    normalizeRawBandCorner steps ⟨BandTile.vertex i, corner⟩ =
      ⟨BandTile.vertex i, corner⟩ := rfl

theorem zmod_sub_one_add_one {n : Nat} (i : ZMod n) : i - 1 + 1 = i := by
  ring

/-- Each raw corner is either already its normal vertex-tile representative,
or is joined to that representative by one published glue relation. -/
theorem raw_eq_or_glue_normalize
    {n : Nat} (steps : ZMod n → Direction) (raw : RawBandCorner n) :
    raw = normalizeRawBandCorner steps raw ∨
      GlueRel steps raw (normalizeRawBandCorner steps raw) := by
  rcases raw with ⟨tile, corner⟩
  cases tile with
  | vertex i => exact Or.inl rfl
  | midpoint i =>
      right
      cases hdir : steps i with
      | right =>
          fin_cases corner
          · refine ⟨BandTile.vertex (i - 1), false, Or.inr ⟨?_, ?_⟩⟩
            · simp [normalizeRawBandCorner, outgoingDirection, hdir,
                zmod_sub_one_add_one]
            · simp [normalizeRawBandCorner, BandTile.successor,
                outgoingDirection, hdir, zmod_sub_one_add_one]
          · refine ⟨BandTile.midpoint i, false, Or.inl ⟨?_, ?_⟩⟩ <;>
              simp [normalizeRawBandCorner, BandTile.successor,
                outgoingDirection, hdir]
          · refine ⟨BandTile.midpoint i, true, Or.inl ⟨?_, ?_⟩⟩ <;>
              simp [normalizeRawBandCorner, BandTile.successor,
                outgoingDirection, hdir]
          · refine ⟨BandTile.vertex (i - 1), true, Or.inr ⟨?_, ?_⟩⟩
            · simp [normalizeRawBandCorner, outgoingDirection, hdir,
                zmod_sub_one_add_one]
            · simp [normalizeRawBandCorner, BandTile.successor,
                outgoingDirection, hdir, zmod_sub_one_add_one]
      | up =>
          fin_cases corner
          · refine ⟨BandTile.vertex (i - 1), true, Or.inr ⟨?_, ?_⟩⟩
            · simp [normalizeRawBandCorner, outgoingDirection, hdir,
                zmod_sub_one_add_one]
            · simp [normalizeRawBandCorner, BandTile.successor,
                outgoingDirection, hdir, zmod_sub_one_add_one]
          · refine ⟨BandTile.vertex (i - 1), false, Or.inr ⟨?_, ?_⟩⟩
            · simp [normalizeRawBandCorner, outgoingDirection, hdir,
                zmod_sub_one_add_one]
            · simp [normalizeRawBandCorner, BandTile.successor,
                outgoingDirection, hdir, zmod_sub_one_add_one]
          · refine ⟨BandTile.midpoint i, false, Or.inl ⟨?_, ?_⟩⟩ <;>
              simp [normalizeRawBandCorner, BandTile.successor,
                outgoingDirection, hdir]
          · refine ⟨BandTile.midpoint i, true, Or.inl ⟨?_, ?_⟩⟩ <;>
              simp [normalizeRawBandCorner, BandTile.successor,
                outgoingDirection, hdir]

/-- The two endpoints in the oriented presentation of one glued side have
the same normal representative. -/
theorem normalizeRawBandCorner_orientedGlue
    {n : Nat} (steps : ZMod n → Direction)
    (tile : BandTile n) (endpoint : Bool) :
    normalizeRawBandCorner steps
        ⟨tile, outgoingCorner (outgoingDirection steps tile) endpoint⟩ =
      normalizeRawBandCorner steps
        ⟨tile.successor,
          incomingCorner (outgoingDirection steps tile) endpoint⟩ := by
  cases tile with
  | midpoint i =>
      cases hdir : steps i <;> cases endpoint <;>
        simp [normalizeRawBandCorner, BandTile.successor,
          outgoingDirection, hdir]
  | vertex i =>
      have hidx : i + 1 - 1 = i := by ring
      cases hdir : steps (i + 1) <;> cases endpoint <;>
        simp [normalizeRawBandCorner, BandTile.successor,
          outgoingDirection, hdir, hidx]

/-- A generating glue pair has the same normal representative. -/
theorem normalizeRawBandCorner_glueRel
    {n : Nat} (steps : ZMod n → Direction)
    {left right : RawBandCorner n} (h : GlueRel steps left right) :
    normalizeRawBandCorner steps left = normalizeRawBandCorner steps right := by
  rcases h with ⟨tile, endpoint, h | h⟩
  · rcases h with ⟨rfl, rfl⟩
    exact normalizeRawBandCorner_orientedGlue steps tile endpoint
  · rcases h with ⟨rfl, rfl⟩
    exact (normalizeRawBandCorner_orientedGlue steps tile endpoint).symm

theorem normalizeRawBandCorner_eqvGen
    {n : Nat} (steps : ZMod n → Direction)
    {left right : RawBandCorner n}
    (h : Relation.EqvGen (GlueRel steps) left right) :
    normalizeRawBandCorner steps left = normalizeRawBandCorner steps right := by
  induction h with
  | rel _ _ h => exact normalizeRawBandCorner_glueRel steps h
  | refl _ => rfl
  | symm _ _ _ ih => exact ih.symm
  | trans _ _ _ _ _ ih₁ ih₂ => exact ih₁.trans ih₂

end LatticePathOrdersKernel
