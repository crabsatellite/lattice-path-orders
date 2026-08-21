import LatticePathOrdersClassical.SquareSnakeCardState
import LatticePathOrdersClassical.SquareSnakeEndpointAudit
import LatticePathOrders.MatrixScore
import Mathlib.Data.List.Fold

/-!
# Literal perfect matchings of Schiffler's path snake

After the first and last half-tiles are removed, every remaining adjacency of
path steps contributes two tile attachments.  The first attachment is straight;
the second turns exactly when the adjacent path steps differ.  The first path
adjacency is already represented by the initial square, so only the remaining
change bits extend the graph.  Reversal puts the chronologically first extension
at the tail, matching the inductive square-snake type.
-/

namespace LatticePathOrdersKernel

open LatticePathOrders
open LatticePathOrdersClassical

def stepChangeFlags : Path → List Bool
  | [] | [_] => []
  | left :: right :: rest =>
      (if left = right then false else true) ::
        stepChangeFlags (right :: rest)

def pathSnakeChronologicalTurns : Path → List Bool
  | _ :: middle :: next :: rest =>
      false :: (if middle = next then false else true) ::
        pathSnakeChronologicalTurns (middle :: next :: rest)
  | _ => []

/-- Consecutive half-tiles along an interior path step are straight; moving to
the next path step turns exactly when the two step letters differ. -/
theorem pathSnakeChronologicalTurns_eq_changeFlags (word : Path) :
    pathSnakeChronologicalTurns word =
      ((stepChangeFlags word).drop 1 |>.flatMap
        fun change => [false, change]) := by
  induction word with
  | nil => rfl
  | cons left tail ih =>
      cases tail with
      | nil => rfl
      | cons middle rest =>
          cases rest with
          | nil => rfl
          | cons next rest =>
              simp only [pathSnakeChronologicalTurns, stepChangeFlags,
                List.drop_succ_cons, List.drop_zero, List.flatMap_cons]
              rw [show pathSnakeChronologicalTurns (middle :: next :: rest) =
                  ((stepChangeFlags (middle :: next :: rest)).drop 1 |>.flatMap
                    fun change => [false, change]) by
                simpa using ih]
              by_cases h : middle = next <;>
                simp [h, stepChangeFlags]

def pathSnakeTurns (word : Path) : List Bool :=
  (pathSnakeChronologicalTurns word).reverse

abbrev LiteralPathSnakePerfectMatching (word : Path) :=
  SquareSnakePerfectMatching (pathSnakeTurns word)

/-- The exceptional no-tile snake is the single edge from
Canakci--Schiffler, Definition 3.1. -/
abbrev SingleEdgeSnakeVertex := Fin 2
abbrev SingleEdgeSnakeEdge := Fin 1

def IsSingleEdgeSnakePerfect
    (selection : SingleEdgeSnakeEdge → Bool) : Prop :=
  ∀ _vertex : SingleEdgeSnakeVertex, selection ⟨0, by decide⟩ = true

instance isSingleEdgeSnakePerfectDecidable
    (selection : SingleEdgeSnakeEdge → Bool) :
    Decidable (IsSingleEdgeSnakePerfect selection) := by
  unfold IsSingleEdgeSnakePerfect
  infer_instance

abbrev SingleEdgeSnakePerfectMatching :=
  {selection : SingleEdgeSnakeEdge → Bool //
    IsSingleEdgeSnakePerfect selection}

instance singleEdgeSnakePerfectMatchingFintype :
    Fintype SingleEdgeSnakePerfectMatching := by
  infer_instance

theorem card_singleEdgeSnakePerfectMatching :
    Fintype.card SingleEdgeSnakePerfectMatching = 1 := by
  decide

/-- Literal source graph on the whole `Path` type.  Source paths of length at
least two use the square snake; the vacuous coefficient word uses the
published single-edge exceptional graph. -/
def SourcePathSnakePerfectMatching (word : Path) : Type :=
  if 2 ≤ word.length then LiteralPathSnakePerfectMatching word
  else SingleEdgeSnakePerfectMatching

noncomputable instance sourcePathSnakePerfectMatchingFintype (word : Path) :
    Fintype (SourcePathSnakePerfectMatching word) := by
  unfold SourcePathSnakePerfectMatching
  split <;> infer_instance

noncomputable def literalPathSnakeMatchingNumber (word : Path) : Nat :=
  Fintype.card (LiteralPathSnakePerfectMatching word)

noncomputable def sourcePathSnakeMatchingNumber (word : Path) : Nat :=
  Fintype.card (SourcePathSnakePerfectMatching word)

def applyAdjacencyChange (change : Bool) (state : Nat × Nat) :
    Nat × Nat :=
  advanceSquareSnakeState change
    (advanceSquareSnakeState false state)

theorem foldl_chronologicalTurns (changes : List Bool) (state : Nat × Nat) :
    ((changes.flatMap fun change => [false, change]).foldl
      (fun state turn => advanceSquareSnakeState turn state) state) =
    changes.foldl (fun state change => applyAdjacencyChange change state)
      state := by
  induction changes generalizing state with
  | nil => rfl
  | cons change changes ih =>
      simp only [List.flatMap_cons, List.foldl_append, List.foldl_cons,
        List.foldl_nil]
      exact ih _

theorem applyAdjacencyChange_initial (change : Bool) :
    applyAdjacencyChange change (1, 0) = (2, 1) := by
  cases change <;> rfl

theorem foldl_drop_first_change {changes : List Bool}
    (hne : changes ≠ []) :
    (changes.drop 1).foldl
        (fun state change => applyAdjacencyChange change state) (2, 1) =
      changes.foldl
        (fun state change => applyAdjacencyChange change state) (1, 0) := by
  cases changes with
  | nil => exact (hne rfl).elim
  | cons change changes =>
      simp [applyAdjacencyChange_initial]

def blockOfChange (change : Bool) : Mat2 :=
  if change then D else E

def rowApply (state : Nat × Nat) (matrix : Mat2) : Nat × Nat :=
  (state.1 * matrix.a11 + state.2 * matrix.a21,
    state.1 * matrix.a12 + state.2 * matrix.a22)

theorem applyAdjacencyChange_eq_rowApply (change : Bool)
    (state : Nat × Nat) :
    applyAdjacencyChange change state =
      rowApply state (blockOfChange change) := by
  cases change <;>
    simp [applyAdjacencyChange, advanceSquareSnakeState, rowApply,
      blockOfChange, D, E, T, Mat2.mul] <;>
    omega

theorem rowApply_mul (state : Nat × Nat) (left right : Mat2) :
    rowApply (rowApply state left) right = rowApply state (left * right) := by
  simp [rowApply, Mat2.mul]
  constructor <;> ring

theorem row_matrix_foldl (blocks : List Mat2) (accumulator : Mat2) :
    ((blocks.foldl (fun product block => product * block) accumulator).a11,
      (blocks.foldl (fun product block => product * block) accumulator).a12) =
    blocks.foldl rowApply (accumulator.a11, accumulator.a12) := by
  induction blocks generalizing accumulator with
  | nil => rfl
  | cons block blocks ih =>
      simp only [List.foldl_cons]
      rw [ih]
      apply congrArg (fun state => blocks.foldl rowApply state)
      simp [rowApply, Mat2.mul]

theorem row_matrixProduct (blocks : List Mat2) :
    ((matrixProduct blocks).a11, (matrixProduct blocks).a12) =
      blocks.foldl rowApply (1, 0) := by
  unfold matrixProduct
  simpa [Mat2.one] using row_matrix_foldl blocks (1 : Mat2)

theorem adjacencyBlocks_eq_changeBlocks (word : Path) :
    adjacencyBlocks word = (stepChangeFlags word).map blockOfChange := by
  induction word with
  | nil => rfl
  | cons left tail ih =>
      cases tail with
      | nil => rfl
      | cons right rest =>
          simp only [adjacencyBlocks, stepChangeFlags, List.map_cons]
          rw [show adjacencyBlocks (right :: rest) =
              (stepChangeFlags (right :: rest)).map blockOfChange by
            simpa using ih]
          by_cases h : left = right <;>
            simp [h, blockOfChange]

theorem foldl_changeBlocks_from (changes : List Bool) (state : Nat × Nat) :
    (changes.map blockOfChange).foldl rowApply state =
      changes.foldl
        (fun state change => applyAdjacencyChange change state) state := by
  induction changes generalizing state with
  | nil => rfl
  | cons change changes ih =>
      simp only [List.map_cons, List.foldl_cons]
      rw [applyAdjacencyChange_eq_rowApply]
      exact ih _

theorem foldl_changeBlocks (changes : List Bool) :
    (changes.map blockOfChange).foldl rowApply (1, 0) =
      changes.foldl
        (fun state change => applyAdjacencyChange change state) (1, 0) :=
  foldl_changeBlocks_from changes (1, 0)

theorem stepChangeFlags_ne_nil {word : Path} (hlength : 2 ≤ word.length) :
    stepChangeFlags word ≠ [] := by
  cases word with
  | nil => simp at hlength
  | cons first tail =>
      cases tail with
      | nil => simp at hlength
      | cons second rest => simp [stepChangeFlags]

theorem literalPathSnakeMatchingNumber_eq_matchingScore
    {word : Path} (hlength : 2 ≤ word.length) :
    literalPathSnakeMatchingNumber word = matchingScore word := by
  have hchanges := stepChangeFlags_ne_nil hlength
  unfold literalPathSnakeMatchingNumber
  change (squareSnakeCardState (pathSnakeTurns word)).1 = _
  rw [squareSnakeCardState_eq_foldr]
  unfold pathSnakeTurns
  rw [List.foldr_reverse]
  rw [pathSnakeChronologicalTurns_eq_changeFlags]
  rw [foldl_chronologicalTurns]
  rw [foldl_drop_first_change hchanges]
  unfold matchingScore
  have hrow := row_matrixProduct (adjacencyBlocks word)
  rw [adjacencyBlocks_eq_changeBlocks, foldl_changeBlocks] at hrow
  rw [adjacencyBlocks_eq_changeBlocks]
  exact congrArg Prod.fst hrow |>.symm

theorem matchingScore_eq_one_of_length_lt_two
    {word : Path} (hlength : ¬ 2 ≤ word.length) :
    matchingScore word = 1 := by
  cases word with
  | nil => rfl
  | cons first tail =>
      cases tail with
      | nil => rfl
      | cons second rest => simp at hlength

theorem sourcePathSnakeMatchingNumber_eq_matchingScore (word : Path) :
    sourcePathSnakeMatchingNumber word = matchingScore word := by
  by_cases hlength : 2 ≤ word.length
  · unfold sourcePathSnakeMatchingNumber SourcePathSnakePerfectMatching
    simp only [if_pos hlength]
    exact literalPathSnakeMatchingNumber_eq_matchingScore hlength
  · unfold sourcePathSnakeMatchingNumber SourcePathSnakePerfectMatching
    simp only [if_neg hlength]
    rw [card_singleEdgeSnakePerfectMatching,
      matchingScore_eq_one_of_length_lt_two hlength]

end LatticePathOrdersKernel
