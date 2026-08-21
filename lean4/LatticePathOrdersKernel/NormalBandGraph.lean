import LatticePathOrdersKernel.BandVertexNormalEquiv

/-! # The exact normal-form adjacency relation -/

namespace LatticePathOrdersKernel

open LatticePathOrdersClassical

def normalTileCorner {n : Nat} (steps : ZMod n → Direction)
    (tile : BandTile n) (corner : CornerIndex) : NormalBandVertex n :=
  normalizedBandPair steps ⟨tile, corner⟩

def NormalBandAdj {n : Nat} (steps : ZMod n → Direction)
    (left right : NormalBandVertex n) : Prop :=
  BandAdj steps ((bandVertexNormalEquiv steps).symm left)
    ((bandVertexNormalEquiv steps).symm right)

theorem normalPairToBandVertex_eq_cornerClass_iff
    {n : Nat} (steps : ZMod n → Direction)
    (pair : NormalBandVertex n) (tile : BandTile n) (corner : CornerIndex) :
    (bandVertexNormalEquiv steps).symm pair = cornerClass tile corner ↔
      pair = normalTileCorner steps tile corner := by
  constructor
  · intro h
    have := congrArg (bandVertexNormalEquiv steps) h
    simpa [normalTileCorner] using this
  · intro h
    apply (bandVertexNormalEquiv steps).injective
    simpa [normalTileCorner] using h

/-- A fully explicit side presentation of the transported quotient graph. -/
theorem normalBandAdj_iff_tile_side
    {n : Nat} (steps : ZMod n → Direction)
    (left right : NormalBandVertex n) :
    NormalBandAdj steps left right ↔
      ∃ tile corner,
        (left = normalTileCorner steps tile corner ∧
          right = normalTileCorner steps tile (cornerSuccessor corner)) ∨
        (right = normalTileCorner steps tile corner ∧
          left = normalTileCorner steps tile (cornerSuccessor corner)) := by
  unfold NormalBandAdj BandAdj
  constructor
  · rintro ⟨tile, corner, h | h⟩
    · exact ⟨tile, corner, Or.inl
        ⟨(normalPairToBandVertex_eq_cornerClass_iff
          steps left tile corner).mp h.1,
         (normalPairToBandVertex_eq_cornerClass_iff
          steps right tile (cornerSuccessor corner)).mp h.2⟩⟩
    · exact ⟨tile, corner, Or.inr
        ⟨(normalPairToBandVertex_eq_cornerClass_iff
          steps right tile corner).mp h.1,
         (normalPairToBandVertex_eq_cornerClass_iff
          steps left tile (cornerSuccessor corner)).mp h.2⟩⟩
  · rintro ⟨tile, corner, h | h⟩
    · exact ⟨tile, corner, Or.inl
        ⟨(normalPairToBandVertex_eq_cornerClass_iff
          steps left tile corner).mpr h.1,
         (normalPairToBandVertex_eq_cornerClass_iff
          steps right tile (cornerSuccessor corner)).mpr h.2⟩⟩
    · exact ⟨tile, corner, Or.inr
        ⟨(normalPairToBandVertex_eq_cornerClass_iff
          steps right tile corner).mpr h.1,
         (normalPairToBandVertex_eq_cornerClass_iff
          steps left tile (cornerSuccessor corner)).mpr h.2⟩⟩

theorem bandAdj_iff_normalBandAdj
    {n : Nat} (steps : ZMod n → Direction)
    (left right : BandVertex steps) :
    BandAdj steps left right ↔
      NormalBandAdj steps (bandVertexNormalEquiv steps left)
        (bandVertexNormalEquiv steps right) := by
  unfold NormalBandAdj
  simp

structure NormalBandGraphIso {n : Nat}
    (left right : ZMod n → Direction) where
  vertexEquiv : NormalBandVertex n ≃ NormalBandVertex n
  map_adj_iff : ∀ u v,
    NormalBandAdj left u v ↔
      NormalBandAdj right (vertexEquiv u) (vertexEquiv v)

def BandGraphIso.toNormal {n : Nat}
    {left right : ZMod n → Direction} (iso : BandGraphIso left right) :
    NormalBandGraphIso left right where
  vertexEquiv := (bandVertexNormalEquiv left).symm.trans
    (iso.vertexEquiv.trans (bandVertexNormalEquiv right))
  map_adj_iff u v := by
    unfold NormalBandAdj
    simpa using iso.map_adj_iff
      ((bandVertexNormalEquiv left).symm u)
      ((bandVertexNormalEquiv left).symm v)

def NormalBandGraphIso.toBand {n : Nat}
    {left right : ZMod n → Direction} (iso : NormalBandGraphIso left right) :
    BandGraphIso left right where
  vertexEquiv := (bandVertexNormalEquiv left).trans
    (iso.vertexEquiv.trans (bandVertexNormalEquiv right).symm)
  map_adj_iff u v := by
    rw [bandAdj_iff_normalBandAdj, bandAdj_iff_normalBandAdj]
    simpa using iso.map_adj_iff
      (bandVertexNormalEquiv left u) (bandVertexNormalEquiv left v)

end LatticePathOrdersKernel
