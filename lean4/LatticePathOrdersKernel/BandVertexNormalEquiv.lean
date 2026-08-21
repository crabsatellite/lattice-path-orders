import LatticePathOrdersKernel.RawBandNormalForm

/-! # The quotient band graph on `ZMod n × Fin 4` -/

namespace LatticePathOrdersKernel

open LatticePathOrdersClassical

abbrev NormalBandVertex (n : Nat) := ZMod n × CornerIndex

def rawBandCornerPair {n : Nat} : RawBandCorner n → NormalBandVertex n
  | ⟨BandTile.midpoint i, corner⟩ => (i, corner)
  | ⟨BandTile.vertex i, corner⟩ => (i, corner)

def normalizedBandPair {n : Nat} (steps : ZMod n → Direction)
    (raw : RawBandCorner n) : NormalBandVertex n :=
  rawBandCornerPair (normalizeRawBandCorner steps raw)

@[simp] theorem normalizedBandPair_vertex
    {n : Nat} (steps : ZMod n → Direction) (i : ZMod n)
    (corner : CornerIndex) :
    normalizedBandPair steps ⟨BandTile.vertex i, corner⟩ = (i, corner) := rfl

theorem normalCorner_from_pair
    {n : Nat} (steps : ZMod n → Direction) (raw : RawBandCorner n) :
    ⟨BandTile.vertex (normalizedBandPair steps raw).1,
      (normalizedBandPair steps raw).2⟩ =
        normalizeRawBandCorner steps raw := by
  rcases raw with ⟨tile, corner⟩
  cases tile with
  | vertex i => rfl
  | midpoint i =>
      cases hdir : steps i <;> fin_cases corner <;>
        simp [normalizedBandPair, rawBandCornerPair,
          normalizeRawBandCorner, hdir]

theorem normalizedBandPair_eqvGen
    {n : Nat} (steps : ZMod n → Direction)
    {left right : RawBandCorner n}
    (h : Relation.EqvGen (GlueRel steps) left right) :
    normalizedBandPair steps left = normalizedBandPair steps right :=
  congrArg rawBandCornerPair (normalizeRawBandCorner_eqvGen steps h)

def bandVertexToNormalPair {n : Nat} (steps : ZMod n → Direction) :
    BandVertex steps → NormalBandVertex n :=
  Quotient.lift (normalizedBandPair steps)
    (fun _ _ h => normalizedBandPair_eqvGen steps h)

def normalPairToBandVertex {n : Nat} {steps : ZMod n → Direction}
    (pair : NormalBandVertex n) : BandVertex steps :=
  cornerClass (BandTile.vertex pair.1) pair.2

theorem normalPairToBandVertex_bandVertexToNormalPair
    {n : Nat} (steps : ZMod n → Direction) (vertex : BandVertex steps) :
    normalPairToBandVertex (steps := steps) (bandVertexToNormalPair steps vertex) =
      vertex := by
  refine Quotient.inductionOn vertex ?_
  intro raw
  change Quotient.mk (bandCornerSetoid steps)
      ⟨BandTile.vertex (normalizedBandPair steps raw).1,
        (normalizedBandPair steps raw).2⟩ =
        Quotient.mk (bandCornerSetoid steps) raw
  rw [normalCorner_from_pair]
  rcases raw_eq_or_glue_normalize steps raw with heq | hglue
  · rw [← heq]
  · exact Quotient.sound
      (Relation.EqvGen.symm _ _ (Relation.EqvGen.rel _ _ hglue))

@[simp] theorem bandVertexToNormalPair_normalPairToBandVertex
    {n : Nat} (steps : ZMod n → Direction) (pair : NormalBandVertex n) :
    bandVertexToNormalPair steps
      (normalPairToBandVertex (steps := steps) pair) = pair := by
  rcases pair with ⟨i, corner⟩
  rfl

def bandVertexNormalEquiv {n : Nat} (steps : ZMod n → Direction) :
    BandVertex steps ≃ NormalBandVertex n where
  toFun := bandVertexToNormalPair steps
  invFun := normalPairToBandVertex
  left_inv := normalPairToBandVertex_bandVertexToNormalPair steps
  right_inv := bandVertexToNormalPair_normalPairToBandVertex steps

@[simp] theorem bandVertexNormalEquiv_cornerClass
    {n : Nat} (steps : ZMod n → Direction)
    (tile : BandTile n) (corner : CornerIndex) :
    bandVertexNormalEquiv steps (cornerClass tile corner) =
      normalizedBandPair steps ⟨tile, corner⟩ := rfl

theorem cornerClass_eq_iff_normalizedBandPair_eq
    {n : Nat} (steps : ZMod n → Direction)
    (left right : RawBandCorner n) :
    cornerClass (steps := steps) left.tile left.corner =
      cornerClass (steps := steps) right.tile right.corner ↔
      normalizedBandPair steps left = normalizedBandPair steps right := by
  constructor
  · exact fun h => congrArg (bandVertexNormalEquiv steps) h
  · intro h
    apply (bandVertexNormalEquiv steps).injective
    exact h

end LatticePathOrdersKernel
