import LatticePathOrdersClassical.SquareSnakeGraph
import Mathlib.Tactic.FinCases

/-! # The recursive incidence relation is exactly the displayed edge endpoints -/

namespace LatticePathOrdersClassical

theorem squareSnakeIncident_iff_endpoints {turns : List Bool}
    (edge : SquareSnakeEdge turns) (vertex : SquareSnakeVertex turns) :
    SquareSnakeIncident edge vertex ↔
      vertex = (squareSnakeEndpoints edge).1 ∨
        vertex = (squareSnakeEndpoints edge).2 := by
  induction turns with
  | nil => rfl
  | cons turn turns ih =>
      cases edge with
      | inl edge =>
          cases vertex with
          | inl vertex =>
              constructor
              · intro h
                rcases (ih edge vertex).mp h with h | h
                · exact Or.inl (congrArg Sum.inl h)
                · exact Or.inr (congrArg Sum.inl h)
              · rintro (h | h)
                · exact (ih edge vertex).mpr (Or.inl (Sum.inl.inj h))
                · exact (ih edge vertex).mpr (Or.inr (Sum.inl.inj h))
          | inr vertex =>
              constructor
              · exact False.elim
              · rintro (h | h) <;> cases h
      | inr edge =>
          fin_cases edge
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
          · cases vertex with
            | inl vertex =>
                constructor
                · exact False.elim
                · rintro (h | h) <;> cases h
            | inr vertex =>
                constructor
                · rintro (h | h)
                  · exact Or.inl (congrArg Sum.inr h)
                  · exact Or.inr (congrArg Sum.inr h)
                · rintro (h | h)
                  · exact Or.inl (Sum.inr.inj h)
                  · exact Or.inr (Sum.inr.inj h)
          · cases vertex with
            | inl vertex =>
                constructor
                · intro h
                  exact Or.inr (congrArg Sum.inl h)
                · rintro (h | h)
                  · cases h
                  · exact Sum.inl.inj h
            | inr vertex =>
                constructor
                · intro h
                  exact Or.inl (congrArg Sum.inr h)
                · rintro (h | h)
                  · exact Sum.inr.inj h
                  · cases h

end LatticePathOrdersClassical
