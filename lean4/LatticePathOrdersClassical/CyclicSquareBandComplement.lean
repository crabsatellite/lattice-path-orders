import LatticePathOrdersClassical.CyclicSquareBand

/-!
# Global direction complementation
-/

namespace LatticePathOrdersClassical

def flipDirection : Direction → Direction
  | .right => .up
  | .up => .right

@[simp] theorem flipDirection_flipDirection (direction : Direction) :
    flipDirection (flipDirection direction) = direction := by
  cases direction <;> rfl

def complementSteps {n : Nat} (steps : ZMod n → Direction) :
    ZMod n → Direction :=
  fun i => flipDirection (steps i)

@[simp] theorem complementSteps_complementSteps {n : Nat}
    (steps : ZMod n → Direction) :
    complementSteps (complementSteps steps) = steps := by
  funext i
  simp [complementSteps]

def reflectCorner (corner : CornerIndex) : CornerIndex :=
  ⟨(4 - corner.val) % 4, Nat.mod_lt _ (by decide)⟩

def cornerPredecessor (corner : CornerIndex) : CornerIndex :=
  ⟨(corner.val + 3) % 4, Nat.mod_lt _ (by decide)⟩

@[simp] theorem reflectCorner_reflectCorner (corner : CornerIndex) :
    reflectCorner (reflectCorner corner) = corner := by
  fin_cases corner <;> rfl

theorem reflectCorner_successor (corner : CornerIndex) :
    reflectCorner (cornerSuccessor corner) =
      cornerPredecessor (reflectCorner corner) := by
  fin_cases corner <;> rfl

@[simp] theorem cornerSuccessor_predecessor (corner : CornerIndex) :
    cornerSuccessor (cornerPredecessor corner) = corner := by
  fin_cases corner <;> rfl

theorem reflect_outgoingCorner (direction : Direction) (endpoint : Bool) :
    reflectCorner (outgoingCorner direction endpoint) =
      outgoingCorner (flipDirection direction) (!endpoint) := by
  cases direction <;> cases endpoint <;> rfl

theorem reflect_incomingCorner (direction : Direction) (endpoint : Bool) :
    reflectCorner (incomingCorner direction endpoint) =
      incomingCorner (flipDirection direction) (!endpoint) := by
  cases direction <;> cases endpoint <;> rfl

def reflectRawCorner {n : Nat} : RawBandCorner n → RawBandCorner n
  | ⟨tile, corner⟩ => ⟨tile, reflectCorner corner⟩

@[simp] theorem reflectRawCorner_reflectRawCorner {n : Nat}
    (corner : RawBandCorner n) :
    reflectRawCorner (reflectRawCorner corner) = corner := by
  cases corner
  simp [reflectRawCorner]

theorem complement_outgoing {n : Nat} (steps : ZMod n → Direction)
    (tile : BandTile n) :
    outgoingDirection (complementSteps steps) tile =
      flipDirection (outgoingDirection steps tile) := by
  cases tile <;> rfl

theorem reflectRawCorner_glue {n : Nat} (steps : ZMod n → Direction)
    {left right : RawBandCorner n} (h : GlueRel steps left right) :
    GlueRel (complementSteps steps)
      (reflectRawCorner left) (reflectRawCorner right) := by
  rcases h with ⟨tile, endpoint, h | h⟩
  · rcases h with ⟨rfl, rfl⟩
    refine ⟨tile, !endpoint, Or.inl ⟨?_, ?_⟩⟩
    · simp [reflectRawCorner, complement_outgoing, reflect_outgoingCorner]
    · simp [reflectRawCorner, complement_outgoing, reflect_incomingCorner]
  · rcases h with ⟨rfl, rfl⟩
    refine ⟨tile, !endpoint, Or.inr ⟨?_, ?_⟩⟩
    · simp [reflectRawCorner, complement_outgoing, reflect_outgoingCorner]
    · simp [reflectRawCorner, complement_outgoing, reflect_incomingCorner]

theorem reflectRawCorner_eqv {n : Nat} (steps : ZMod n → Direction)
    {left right : RawBandCorner n}
    (h : Relation.EqvGen (GlueRel steps) left right) :
    Relation.EqvGen (GlueRel (complementSteps steps))
      (reflectRawCorner left) (reflectRawCorner right) := by
  induction h with
  | rel a b h => exact Relation.EqvGen.rel _ _ (reflectRawCorner_glue steps h)
  | refl => exact Relation.EqvGen.refl _
  | symm _ _ _ ih => exact Relation.EqvGen.symm _ _ ih
  | trans _ _ _ _ _ ih₁ ih₂ => exact Relation.EqvGen.trans _ _ _ ih₁ ih₂

def complementVertexEquiv {n : Nat} (steps : ZMod n → Direction) :
    BandVertex steps ≃ BandVertex (complementSteps steps) where
  toFun := Quotient.map reflectRawCorner (by
    intro a b h
    change Relation.EqvGen (GlueRel steps) a b at h
    change Relation.EqvGen (GlueRel (complementSteps steps))
      (reflectRawCorner a) (reflectRawCorner b)
    exact reflectRawCorner_eqv steps h)
  invFun := Quotient.map reflectRawCorner (by
    intro a b h
    change Relation.EqvGen (GlueRel (complementSteps steps)) a b at h
    change Relation.EqvGen (GlueRel steps)
      (reflectRawCorner a) (reflectRawCorner b)
    simpa only [complementSteps_complementSteps] using
      reflectRawCorner_eqv (complementSteps steps) h)
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

theorem complementVertexEquiv_cornerClass {n : Nat}
    (steps : ZMod n → Direction) (tile : BandTile n)
    (corner : CornerIndex) :
    complementVertexEquiv steps (cornerClass tile corner) =
      cornerClass (steps := complementSteps steps) tile
        (reflectCorner corner) := rfl

theorem complementVertexEquiv_map_adj {n : Nat}
    (steps : ZMod n → Direction) {u v : BandVertex steps}
    (h : BandAdj steps u v) :
    BandAdj (complementSteps steps)
      (complementVertexEquiv steps u) (complementVertexEquiv steps v) := by
  rcases h with ⟨tile, corner, h | h⟩
  · rcases h with ⟨rfl, rfl⟩
    refine ⟨tile, cornerPredecessor (reflectCorner corner), Or.inr ⟨?_, ?_⟩⟩
    · rw [complementVertexEquiv_cornerClass, reflectCorner_successor]
    · rw [complementVertexEquiv_cornerClass, cornerSuccessor_predecessor]
  · rcases h with ⟨rfl, rfl⟩
    refine ⟨tile, cornerPredecessor (reflectCorner corner), Or.inl ⟨?_, ?_⟩⟩
    · rw [complementVertexEquiv_cornerClass, reflectCorner_successor]
    · rw [complementVertexEquiv_cornerClass, cornerSuccessor_predecessor]

theorem complementVertexEquiv_symm_cornerClass {n : Nat}
    (steps : ZMod n → Direction) (tile : BandTile n)
    (corner : CornerIndex) :
    (complementVertexEquiv steps).symm
        (cornerClass (steps := complementSteps steps) tile corner) =
      cornerClass tile (reflectCorner corner) := rfl

theorem complementVertexEquiv_symm_map_adj {n : Nat}
    (steps : ZMod n → Direction)
    {u v : BandVertex (complementSteps steps)}
    (h : BandAdj (complementSteps steps) u v) :
    BandAdj steps ((complementVertexEquiv steps).symm u)
      ((complementVertexEquiv steps).symm v) := by
  rcases h with ⟨tile, corner, h | h⟩
  · rcases h with ⟨rfl, rfl⟩
    refine ⟨tile, cornerPredecessor (reflectCorner corner), Or.inr ⟨?_, ?_⟩⟩
    · rw [complementVertexEquiv_symm_cornerClass, reflectCorner_successor]
    · rw [complementVertexEquiv_symm_cornerClass, cornerSuccessor_predecessor]
  · rcases h with ⟨rfl, rfl⟩
    refine ⟨tile, cornerPredecessor (reflectCorner corner), Or.inl ⟨?_, ?_⟩⟩
    · rw [complementVertexEquiv_symm_cornerClass, reflectCorner_successor]
    · rw [complementVertexEquiv_symm_cornerClass, cornerSuccessor_predecessor]

def complementBandGraphIso {n : Nat} (steps : ZMod n → Direction) :
    BandGraphIso steps (complementSteps steps) where
  vertexEquiv := complementVertexEquiv steps
  map_adj_iff u v := by
    constructor
    · exact complementVertexEquiv_map_adj steps
    · intro h
      have mapped := complementVertexEquiv_symm_map_adj steps h
      simpa using mapped

end LatticePathOrdersClassical
