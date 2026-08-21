import LatticePathOrdersClassical.CyclicSquareBand

/-!
# Rotation isomorphisms of cyclic square bands
-/

namespace LatticePathOrdersClassical

def rotateSteps {n : Nat} (steps : ZMod n → Direction) (k : ZMod n) :
    ZMod n → Direction :=
  fun i => steps (i + k)

def shiftTile {n : Nat} (k : ZMod n) : BandTile n → BandTile n
  | .midpoint i => .midpoint (i - k)
  | .vertex i => .vertex (i - k)

def unshiftTile {n : Nat} (k : ZMod n) : BandTile n → BandTile n
  | .midpoint i => .midpoint (i + k)
  | .vertex i => .vertex (i + k)

@[simp] theorem unshiftTile_shiftTile {n : Nat} (k : ZMod n)
    (tile : BandTile n) : unshiftTile k (shiftTile k tile) = tile := by
  cases tile <;> simp [shiftTile, unshiftTile]

@[simp] theorem shiftTile_unshiftTile {n : Nat} (k : ZMod n)
    (tile : BandTile n) : shiftTile k (unshiftTile k tile) = tile := by
  cases tile <;> simp [shiftTile, unshiftTile]

theorem shiftTile_successor {n : Nat} (k : ZMod n) (tile : BandTile n) :
    shiftTile k tile.successor = (shiftTile k tile).successor := by
  cases tile <;> simp [shiftTile, BandTile.successor] <;> ring

theorem unshiftTile_successor {n : Nat} (k : ZMod n) (tile : BandTile n) :
    unshiftTile k tile.successor = (unshiftTile k tile).successor := by
  cases tile <;> simp [unshiftTile, BandTile.successor] <;> ring

theorem rotateSteps_outgoing {n : Nat} (steps : ZMod n → Direction)
    (k : ZMod n) (tile : BandTile n) :
    outgoingDirection (rotateSteps steps k) (shiftTile k tile) =
      outgoingDirection steps tile := by
  cases tile <;> simp [outgoingDirection, rotateSteps, shiftTile] <;>
    congr 1 <;> ring

theorem rotateSteps_outgoing_inv {n : Nat} (steps : ZMod n → Direction)
    (k : ZMod n) (tile : BandTile n) :
    outgoingDirection steps (unshiftTile k tile) =
      outgoingDirection (rotateSteps steps k) tile := by
  cases tile <;> simp [outgoingDirection, rotateSteps, unshiftTile] <;>
    congr 1 <;> ring

def shiftRawCorner {n : Nat} (k : ZMod n) :
    RawBandCorner n → RawBandCorner n
  | ⟨tile, corner⟩ => ⟨shiftTile k tile, corner⟩

def unshiftRawCorner {n : Nat} (k : ZMod n) :
    RawBandCorner n → RawBandCorner n
  | ⟨tile, corner⟩ => ⟨unshiftTile k tile, corner⟩

@[simp] theorem unshiftRawCorner_shiftRawCorner {n : Nat} (k : ZMod n)
    (corner : RawBandCorner n) :
    unshiftRawCorner k (shiftRawCorner k corner) = corner := by
  cases corner
  simp [shiftRawCorner, unshiftRawCorner]

@[simp] theorem shiftRawCorner_unshiftRawCorner {n : Nat} (k : ZMod n)
    (corner : RawBandCorner n) :
    shiftRawCorner k (unshiftRawCorner k corner) = corner := by
  cases corner
  simp [shiftRawCorner, unshiftRawCorner]

theorem shiftRawCorner_glue {n : Nat} (steps : ZMod n → Direction)
    (k : ZMod n) {left right : RawBandCorner n}
    (h : GlueRel steps left right) :
    GlueRel (rotateSteps steps k)
      (shiftRawCorner k left) (shiftRawCorner k right) := by
  rcases h with ⟨tile, endpoint, h | h⟩
  · rcases h with ⟨rfl, rfl⟩
    refine ⟨shiftTile k tile, endpoint, Or.inl ⟨?_, ?_⟩⟩
    · simp [shiftRawCorner, rotateSteps_outgoing]
    · simp [shiftRawCorner, shiftTile_successor, rotateSteps_outgoing]
  · rcases h with ⟨rfl, rfl⟩
    refine ⟨shiftTile k tile, endpoint, Or.inr ⟨?_, ?_⟩⟩
    · simp [shiftRawCorner, rotateSteps_outgoing]
    · simp [shiftRawCorner, shiftTile_successor, rotateSteps_outgoing]

theorem unshiftRawCorner_glue {n : Nat} (steps : ZMod n → Direction)
    (k : ZMod n) {left right : RawBandCorner n}
    (h : GlueRel (rotateSteps steps k) left right) :
    GlueRel steps (unshiftRawCorner k left) (unshiftRawCorner k right) := by
  rcases h with ⟨tile, endpoint, h | h⟩
  · rcases h with ⟨rfl, rfl⟩
    refine ⟨unshiftTile k tile, endpoint, Or.inl ⟨?_, ?_⟩⟩
    · simp [unshiftRawCorner, rotateSteps_outgoing_inv]
    · simp [unshiftRawCorner, unshiftTile_successor,
        rotateSteps_outgoing_inv]
  · rcases h with ⟨rfl, rfl⟩
    refine ⟨unshiftTile k tile, endpoint, Or.inr ⟨?_, ?_⟩⟩
    · simp [unshiftRawCorner, rotateSteps_outgoing_inv]
    · simp [unshiftRawCorner, unshiftTile_successor,
        rotateSteps_outgoing_inv]

theorem shiftRawCorner_eqv {n : Nat} (steps : ZMod n → Direction)
    (k : ZMod n) {left right : RawBandCorner n}
    (h : Relation.EqvGen (GlueRel steps) left right) :
    Relation.EqvGen (GlueRel (rotateSteps steps k))
      (shiftRawCorner k left) (shiftRawCorner k right) := by
  induction h with
  | rel a b h => exact Relation.EqvGen.rel _ _ (shiftRawCorner_glue steps k h)
  | refl => exact Relation.EqvGen.refl _
  | symm _ _ _ ih => exact Relation.EqvGen.symm _ _ ih
  | trans _ _ _ _ _ ih₁ ih₂ => exact Relation.EqvGen.trans _ _ _ ih₁ ih₂

theorem unshiftRawCorner_eqv {n : Nat} (steps : ZMod n → Direction)
    (k : ZMod n) {left right : RawBandCorner n}
    (h : Relation.EqvGen (GlueRel (rotateSteps steps k)) left right) :
    Relation.EqvGen (GlueRel steps)
      (unshiftRawCorner k left) (unshiftRawCorner k right) := by
  induction h with
  | rel a b h => exact Relation.EqvGen.rel _ _ (unshiftRawCorner_glue steps k h)
  | refl => exact Relation.EqvGen.refl _
  | symm _ _ _ ih => exact Relation.EqvGen.symm _ _ ih
  | trans _ _ _ _ _ ih₁ ih₂ => exact Relation.EqvGen.trans _ _ _ ih₁ ih₂

def rotateVertexEquiv {n : Nat} (steps : ZMod n → Direction) (k : ZMod n) :
    BandVertex steps ≃ BandVertex (rotateSteps steps k) where
  toFun := Quotient.map (shiftRawCorner k) (by
    intro a b h
    change Relation.EqvGen (GlueRel steps) a b at h
    change Relation.EqvGen (GlueRel (rotateSteps steps k))
      (shiftRawCorner k a) (shiftRawCorner k b)
    exact shiftRawCorner_eqv steps k h)
  invFun := Quotient.map (unshiftRawCorner k) (by
    intro a b h
    change Relation.EqvGen (GlueRel (rotateSteps steps k)) a b at h
    change Relation.EqvGen (GlueRel steps)
      (unshiftRawCorner k a) (unshiftRawCorner k b)
    exact unshiftRawCorner_eqv steps k h)
  left_inv vertex := by
    refine Quotient.inductionOn vertex ?_
    intro corner
    apply Quotient.sound
    simp
  right_inv vertex := by
    refine Quotient.inductionOn vertex ?_
    intro corner
    apply Quotient.sound
    simp

theorem rotateVertexEquiv_cornerClass {n : Nat}
    (steps : ZMod n → Direction) (k : ZMod n)
    (tile : BandTile n) (corner : CornerIndex) :
    rotateVertexEquiv steps k (cornerClass tile corner) =
      cornerClass (steps := rotateSteps steps k) (shiftTile k tile) corner := rfl

theorem rotateVertexEquiv_symm_cornerClass {n : Nat}
    (steps : ZMod n → Direction) (k : ZMod n)
    (tile : BandTile n) (corner : CornerIndex) :
    (rotateVertexEquiv steps k).symm
        (cornerClass (steps := rotateSteps steps k) tile corner) =
      cornerClass (unshiftTile k tile) corner := rfl

theorem rotateVertexEquiv_map_adj {n : Nat}
    (steps : ZMod n → Direction) (k : ZMod n)
    {u v : BandVertex steps} (h : BandAdj steps u v) :
    BandAdj (rotateSteps steps k)
      (rotateVertexEquiv steps k u) (rotateVertexEquiv steps k v) := by
  rcases h with ⟨tile, corner, h | h⟩
  · rcases h with ⟨rfl, rfl⟩
    exact ⟨shiftTile k tile, corner, Or.inl ⟨rfl, rfl⟩⟩
  · rcases h with ⟨rfl, rfl⟩
    exact ⟨shiftTile k tile, corner, Or.inr ⟨rfl, rfl⟩⟩

theorem rotateVertexEquiv_symm_map_adj {n : Nat}
    (steps : ZMod n → Direction) (k : ZMod n)
    {u v : BandVertex (rotateSteps steps k)}
    (h : BandAdj (rotateSteps steps k) u v) :
    BandAdj steps ((rotateVertexEquiv steps k).symm u)
      ((rotateVertexEquiv steps k).symm v) := by
  rcases h with ⟨tile, corner, h | h⟩
  · rcases h with ⟨rfl, rfl⟩
    exact ⟨unshiftTile k tile, corner, Or.inl ⟨rfl, rfl⟩⟩
  · rcases h with ⟨rfl, rfl⟩
    exact ⟨unshiftTile k tile, corner, Or.inr ⟨rfl, rfl⟩⟩

def rotateBandGraphIso {n : Nat} (steps : ZMod n → Direction) (k : ZMod n) :
    BandGraphIso steps (rotateSteps steps k) where
  vertexEquiv := rotateVertexEquiv steps k
  map_adj_iff u v := by
    constructor
    · exact rotateVertexEquiv_map_adj steps k
    · intro h
      have mapped := rotateVertexEquiv_symm_map_adj steps k h
      simpa using mapped

end LatticePathOrdersClassical
