import LatticePathOrdersClassical.SquareSnakePerfectEquiv

/-! # Near-matching states for straight and turning terminal edges -/

namespace LatticePathOrdersClassical

theorem near_false_local_zero {turns : List Bool}
    {selection : SquareSnakeEdge (false :: turns) → Bool}
    (hnear : IsSquareSnakeNear selection) :
    localSquareSnakeSelection selection =
      threeEdgeSelection false false false := by
  have hx := hnear (Sum.inr false)
  have hy := hnear (Sum.inr true)
  simp [SquareSnakeIsTerminal] at hx hy
  rw [edgeCount_new_false] at hx
  rw [edgeCount_new_true] at hy
  have hfirst : localFirst selection = false := by
    cases h : localFirst selection
    · rfl
    · simp [h, chosenCount] at hx
  have hmiddle : localMiddle selection = false := by
    cases h : localMiddle selection
    · rfl
    · simp [h, chosenCount] at hx
  have hlast : localLast selection = false := by
    cases h : localLast selection
    · rfl
    · simp [h, chosenCount] at hy
  funext edge
  fin_cases edge
  · simpa [localFirst, threeEdgeSelection] using hfirst
  · simpa [localMiddle, threeEdgeSelection] using hmiddle
  · simpa [localLast, threeEdgeSelection] using hlast

theorem old_perfect_of_near_false {turns : List Bool}
    {selection : SquareSnakeEdge (false :: turns) → Bool}
    (hnear : IsSquareSnakeNear selection)
    (hlocal : localSquareSnakeSelection selection =
      threeEdgeSelection false false false) :
    IsSquareSnakePerfect (oldSquareSnakeSelection selection) := by
  intro vertex
  have hv := hnear (Sum.inl vertex)
  simp [SquareSnakeIsTerminal] at hv
  rw [edgeCount_old] at hv
  have hfirst : localFirst selection = false := by
    simpa [localFirst, threeEdgeSelection] using
      congrFun hlocal ⟨0, by decide⟩
  have hlast : localLast selection = false := by
    simpa [localLast, threeEdgeSelection] using
      congrFun hlocal ⟨2, by decide⟩
  rw [hfirst, hlast] at hv
  simpa [chosenCount] using hv

theorem extend_zero_isNear_false {turns : List Bool}
    {old : SquareSnakeEdge turns → Bool}
    (hperfect : IsSquareSnakePerfect old) :
    IsSquareSnakeNear
      (extendSquareSnakeSelection (turn := false) old false false false) := by
  intro vertex
  cases vertex with
  | inl vertex =>
      rw [edgeCount_old]
      simpa [SquareSnakeIsTerminal, squareSnakeTerminal, localFirst, localLast,
        localSquareSnakeSelection, extendSquareSnakeSelection,
        threeEdgeSelection, chosenCount] using hperfect vertex
  | inr vertex =>
      cases vertex
      · rw [edgeCount_new_false]
        simp [SquareSnakeIsTerminal, localFirst, localMiddle,
          localSquareSnakeSelection, extendSquareSnakeSelection,
          threeEdgeSelection, chosenCount]
      · rw [edgeCount_new_true]
        simp [SquareSnakeIsTerminal, localMiddle, localLast,
          localSquareSnakeSelection, extendSquareSnakeSelection,
          threeEdgeSelection, chosenCount]

theorem near_true_local_pattern {turns : List Bool}
    {selection : SquareSnakeEdge (true :: turns) → Bool}
    (hnear : IsSquareSnakeNear selection) :
    localSquareSnakeSelection selection =
      threeEdgeSelection true false false := by
  have hx := hnear (Sum.inr false)
  have hy := hnear (Sum.inr true)
  simp [SquareSnakeIsTerminal] at hx hy
  rw [edgeCount_new_false] at hx
  rw [edgeCount_new_true] at hy
  have hmiddle : localMiddle selection = false := by
    cases h : localMiddle selection
    · rfl
    · simp [h, chosenCount] at hy
  have hlast : localLast selection = false := by
    cases h : localLast selection
    · rfl
    · simp [h, chosenCount] at hy
  have hfirst : localFirst selection = true := by
    cases h : localFirst selection
    · simp [h, hmiddle, chosenCount] at hx
    · rfl
  funext edge
  fin_cases edge
  · simpa [localFirst, threeEdgeSelection] using hfirst
  · simpa [localMiddle, threeEdgeSelection] using hmiddle
  · simpa [localLast, threeEdgeSelection] using hlast

theorem old_near_of_near_true {turns : List Bool}
    {selection : SquareSnakeEdge (true :: turns) → Bool}
    (hnear : IsSquareSnakeNear selection)
    (hlocal : localSquareSnakeSelection selection =
      threeEdgeSelection true false false) :
    IsSquareSnakeNear (oldSquareSnakeSelection selection) := by
  intro vertex
  simp only [squareSnakeIsTerminal_iff]
  have hv := hnear (Sum.inl vertex)
  simp [SquareSnakeIsTerminal] at hv
  rw [edgeCount_old] at hv
  have hfirst : localFirst selection = true := by
    simpa [localFirst, threeEdgeSelection] using
      congrFun hlocal ⟨0, by decide⟩
  have hlast : localLast selection = false := by
    simpa [localLast, threeEdgeSelection] using
      congrFun hlocal ⟨2, by decide⟩
  rw [hfirst, hlast] at hv
  have hterminal := squareSnakeTerminal_ne turns
  by_cases hp : vertex = (squareSnakeTerminal turns).1
  · subst vertex
    simp [chosenCount, hterminal] at hv ⊢
    exact hv
  · by_cases hq : vertex = (squareSnakeTerminal turns).2
    · subst vertex
      simp [chosenCount, hp] at hv ⊢
      exact hv
    · simp [hp, hq] at hv ⊢
      exact hv

theorem extend_turn_isNear_true {turns : List Bool}
    {old : SquareSnakeEdge turns → Bool}
    (hnear : IsSquareSnakeNear old) :
    IsSquareSnakeNear
      (extendSquareSnakeSelection (turn := true) old true false false) := by
  intro vertex
  cases vertex with
  | inl vertex =>
      rw [edgeCount_old]
      have hold := hnear vertex
      simp only [squareSnakeIsTerminal_iff] at hold
      have hterminal := squareSnakeTerminal_ne turns
      by_cases hp : vertex = (squareSnakeTerminal turns).1
      · subst vertex
        simpa [SquareSnakeIsTerminal, squareSnakeTerminal, localFirst, localLast,
          localSquareSnakeSelection, extendSquareSnakeSelection,
          threeEdgeSelection, chosenCount, hterminal] using hold
      · by_cases hq : vertex = (squareSnakeTerminal turns).2
        · subst vertex
          simpa [SquareSnakeIsTerminal, squareSnakeTerminal, localFirst, localLast,
            localSquareSnakeSelection, extendSquareSnakeSelection,
            threeEdgeSelection, chosenCount, hp] using hold
        · simpa [SquareSnakeIsTerminal, squareSnakeTerminal, localFirst, localLast,
            localSquareSnakeSelection, extendSquareSnakeSelection,
            threeEdgeSelection, chosenCount, hp, hq] using hold
  | inr vertex =>
      cases vertex
      · rw [edgeCount_new_false]
        simp [SquareSnakeIsTerminal, localFirst, localMiddle,
          localSquareSnakeSelection, extendSquareSnakeSelection,
          threeEdgeSelection, chosenCount]
      · rw [edgeCount_new_true]
        simp [SquareSnakeIsTerminal, localMiddle, localLast,
          localSquareSnakeSelection, extendSquareSnakeSelection,
          threeEdgeSelection, chosenCount]

def straightPerfectToNear {turns : List Bool}
    (matching : SquareSnakePerfectMatching turns) :
    SquareSnakeNearMatching (false :: turns) :=
  ⟨extendSquareSnakeSelection matching.1 false false false,
    extend_zero_isNear_false matching.2⟩

def turnNearToNear {turns : List Bool}
    (matching : SquareSnakeNearMatching turns) :
    SquareSnakeNearMatching (true :: turns) :=
  ⟨extendSquareSnakeSelection matching.1 true false false,
    extend_turn_isNear_true matching.2⟩

end LatticePathOrdersClassical
