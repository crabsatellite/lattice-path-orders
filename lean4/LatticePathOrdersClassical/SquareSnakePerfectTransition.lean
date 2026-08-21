import LatticePathOrdersClassical.SquareSnakeMatchingTransition
import Mathlib.Tactic.FinCases

/-! # Perfect matchings split into the two local tile cases -/

namespace LatticePathOrdersClassical

theorem perfect_local_pattern {turn : Bool} {turns : List Bool}
    {selection : SquareSnakeEdge (turn :: turns) → Bool}
    (hperfect : IsSquareSnakePerfect selection) :
    localSquareSnakeSelection selection =
        threeEdgeSelection false true false ∨
      localSquareSnakeSelection selection =
        threeEdgeSelection true false true := by
  have hx := hperfect (Sum.inr false)
  have hy := hperfect (Sum.inr true)
  rw [edgeCount_new_false] at hx
  rw [edgeCount_new_true] at hy
  cases hmiddle : localMiddle selection
  · have hfirst :
        localFirst selection = true := by
      cases h : localFirst selection
      · simp [h, hmiddle, chosenCount] at hx
      · rfl
    have hlast :
        localLast selection = true := by
      cases h : localLast selection
      · simp [h, hmiddle, chosenCount] at hy
      · rfl
    right
    funext edge
    fin_cases edge
    · simpa [localFirst, threeEdgeSelection] using hfirst
    · simpa [localMiddle, threeEdgeSelection] using hmiddle
    · simpa [localLast, threeEdgeSelection] using hlast
  · have hfirst :
        localFirst selection = false := by
      cases h : localFirst selection
      · rfl
      · simp [h, hmiddle, chosenCount] at hx
    have hlast :
        localLast selection = false := by
      cases h : localLast selection
      · rfl
      · simp [h, hmiddle, chosenCount] at hy
    left
    funext edge
    fin_cases edge
    · simpa [localFirst, threeEdgeSelection] using hfirst
    · simpa [localMiddle, threeEdgeSelection] using hmiddle
    · simpa [localLast, threeEdgeSelection] using hlast

theorem extend_old_of_local_eq {turn : Bool} {turns : List Bool}
    (selection : SquareSnakeEdge (turn :: turns) → Bool)
    {first middle last : Bool}
    (hlocal : localSquareSnakeSelection selection =
      threeEdgeSelection first middle last) :
    extendSquareSnakeSelection (turn := turn)
      (oldSquareSnakeSelection selection) first middle last = selection := by
  funext edge
  cases edge with
  | inl edge => rfl
  | inr edge => exact congrFun hlocal edge |>.symm

theorem old_perfect_of_perfect_outer {turn : Bool} {turns : List Bool}
    {selection : SquareSnakeEdge (turn :: turns) → Bool}
    (hperfect : IsSquareSnakePerfect selection)
    (hlocal : localSquareSnakeSelection selection =
      threeEdgeSelection false true false) :
    IsSquareSnakePerfect (oldSquareSnakeSelection selection) := by
  intro vertex
  have hv := hperfect (Sum.inl vertex)
  rw [edgeCount_old] at hv
  have hfirst : localFirst selection = false := by
    simpa [localFirst, threeEdgeSelection] using
      congrFun hlocal ⟨0, by decide⟩
  have hlast : localLast selection = false := by
    simpa [localLast, threeEdgeSelection] using
      congrFun hlocal ⟨2, by decide⟩
  rw [hfirst, hlast] at hv
  simpa [threeEdgeSelection, chosenCount] using hv

theorem old_near_of_perfect_sides {turn : Bool} {turns : List Bool}
    {selection : SquareSnakeEdge (turn :: turns) → Bool}
    (hperfect : IsSquareSnakePerfect selection)
    (hlocal : localSquareSnakeSelection selection =
      threeEdgeSelection true false true) :
    IsSquareSnakeNear (oldSquareSnakeSelection selection) := by
  intro vertex
  simp only [squareSnakeIsTerminal_iff]
  have hv := hperfect (Sum.inl vertex)
  rw [edgeCount_old] at hv
  have hfirst : localFirst selection = true := by
    simpa [localFirst, threeEdgeSelection] using
      congrFun hlocal ⟨0, by decide⟩
  have hlast : localLast selection = true := by
    simpa [localLast, threeEdgeSelection] using
      congrFun hlocal ⟨2, by decide⟩
  rw [hfirst, hlast] at hv
  have hterminal := squareSnakeTerminal_ne turns
  by_cases hp : vertex = (squareSnakeTerminal turns).1
  · subst vertex
    simp [chosenCount, hterminal] at hv ⊢
    omega
  · by_cases hq : vertex = (squareSnakeTerminal turns).2
    · subst vertex
      simp [chosenCount, hp] at hv ⊢
      omega
    · simp [hp, hq] at hv ⊢
      exact hv

theorem extend_outer_isPerfect {turn : Bool} {turns : List Bool}
    {old : SquareSnakeEdge turns → Bool}
    (hperfect : IsSquareSnakePerfect old) :
    IsSquareSnakePerfect
      (extendSquareSnakeSelection (turn := turn) old false true false) := by
  intro vertex
  cases vertex with
  | inl vertex =>
      rw [edgeCount_old]
      simpa [localSquareSnakeSelection, extendSquareSnakeSelection,
        threeEdgeSelection, chosenCount]
        using hperfect vertex
  | inr vertex =>
      cases vertex
      · rw [edgeCount_new_false]
        simp [localSquareSnakeSelection, extendSquareSnakeSelection,
          threeEdgeSelection, chosenCount]
      · rw [edgeCount_new_true]
        simp [localSquareSnakeSelection, extendSquareSnakeSelection,
          threeEdgeSelection, chosenCount]

theorem extend_sides_isPerfect {turn : Bool} {turns : List Bool}
    {old : SquareSnakeEdge turns → Bool}
    (hnear : IsSquareSnakeNear old) :
    IsSquareSnakePerfect
      (extendSquareSnakeSelection (turn := turn) old true false true) := by
  intro vertex
  cases vertex with
  | inl vertex =>
      rw [edgeCount_old]
      have hold := hnear vertex
      simp only [squareSnakeIsTerminal_iff] at hold
      have hterminal := squareSnakeTerminal_ne turns
      by_cases hp : vertex = (squareSnakeTerminal turns).1
      · subst vertex
        simpa [localSquareSnakeSelection, threeEdgeSelection, chosenCount,
          extendSquareSnakeSelection, hterminal] using hold
      · by_cases hq : vertex = (squareSnakeTerminal turns).2
        · subst vertex
          simpa [localSquareSnakeSelection, threeEdgeSelection, chosenCount,
            extendSquareSnakeSelection, hp] using hold
        · simpa [localSquareSnakeSelection, threeEdgeSelection, chosenCount,
            extendSquareSnakeSelection, hp, hq] using hold
  | inr vertex =>
      cases vertex
      · rw [edgeCount_new_false]
        simp [localSquareSnakeSelection, extendSquareSnakeSelection,
          threeEdgeSelection, chosenCount]
      · rw [edgeCount_new_true]
        simp [localSquareSnakeSelection, extendSquareSnakeSelection,
          threeEdgeSelection, chosenCount]

def perfectOuterMatching {turn : Bool} {turns : List Bool}
    (matching : SquareSnakePerfectMatching turns) :
    SquareSnakePerfectMatching (turn :: turns) :=
  ⟨extendSquareSnakeSelection matching.1 false true false,
    extend_outer_isPerfect matching.2⟩

def perfectSidesMatching {turn : Bool} {turns : List Bool}
    (matching : SquareSnakeNearMatching turns) :
    SquareSnakePerfectMatching (turn :: turns) :=
  ⟨extendSquareSnakeSelection matching.1 true false true,
    extend_sides_isPerfect matching.2⟩

end LatticePathOrdersClassical
