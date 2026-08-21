import LatticePathOrdersClassical.SquareSnakePerfectTransition

/-! # The first matching-state recurrence as an actual equivalence -/

namespace LatticePathOrdersClassical

def perfectSumToNew {turn : Bool} {turns : List Bool} :
    SquareSnakePerfectMatching turns ⊕ SquareSnakeNearMatching turns →
      SquareSnakePerfectMatching (turn :: turns)
  | Sum.inl matching => perfectOuterMatching matching
  | Sum.inr matching => perfectSidesMatching matching

theorem perfectSumToNew_injective {turn : Bool} {turns : List Bool} :
    Function.Injective (@perfectSumToNew turn turns) := by
  intro left right h
  cases left with
  | inl left =>
      cases right with
      | inl right =>
          apply congrArg Sum.inl
          apply Subtype.ext
          have hselection := congrArg Subtype.val h
          have hold := congrArg oldSquareSnakeSelection hselection
          simpa [perfectSumToNew, perfectOuterMatching] using hold
      | inr right =>
          have hmiddle := congrArg
            (fun matching => localMiddle matching.1) h
          simp [perfectSumToNew, perfectOuterMatching, perfectSidesMatching,
            localMiddle, localSquareSnakeSelection,
            extendSquareSnakeSelection, threeEdgeSelection] at hmiddle
  | inr left =>
      cases right with
      | inl right =>
          have hmiddle := congrArg
            (fun matching => localMiddle matching.1) h
          simp [perfectSumToNew, perfectOuterMatching, perfectSidesMatching,
            localMiddle, localSquareSnakeSelection,
            extendSquareSnakeSelection, threeEdgeSelection] at hmiddle
      | inr right =>
          apply congrArg Sum.inr
          apply Subtype.ext
          have hselection := congrArg Subtype.val h
          have hold := congrArg oldSquareSnakeSelection hselection
          simpa [perfectSumToNew, perfectSidesMatching] using hold

theorem perfectSumToNew_surjective {turn : Bool} {turns : List Bool} :
    Function.Surjective (@perfectSumToNew turn turns) := by
  intro matching
  rcases perfect_local_pattern matching.2 with houter | hsides
  · let old : SquareSnakePerfectMatching turns :=
      ⟨oldSquareSnakeSelection matching.1,
        old_perfect_of_perfect_outer matching.2 houter⟩
    refine ⟨Sum.inl old, ?_⟩
    apply Subtype.ext
    exact extend_old_of_local_eq matching.1 houter
  · let old : SquareSnakeNearMatching turns :=
      ⟨oldSquareSnakeSelection matching.1,
        old_near_of_perfect_sides matching.2 hsides⟩
    refine ⟨Sum.inr old, ?_⟩
    apply Subtype.ext
    exact extend_old_of_local_eq matching.1 hsides

noncomputable def squareSnakePerfectEquiv {turn : Bool} {turns : List Bool} :
    SquareSnakePerfectMatching (turn :: turns) ≃
      SquareSnakePerfectMatching turns ⊕ SquareSnakeNearMatching turns :=
  (Equiv.ofBijective perfectSumToNew
    ⟨perfectSumToNew_injective, perfectSumToNew_surjective⟩).symm

theorem card_squareSnakePerfect_cons (turn : Bool) (turns : List Bool) :
    Fintype.card (SquareSnakePerfectMatching (turn :: turns)) =
      Fintype.card (SquareSnakePerfectMatching turns) +
        Fintype.card (SquareSnakeNearMatching turns) := by
  rw [Fintype.card_congr squareSnakePerfectEquiv]
  exact Fintype.card_sum

end LatticePathOrdersClassical
