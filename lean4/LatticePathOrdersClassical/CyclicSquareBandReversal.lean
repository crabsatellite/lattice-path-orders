import LatticePathOrdersClassical.CyclicSquareBand

/-!
# Reversal isomorphisms of cyclic square bands
-/

namespace LatticePathOrdersClassical

def reverseSteps {n : Nat} (steps : ZMod n → Direction) :
    ZMod n → Direction :=
  fun i => steps (-i - 1)

@[simp] theorem reverseSteps_reverseSteps {n : Nat}
    (steps : ZMod n → Direction) :
    reverseSteps (reverseSteps steps) = steps := by
  funext i
  simp [reverseSteps]

def reverseTile {n : Nat} : BandTile n → BandTile n
  | .midpoint i => .midpoint (-i - 1)
  | .vertex i => .vertex (-i - 2)

def predecessorTile {n : Nat} : BandTile n → BandTile n
  | .midpoint i => .vertex (i - 1)
  | .vertex i => .midpoint i

@[simp] theorem reverseTile_reverseTile {n : Nat} (tile : BandTile n) :
    reverseTile (reverseTile tile) = tile := by
  cases tile <;> simp [reverseTile] <;> ring

@[simp] theorem successor_predecessorTile {n : Nat} (tile : BandTile n) :
    (predecessorTile tile).successor = tile := by
  cases tile <;> simp [predecessorTile, BandTile.successor]

theorem reverseTile_successor {n : Nat} (tile : BandTile n) :
    reverseTile tile.successor = predecessorTile (reverseTile tile) := by
  cases tile <;> simp [reverseTile, predecessorTile, BandTile.successor] <;> ring

theorem reverseTile_successor_successor {n : Nat} (tile : BandTile n) :
    (reverseTile tile.successor).successor = reverseTile tile := by
  rw [reverseTile_successor, successor_predecessorTile]

theorem reverseSteps_outgoing {n : Nat} (steps : ZMod n → Direction)
    (tile : BandTile n) :
    outgoingDirection (reverseSteps steps) (reverseTile tile.successor) =
      outgoingDirection steps tile := by
  cases tile <;> simp [reverseSteps, reverseTile, BandTile.successor,
    outgoingDirection] <;> ring

def oppositeCorner (corner : CornerIndex) : CornerIndex :=
  ⟨(corner.val + 2) % 4, Nat.mod_lt _ (by decide)⟩

@[simp] theorem oppositeCorner_oppositeCorner (corner : CornerIndex) :
    oppositeCorner (oppositeCorner corner) = corner := by
  fin_cases corner <;> rfl

theorem oppositeCorner_successor (corner : CornerIndex) :
    oppositeCorner (cornerSuccessor corner) =
      cornerSuccessor (oppositeCorner corner) := by
  fin_cases corner <;> rfl

theorem opposite_outgoingCorner (direction : Direction) (endpoint : Bool) :
    oppositeCorner (outgoingCorner direction endpoint) =
      incomingCorner direction (!endpoint) := by
  cases direction <;> cases endpoint <;> rfl

theorem opposite_incomingCorner (direction : Direction) (endpoint : Bool) :
    oppositeCorner (incomingCorner direction endpoint) =
      outgoingCorner direction (!endpoint) := by
  cases direction <;> cases endpoint <;> rfl

def reverseRawCorner {n : Nat} : RawBandCorner n → RawBandCorner n
  | ⟨tile, corner⟩ => ⟨reverseTile tile, oppositeCorner corner⟩

@[simp] theorem reverseRawCorner_reverseRawCorner {n : Nat}
    (corner : RawBandCorner n) :
    reverseRawCorner (reverseRawCorner corner) = corner := by
  cases corner
  simp [reverseRawCorner]

theorem reverseRawCorner_glue {n : Nat} (steps : ZMod n → Direction)
    {left right : RawBandCorner n} (h : GlueRel steps left right) :
    GlueRel (reverseSteps steps)
      (reverseRawCorner left) (reverseRawCorner right) := by
  rcases h with ⟨tile, endpoint, h | h⟩
  · rcases h with ⟨rfl, rfl⟩
    refine ⟨reverseTile tile.successor, !endpoint, Or.inr ⟨?_, ?_⟩⟩
    · simp [reverseRawCorner, reverseSteps_outgoing,
        opposite_incomingCorner]
    · simp [reverseRawCorner, reverseSteps_outgoing,
        reverseTile_successor_successor, opposite_outgoingCorner]
  · rcases h with ⟨rfl, rfl⟩
    refine ⟨reverseTile tile.successor, !endpoint, Or.inl ⟨?_, ?_⟩⟩
    · simp [reverseRawCorner, reverseSteps_outgoing,
        opposite_incomingCorner]
    · simp [reverseRawCorner, reverseSteps_outgoing,
        reverseTile_successor_successor, opposite_outgoingCorner]

theorem reverseRawCorner_eqv {n : Nat} (steps : ZMod n → Direction)
    {left right : RawBandCorner n}
    (h : Relation.EqvGen (GlueRel steps) left right) :
    Relation.EqvGen (GlueRel (reverseSteps steps))
      (reverseRawCorner left) (reverseRawCorner right) := by
  induction h with
  | rel a b h => exact Relation.EqvGen.rel _ _ (reverseRawCorner_glue steps h)
  | refl => exact Relation.EqvGen.refl _
  | symm _ _ _ ih => exact Relation.EqvGen.symm _ _ ih
  | trans _ _ _ _ _ ih₁ ih₂ => exact Relation.EqvGen.trans _ _ _ ih₁ ih₂

def reverseVertexEquiv {n : Nat} (steps : ZMod n → Direction) :
    BandVertex steps ≃ BandVertex (reverseSteps steps) where
  toFun := Quotient.map reverseRawCorner (by
    intro a b h
    change Relation.EqvGen (GlueRel steps) a b at h
    change Relation.EqvGen (GlueRel (reverseSteps steps))
      (reverseRawCorner a) (reverseRawCorner b)
    exact reverseRawCorner_eqv steps h)
  invFun := Quotient.map reverseRawCorner (by
    intro a b h
    change Relation.EqvGen (GlueRel (reverseSteps steps)) a b at h
    change Relation.EqvGen (GlueRel steps)
      (reverseRawCorner a) (reverseRawCorner b)
    simpa only [reverseSteps_reverseSteps] using
      reverseRawCorner_eqv (reverseSteps steps) h)
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

theorem reverseVertexEquiv_cornerClass {n : Nat}
    (steps : ZMod n → Direction) (tile : BandTile n)
    (corner : CornerIndex) :
    reverseVertexEquiv steps (cornerClass tile corner) =
      cornerClass (steps := reverseSteps steps) (reverseTile tile)
        (oppositeCorner corner) := rfl

theorem reverseVertexEquiv_symm_cornerClass {n : Nat}
    (steps : ZMod n → Direction) (tile : BandTile n)
    (corner : CornerIndex) :
    (reverseVertexEquiv steps).symm
        (cornerClass (steps := reverseSteps steps) tile corner) =
      cornerClass (reverseTile tile) (oppositeCorner corner) := rfl

theorem reverseVertexEquiv_map_adj {n : Nat}
    (steps : ZMod n → Direction) {u v : BandVertex steps}
    (h : BandAdj steps u v) :
    BandAdj (reverseSteps steps)
      (reverseVertexEquiv steps u) (reverseVertexEquiv steps v) := by
  rcases h with ⟨tile, corner, h | h⟩
  · rcases h with ⟨rfl, rfl⟩
    refine ⟨reverseTile tile, oppositeCorner corner, Or.inl ⟨rfl, ?_⟩⟩
    rw [reverseVertexEquiv_cornerClass, oppositeCorner_successor]
  · rcases h with ⟨rfl, rfl⟩
    refine ⟨reverseTile tile, oppositeCorner corner, Or.inr ⟨rfl, ?_⟩⟩
    rw [reverseVertexEquiv_cornerClass, oppositeCorner_successor]

theorem reverseVertexEquiv_symm_map_adj {n : Nat}
    (steps : ZMod n → Direction)
    {u v : BandVertex (reverseSteps steps)}
    (h : BandAdj (reverseSteps steps) u v) :
    BandAdj steps ((reverseVertexEquiv steps).symm u)
      ((reverseVertexEquiv steps).symm v) := by
  rcases h with ⟨tile, corner, h | h⟩
  · rcases h with ⟨rfl, rfl⟩
    refine ⟨reverseTile tile, oppositeCorner corner, Or.inl ⟨rfl, ?_⟩⟩
    rw [reverseVertexEquiv_symm_cornerClass, oppositeCorner_successor]
  · rcases h with ⟨rfl, rfl⟩
    refine ⟨reverseTile tile, oppositeCorner corner, Or.inr ⟨rfl, ?_⟩⟩
    rw [reverseVertexEquiv_symm_cornerClass, oppositeCorner_successor]

def reverseBandGraphIso {n : Nat} (steps : ZMod n → Direction) :
    BandGraphIso steps (reverseSteps steps) where
  vertexEquiv := reverseVertexEquiv steps
  map_adj_iff u v := by
    constructor
    · exact reverseVertexEquiv_map_adj steps
    · intro h
      have mapped := reverseVertexEquiv_symm_map_adj steps h
      simpa using mapped

end LatticePathOrdersClassical
