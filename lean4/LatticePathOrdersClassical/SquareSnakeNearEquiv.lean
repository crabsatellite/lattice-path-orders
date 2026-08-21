import LatticePathOrdersClassical.SquareSnakeNearTransition

/-! # The two near-state recurrences as actual equivalences -/

namespace LatticePathOrdersClassical

theorem straightPerfectToNear_injective {turns : List Bool} :
    Function.Injective (@straightPerfectToNear turns) := by
  intro left right h
  apply Subtype.ext
  have hselection := congrArg Subtype.val h
  have hold := congrArg oldSquareSnakeSelection hselection
  simpa [straightPerfectToNear] using hold

theorem straightPerfectToNear_surjective {turns : List Bool} :
    Function.Surjective (@straightPerfectToNear turns) := by
  intro matching
  have hlocal := near_false_local_zero matching.2
  let old : SquareSnakePerfectMatching turns :=
    ⟨oldSquareSnakeSelection matching.1,
      old_perfect_of_near_false matching.2 hlocal⟩
  refine ⟨old, ?_⟩
  apply Subtype.ext
  exact extend_old_of_local_eq matching.1 hlocal

noncomputable def squareSnakeNearFalseEquiv {turns : List Bool} :
    SquareSnakeNearMatching (false :: turns) ≃
      SquareSnakePerfectMatching turns :=
  (Equiv.ofBijective straightPerfectToNear
    ⟨straightPerfectToNear_injective,
      straightPerfectToNear_surjective⟩).symm

theorem turnNearToNear_injective {turns : List Bool} :
    Function.Injective (@turnNearToNear turns) := by
  intro left right h
  apply Subtype.ext
  have hselection := congrArg Subtype.val h
  have hold := congrArg oldSquareSnakeSelection hselection
  simpa [turnNearToNear] using hold

theorem turnNearToNear_surjective {turns : List Bool} :
    Function.Surjective (@turnNearToNear turns) := by
  intro matching
  have hlocal := near_true_local_pattern matching.2
  let old : SquareSnakeNearMatching turns :=
    ⟨oldSquareSnakeSelection matching.1,
      old_near_of_near_true matching.2 hlocal⟩
  refine ⟨old, ?_⟩
  apply Subtype.ext
  exact extend_old_of_local_eq matching.1 hlocal

noncomputable def squareSnakeNearTrueEquiv {turns : List Bool} :
    SquareSnakeNearMatching (true :: turns) ≃
      SquareSnakeNearMatching turns :=
  (Equiv.ofBijective turnNearToNear
    ⟨turnNearToNear_injective, turnNearToNear_surjective⟩).symm

theorem card_squareSnakeNear_false (turns : List Bool) :
    Fintype.card (SquareSnakeNearMatching (false :: turns)) =
      Fintype.card (SquareSnakePerfectMatching turns) :=
  Fintype.card_congr squareSnakeNearFalseEquiv

theorem card_squareSnakeNear_true (turns : List Bool) :
    Fintype.card (SquareSnakeNearMatching (true :: turns)) =
      Fintype.card (SquareSnakeNearMatching turns) :=
  Fintype.card_congr squareSnakeNearTrueEquiv

end LatticePathOrdersClassical
