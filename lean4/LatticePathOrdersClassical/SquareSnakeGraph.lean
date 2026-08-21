import LatticePathOrdersClassical.Continuant
import Mathlib.Algebra.BigOperators.Group.Finset.Basic
import Mathlib.Data.Fintype.Sum
import Mathlib.Data.Fintype.Sets
import Mathlib.Data.Fintype.Pi

/-!
# Literal finite square-snake graphs

A square snake starts with one four-cycle.  Every additional tile is glued to
the distinguished terminal edge, adding two new vertices and three new edges.
The Boolean parameter records whether the next terminal edge is adjacent to
(`true`) or opposite (`false`) the edge just used.  Thus this is the abstract
unlabelled square graph determined by the sign sequence in Canakci--Schiffler,
Definition 3.1, with no matching recurrence built into the definition.
-/

namespace LatticePathOrdersClassical

open scoped BigOperators

def SquareSnakeVertex : List Bool → Type
  | [] => Fin 4
  | _ :: turns => SquareSnakeVertex turns ⊕ Bool

def SquareSnakeEdge : List Bool → Type
  | [] => Fin 4
  | _ :: turns => SquareSnakeEdge turns ⊕ Fin 3

instance squareSnakeVertexDecidableEq (turns : List Bool) :
    DecidableEq (SquareSnakeVertex turns) := by
  induction turns with
  | nil => dsimp [SquareSnakeVertex]; infer_instance
  | cons _ turns ih => dsimp [SquareSnakeVertex]; infer_instance

instance squareSnakeEdgeDecidableEq (turns : List Bool) :
    DecidableEq (SquareSnakeEdge turns) := by
  induction turns with
  | nil => dsimp [SquareSnakeEdge]; infer_instance
  | cons _ turns ih => dsimp [SquareSnakeEdge]; infer_instance

instance squareSnakeVertexFintype (turns : List Bool) :
    Fintype (SquareSnakeVertex turns) := by
  induction turns with
  | nil => dsimp [SquareSnakeVertex]; infer_instance
  | cons _ turns ih => dsimp [SquareSnakeVertex]; infer_instance

instance squareSnakeEdgeFintype (turns : List Bool) :
    Fintype (SquareSnakeEdge turns) := by
  induction turns with
  | nil => dsimp [SquareSnakeEdge]; infer_instance
  | cons _ turns ih => dsimp [SquareSnakeEdge]; infer_instance

@[reducible] def finFourSuccessor (corner : Fin 4) : Fin 4 :=
  ⟨(corner.val + 1) % 4, Nat.mod_lt _ (by decide)⟩

def squareSnakeTerminal :
    (turns : List Bool) →
      SquareSnakeVertex turns × SquareSnakeVertex turns
  | [] => (⟨1, by decide⟩, ⟨2, by decide⟩)
  | turn :: turns =>
      let previous := squareSnakeTerminal turns
      if turn then
        (Sum.inl previous.2, Sum.inr true)
      else
        (Sum.inr false, Sum.inr true)

def newTileEndpoints {turns : List Bool}
    (previous : SquareSnakeVertex turns × SquareSnakeVertex turns) :
    Fin 3 →
      (SquareSnakeVertex turns ⊕ Bool) ×
        (SquareSnakeVertex turns ⊕ Bool)
  | ⟨0, _⟩ => (Sum.inl previous.1, Sum.inr false)
  | ⟨1, _⟩ => (Sum.inr false, Sum.inr true)
  | ⟨2, _⟩ => (Sum.inr true, Sum.inl previous.2)

def squareSnakeEndpoints :
    {turns : List Bool} → SquareSnakeEdge turns →
      SquareSnakeVertex turns × SquareSnakeVertex turns
  | [], edge => (edge, finFourSuccessor edge)
  | _ :: _, Sum.inl edge =>
      let endpoints := squareSnakeEndpoints edge
      (Sum.inl endpoints.1, Sum.inl endpoints.2)
  | _ :: turns, Sum.inr edge =>
      newTileEndpoints (squareSnakeTerminal turns) edge

def SquareSnakeIncident : {turns : List Bool} →
    SquareSnakeEdge turns → SquareSnakeVertex turns → Prop
  | [], edge, vertex => vertex = edge ∨ vertex = finFourSuccessor edge
  | _ :: _, Sum.inl edge, Sum.inl vertex =>
      SquareSnakeIncident edge vertex
  | _ :: _, Sum.inl _, Sum.inr _ => False
  | _ :: turns, Sum.inr ⟨0, _⟩, Sum.inl vertex =>
      vertex = (squareSnakeTerminal turns).1
  | _ :: _, Sum.inr ⟨0, _⟩, Sum.inr vertex => vertex = false
  | _ :: _, Sum.inr ⟨1, _⟩, Sum.inl _ => False
  | _ :: _, Sum.inr ⟨1, _⟩, Sum.inr vertex =>
      vertex = false ∨ vertex = true
  | _ :: turns, Sum.inr ⟨2, _⟩, Sum.inl vertex =>
      vertex = (squareSnakeTerminal turns).2
  | _ :: _, Sum.inr ⟨2, _⟩, Sum.inr vertex => vertex = true

def decideSquareSnakeIncident :
    (turns : List Bool) → (edge : SquareSnakeEdge turns) →
      (vertex : SquareSnakeVertex turns) →
      Decidable (SquareSnakeIncident edge vertex)
  | [], edge, vertex => by
      simp only [SquareSnakeIncident]
      infer_instance
  | _ :: turns, Sum.inl edge, Sum.inl vertex =>
      decideSquareSnakeIncident turns edge vertex
  | _ :: _, Sum.inl _, Sum.inr _ => isFalse nofun
  | _ :: _, Sum.inr ⟨0, _⟩, Sum.inl _ => by
      simp only [SquareSnakeIncident]
      infer_instance
  | _ :: _, Sum.inr ⟨0, _⟩, Sum.inr _ => by
      simp only [SquareSnakeIncident]
      infer_instance
  | _ :: _, Sum.inr ⟨1, _⟩, Sum.inl _ => isFalse nofun
  | _ :: _, Sum.inr ⟨1, _⟩, Sum.inr _ => by
      simp only [SquareSnakeIncident]
      infer_instance
  | _ :: _, Sum.inr ⟨2, _⟩, Sum.inl _ => by
      simp only [SquareSnakeIncident]
      infer_instance
  | _ :: _, Sum.inr ⟨2, _⟩, Sum.inr _ => by
      simp only [SquareSnakeIncident]
      infer_instance

instance squareSnakeIncidentDecidable {turns : List Bool}
    (edge : SquareSnakeEdge turns) (vertex : SquareSnakeVertex turns) :
    Decidable (SquareSnakeIncident edge vertex) :=
  decideSquareSnakeIncident turns edge vertex

def squareSnakeEdgeCount {turns : List Bool}
    (selection : SquareSnakeEdge turns → Bool)
    (vertex : SquareSnakeVertex turns) : Nat :=
  ∑ edge, if selection edge then
    if SquareSnakeIncident edge vertex then 1 else 0
  else 0

def IsSquareSnakePerfect {turns : List Bool}
    (selection : SquareSnakeEdge turns → Bool) : Prop :=
  ∀ vertex, squareSnakeEdgeCount selection vertex = 1

def SquareSnakeIsTerminal :
    (turns : List Bool) → SquareSnakeVertex turns → Prop
  | [], vertex =>
      vertex = ⟨1, by decide⟩ ∨ vertex = ⟨2, by decide⟩
  | false :: _, Sum.inl _ => False
  | false :: _, Sum.inr _ => True
  | true :: turns, Sum.inl vertex =>
      vertex = (squareSnakeTerminal turns).2
  | true :: _, Sum.inr vertex => vertex = true

def decideSquareSnakeIsTerminal :
    (turns : List Bool) → (vertex : SquareSnakeVertex turns) →
      Decidable (SquareSnakeIsTerminal turns vertex)
  | [], vertex => by
      simp only [SquareSnakeIsTerminal]
      infer_instance
  | false :: _, Sum.inl _ => isFalse nofun
  | false :: _, Sum.inr _ => isTrue trivial
  | true :: _, Sum.inl _ => by
      simp only [SquareSnakeIsTerminal]
      infer_instance
  | true :: _, Sum.inr _ => by
      simp only [SquareSnakeIsTerminal]
      infer_instance

instance squareSnakeIsTerminalDecidable (turns : List Bool)
    (vertex : SquareSnakeVertex turns) :
    Decidable (SquareSnakeIsTerminal turns vertex) :=
  decideSquareSnakeIsTerminal turns vertex

theorem squareSnakeIsTerminal_iff (turns : List Bool)
    (vertex : SquareSnakeVertex turns) :
    SquareSnakeIsTerminal turns vertex ↔
      vertex = (squareSnakeTerminal turns).1 ∨
        vertex = (squareSnakeTerminal turns).2 := by
  cases turns with
  | nil => rfl
  | cons turn turns =>
      cases turn
      · cases vertex with
        | inl vertex =>
            constructor
            · exact False.elim
            · rintro (h | h) <;> cases h
        | inr vertex =>
            constructor
            · intro _
              cases vertex
              · exact Or.inl rfl
              · exact Or.inr rfl
            · exact fun _ => trivial
      · cases vertex with
        | inl vertex =>
            constructor
            · intro h
              exact Or.inl (congrArg Sum.inl h)
            · rintro (h | h)
              · exact Sum.inl.inj h
              · cases h
        | inr vertex =>
            constructor
            · intro h
              exact Or.inr (congrArg Sum.inr h)
            · rintro (h | h)
              · cases h
              · exact Sum.inr.inj h

def IsSquareSnakeNear {turns : List Bool}
    (selection : SquareSnakeEdge turns → Bool) : Prop :=
  ∀ vertex,
    squareSnakeEdgeCount selection vertex =
      if SquareSnakeIsTerminal turns vertex then 0 else 1

instance isSquareSnakePerfectDecidable {turns : List Bool}
    (selection : SquareSnakeEdge turns → Bool) :
    Decidable (IsSquareSnakePerfect selection) := by
  unfold IsSquareSnakePerfect
  infer_instance

instance isSquareSnakeNearDecidable {turns : List Bool}
    (selection : SquareSnakeEdge turns → Bool) :
    Decidable (IsSquareSnakeNear selection) := by
  unfold IsSquareSnakeNear
  infer_instance

abbrev SquareSnakePerfectMatching (turns : List Bool) :=
  {selection : SquareSnakeEdge turns → Bool //
    IsSquareSnakePerfect selection}

abbrev SquareSnakeNearMatching (turns : List Bool) :=
  {selection : SquareSnakeEdge turns → Bool //
    IsSquareSnakeNear selection}

instance squareSnakePerfectMatchingFintype (turns : List Bool) :
    Fintype (SquareSnakePerfectMatching turns) := by
  infer_instance

instance squareSnakeNearMatchingFintype (turns : List Bool) :
    Fintype (SquareSnakeNearMatching turns) := by
  infer_instance

theorem card_squareSnakePerfect_nil :
    Fintype.card (SquareSnakePerfectMatching []) = 2 := by
  decide

theorem card_squareSnakeNear_nil :
    Fintype.card (SquareSnakeNearMatching []) = 1 := by
  decide

end LatticePathOrdersClassical
