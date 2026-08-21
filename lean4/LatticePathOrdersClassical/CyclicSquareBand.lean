import Mathlib.Data.ZMod.Basic
import Mathlib.Logic.Relation
import Mathlib.Tactic

/-!
# Cyclic square bands as quotient graphs

This is the coordinate-free graph in Schiffler's construction.  There are two
tiles per cyclic step: a step-midpoint tile and a path-vertex tile.  Corners of
successive squares are identified along the shared edge, and graph edges are
the images of the four sides of every square.
-/

namespace LatticePathOrdersClassical

inductive Direction where
  | right
  | up
deriving DecidableEq, Repr

inductive BandTile (n : Nat) where
  | midpoint : ZMod n → BandTile n
  | vertex : ZMod n → BandTile n
deriving DecidableEq

namespace BandTile

variable {n : Nat}

def equivSum : BandTile n ≃ (ZMod n ⊕ ZMod n) where
  toFun
    | .midpoint i => Sum.inl i
    | .vertex i => Sum.inr i
  invFun
    | Sum.inl i => .midpoint i
    | Sum.inr i => .vertex i
  left_inv tile := by cases tile <;> rfl
  right_inv value := by cases value <;> rfl

instance [NeZero n] : Fintype (BandTile n) :=
  Fintype.ofEquiv (ZMod n ⊕ ZMod n) equivSum.symm

def successor : BandTile n → BandTile n
  | .midpoint i => .vertex i
  | .vertex i => .midpoint (i + 1)

def index : BandTile n → ZMod n
  | .midpoint i | .vertex i => i

end BandTile

def outgoingDirection {n : Nat} (steps : ZMod n → Direction) :
    BandTile n → Direction
  | .midpoint i => steps i
  | .vertex i => steps (i + 1)

abbrev CornerIndex := Fin 4

def cornerZero : CornerIndex := ⟨0, by decide⟩
def cornerOne : CornerIndex := ⟨1, by decide⟩
def cornerTwo : CornerIndex := ⟨2, by decide⟩
def cornerThree : CornerIndex := ⟨3, by decide⟩

def cornerSuccessor (c : CornerIndex) : CornerIndex :=
  ⟨(c.val + 1) % 4, Nat.mod_lt _ (by decide)⟩

def outgoingCorner : Direction → Bool → CornerIndex
  | .right, false => cornerOne
  | .right, true => cornerTwo
  | .up, false => cornerTwo
  | .up, true => cornerThree

def incomingCorner : Direction → Bool → CornerIndex
  | .right, false => cornerZero
  | .right, true => cornerThree
  | .up, false => cornerOne
  | .up, true => cornerZero

structure RawBandCorner (n : Nat) where
  tile : BandTile n
  corner : CornerIndex
deriving DecidableEq

namespace RawBandCorner

variable {n : Nat}

def equivProd : RawBandCorner n ≃ BandTile n × CornerIndex where
  toFun corner := (corner.tile, corner.corner)
  invFun value := ⟨value.1, value.2⟩
  left_inv corner := by cases corner; rfl
  right_inv value := by cases value; rfl

instance [NeZero n] : Fintype (RawBandCorner n) :=
  Fintype.ofEquiv (BandTile n × CornerIndex) equivProd.symm

end RawBandCorner

def GlueRel {n : Nat} (steps : ZMod n → Direction) :
    RawBandCorner n → RawBandCorner n → Prop :=
  fun left right =>
    ∃ tile endpoint,
      (left = ⟨tile, outgoingCorner (outgoingDirection steps tile) endpoint⟩ ∧
        right = ⟨tile.successor,
          incomingCorner (outgoingDirection steps tile) endpoint⟩) ∨
      (right = ⟨tile, outgoingCorner (outgoingDirection steps tile) endpoint⟩ ∧
        left = ⟨tile.successor,
          incomingCorner (outgoingDirection steps tile) endpoint⟩)

instance glueRelDecidable {n : Nat} [NeZero n] (steps : ZMod n → Direction)
    (left right : RawBandCorner n) : Decidable (GlueRel steps left right) := by
  unfold GlueRel
  infer_instance

def bandCornerSetoid {n : Nat} (steps : ZMod n → Direction) :
    Setoid (RawBandCorner n) :=
  Relation.EqvGen.setoid (GlueRel steps)

abbrev BandVertex {n : Nat} (steps : ZMod n → Direction) :=
  Quotient (bandCornerSetoid steps)

def cornerClass {n : Nat} {steps : ZMod n → Direction}
    (tile : BandTile n) (corner : CornerIndex) : BandVertex steps :=
  Quotient.mk (bandCornerSetoid steps) ⟨tile, corner⟩

def BandAdj {n : Nat} (steps : ZMod n → Direction)
    (u v : BandVertex steps) : Prop :=
  ∃ tile corner,
    (u = cornerClass tile corner ∧
      v = cornerClass tile (cornerSuccessor corner)) ∨
    (v = cornerClass tile corner ∧
      u = cornerClass tile (cornerSuccessor corner))

structure BandGraphIso {n : Nat}
    (left right : ZMod n → Direction) where
  vertexEquiv : BandVertex left ≃ BandVertex right
  map_adj_iff : ∀ u v,
    BandAdj left u v ↔ BandAdj right (vertexEquiv u) (vertexEquiv v)

def BandGraphIso.refl {n : Nat} (steps : ZMod n → Direction) :
    BandGraphIso steps steps where
  vertexEquiv := Equiv.refl _
  map_adj_iff _ _ := Iff.rfl

def BandGraphIso.symm {n : Nat} {left right : ZMod n → Direction}
    (iso : BandGraphIso left right) : BandGraphIso right left where
  vertexEquiv := iso.vertexEquiv.symm
  map_adj_iff u v := by
    simpa using
      (iso.map_adj_iff (iso.vertexEquiv.symm u) (iso.vertexEquiv.symm v)).symm

def BandGraphIso.trans {n : Nat}
    {left middle right : ZMod n → Direction}
    (first : BandGraphIso left middle) (second : BandGraphIso middle right) :
    BandGraphIso left right where
  vertexEquiv := first.vertexEquiv.trans second.vertexEquiv
  map_adj_iff u v :=
    (first.map_adj_iff u v).trans
      (second.map_adj_iff (first.vertexEquiv u) (first.vertexEquiv v))

end LatticePathOrdersClassical
