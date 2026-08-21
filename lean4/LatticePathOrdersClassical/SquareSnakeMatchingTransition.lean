import LatticePathOrdersClassical.SquareSnakeGraph
import Mathlib.Data.Fintype.BigOperators
import Mathlib.Algebra.BigOperators.Fin

/-! # Local matching states when one square is attached -/

namespace LatticePathOrdersClassical

open scoped BigOperators

@[reducible] def chosenCount (chosen : Bool) : Nat :=
  if chosen then 1 else 0

def oldSquareSnakeSelection {turn : Bool} {turns : List Bool}
    (selection : SquareSnakeEdge (turn :: turns) → Bool) :
    SquareSnakeEdge turns → Bool :=
  fun edge => selection (Sum.inl edge)

def localSquareSnakeSelection {turn : Bool} {turns : List Bool}
    (selection : SquareSnakeEdge (turn :: turns) → Bool) :
    Fin 3 → Bool :=
  fun edge => selection (Sum.inr edge)

@[reducible] def localFirst {turn : Bool} {turns : List Bool}
    (selection : SquareSnakeEdge (turn :: turns) → Bool) : Bool :=
  localSquareSnakeSelection selection ⟨0, by decide⟩

@[reducible] def localMiddle {turn : Bool} {turns : List Bool}
    (selection : SquareSnakeEdge (turn :: turns) → Bool) : Bool :=
  localSquareSnakeSelection selection ⟨1, by decide⟩

@[reducible] def localLast {turn : Bool} {turns : List Bool}
    (selection : SquareSnakeEdge (turn :: turns) → Bool) : Bool :=
  localSquareSnakeSelection selection ⟨2, by decide⟩

def threeEdgeSelection (first middle last : Bool) : Fin 3 → Bool
  | ⟨0, _⟩ => first
  | ⟨1, _⟩ => middle
  | ⟨2, _⟩ => last

def extendSquareSnakeSelection {turn : Bool} {turns : List Bool}
    (old : SquareSnakeEdge turns → Bool) (first middle last : Bool) :
    SquareSnakeEdge (turn :: turns) → Bool
  | Sum.inl edge => old edge
  | Sum.inr edge => threeEdgeSelection first middle last edge

@[simp] theorem old_extendSquareSnakeSelection
    {turn : Bool} {turns : List Bool}
    (old : SquareSnakeEdge turns → Bool) (first middle last : Bool) :
    oldSquareSnakeSelection
      (extendSquareSnakeSelection (turn := turn) old first middle last) = old := by
  rfl

@[simp] theorem local_extendSquareSnakeSelection
    {turn : Bool} {turns : List Bool}
    (old : SquareSnakeEdge turns → Bool) (first middle last : Bool) :
    localSquareSnakeSelection
      (extendSquareSnakeSelection (turn := turn) old first middle last) =
        threeEdgeSelection first middle last := by
  rfl

theorem squareSnakeTerminal_ne (turns : List Bool) :
    (squareSnakeTerminal turns).1 ≠ (squareSnakeTerminal turns).2 := by
  induction turns with
  | nil => decide
  | cons turn turns ih =>
      cases turn
      · simp only [squareSnakeTerminal, Bool.false_eq_true, ↓reduceIte]
        intro h
        exact Bool.noConfusion (Sum.inr.inj h)
      · simp only [squareSnakeTerminal, ↓reduceIte]
        intro h
        cases h

theorem edgeCount_new_false {turn : Bool} {turns : List Bool}
    (selection : SquareSnakeEdge (turn :: turns) → Bool) :
    squareSnakeEdgeCount selection (Sum.inr false) =
      chosenCount (localFirst selection) +
        chosenCount (localMiddle selection) := by
  simp only [squareSnakeEdgeCount]
  change (∑ edge : SquareSnakeEdge turns ⊕ Fin 3,
    if selection edge then
      if @SquareSnakeIncident (turn :: turns) edge
          (Sum.inr false) then 1 else 0
    else 0) = _
  rw [Fintype.sum_sum_type]
  simp only [Fin.sum_univ_succ]
  simp [SquareSnakeIncident, localSquareSnakeSelection, chosenCount]
  rfl

theorem edgeCount_new_true {turn : Bool} {turns : List Bool}
    (selection : SquareSnakeEdge (turn :: turns) → Bool) :
    squareSnakeEdgeCount selection (Sum.inr true) =
      chosenCount (localMiddle selection) +
        chosenCount (localLast selection) := by
  simp only [squareSnakeEdgeCount]
  change (∑ edge : SquareSnakeEdge turns ⊕ Fin 3,
    if selection edge then
      if @SquareSnakeIncident (turn :: turns) edge
          (Sum.inr true) then 1 else 0
    else 0) = _
  rw [Fintype.sum_sum_type]
  simp only [Fin.sum_univ_succ]
  simp [SquareSnakeIncident, localSquareSnakeSelection, chosenCount]
  rfl

theorem edgeCount_old {turn : Bool} {turns : List Bool}
    (selection : SquareSnakeEdge (turn :: turns) → Bool)
    (vertex : SquareSnakeVertex turns) :
    squareSnakeEdgeCount selection (Sum.inl vertex) =
      squareSnakeEdgeCount (oldSquareSnakeSelection selection) vertex +
        (if vertex = (squareSnakeTerminal turns).1 then
          chosenCount (localFirst selection)
        else 0) +
        (if vertex = (squareSnakeTerminal turns).2 then
          chosenCount (localLast selection)
        else 0) := by
  simp only [squareSnakeEdgeCount]
  change (∑ edge : SquareSnakeEdge turns ⊕ Fin 3,
    if selection edge then
      if @SquareSnakeIncident (turn :: turns) edge
          (Sum.inl vertex) then 1 else 0
    else 0) = _
  rw [Fintype.sum_sum_type]
  simp only [Fin.sum_univ_succ]
  simp [SquareSnakeIncident, oldSquareSnakeSelection,
    localSquareSnakeSelection, chosenCount]
  have hterminal := squareSnakeTerminal_ne turns
  by_cases hfirst : vertex = (squareSnakeTerminal turns).1 <;>
    by_cases hlast : vertex = (squareSnakeTerminal turns).2 <;>
    simp [hfirst, hlast, hterminal, Ne.symm hterminal]
  all_goals rfl

end LatticePathOrdersClassical
