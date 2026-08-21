import LatticePathOrdersClassical.SquareSnakeNearEquiv

/-! # Cardinal transfer state of a literal square snake -/

namespace LatticePathOrdersClassical

def squareSnakeCardState (turns : List Bool) : Nat × Nat :=
  (Fintype.card (SquareSnakePerfectMatching turns),
    Fintype.card (SquareSnakeNearMatching turns))

def advanceSquareSnakeState (turn : Bool) (state : Nat × Nat) :
    Nat × Nat :=
  (state.1 + state.2, if turn then state.2 else state.1)

theorem squareSnakeCardState_nil :
    squareSnakeCardState [] = (2, 1) := by
  simp [squareSnakeCardState, card_squareSnakePerfect_nil,
    card_squareSnakeNear_nil]

theorem squareSnakeCardState_cons (turn : Bool) (turns : List Bool) :
    squareSnakeCardState (turn :: turns) =
      advanceSquareSnakeState turn (squareSnakeCardState turns) := by
  cases turn
  · simp [squareSnakeCardState, advanceSquareSnakeState,
      card_squareSnakePerfect_cons, card_squareSnakeNear_false]
  · simp [squareSnakeCardState, advanceSquareSnakeState,
      card_squareSnakePerfect_cons, card_squareSnakeNear_true]

theorem squareSnakeCardState_eq_foldr (turns : List Bool) :
    squareSnakeCardState turns =
      turns.foldr advanceSquareSnakeState (2, 1) := by
  induction turns with
  | nil => exact squareSnakeCardState_nil
  | cons turn turns ih =>
      rw [squareSnakeCardState_cons, ih]
      rfl

end LatticePathOrdersClassical
