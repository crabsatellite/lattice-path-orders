import LatticePathOrdersKernel.LocalSquareBand

/-! # Constructor normal form for local band edges -/

namespace LatticePathOrdersKernel

open LatticePathOrdersClassical

inductive LocalBandBaseEdge (directions : Int → Direction) :
    LocalBandVertex → LocalBandVertex → Prop where
  | within (i : Int) (corner : CornerIndex) :
      LocalBandBaseEdge directions (i, corner) (i, cornerSuccessor corner)
  | rightFalse (i : Int) (h : directions i = .right) :
      LocalBandBaseEdge directions (i - 1, cornerOne) (i, cornerZero)
  | rightTrue (i : Int) (h : directions i = .right) :
      LocalBandBaseEdge directions (i - 1, cornerTwo) (i, cornerThree)
  | upFalse (i : Int) (h : directions i = .up) :
      LocalBandBaseEdge directions (i - 1, cornerTwo) (i, cornerOne)
  | upTrue (i : Int) (h : directions i = .up) :
      LocalBandBaseEdge directions (i - 1, cornerThree) (i, cornerZero)

def LocalBandEdge (directions : Int → Direction)
    (left right : LocalBandVertex) : Prop :=
  LocalBandBaseEdge directions left right ∨
    LocalBandBaseEdge directions right left

theorem localBandAdj_iff_edge (directions : Int → Direction)
    (left right : LocalBandVertex) :
    LocalBandAdj directions left right ↔ LocalBandEdge directions left right := by
  constructor
  · intro h
    rcases h with hwithin | ⟨i, endpoint, h | h⟩
    · rcases left with ⟨leftIndex, leftCorner⟩
      rcases right with ⟨rightIndex, rightCorner⟩
      simp only [Prod.fst, Prod.snd] at hwithin
      rcases hwithin with ⟨rfl, hcorner⟩
      rcases hcorner with hcorner | hcorner
      · subst rightCorner
        exact Or.inl (.within leftIndex leftCorner)
      · subst leftCorner
        exact Or.inr (.within leftIndex rightCorner)
    · rcases h with ⟨hleft, hright⟩
      rw [hleft, hright]
      cases hdir : directions i <;> cases endpoint
      · exact Or.inl (.rightFalse i hdir)
      · exact Or.inl (.rightTrue i hdir)
      · exact Or.inl (.upFalse i hdir)
      · exact Or.inl (.upTrue i hdir)
    · rcases h with ⟨hright, hleft⟩
      rw [hleft, hright]
      cases hdir : directions i <;> cases endpoint
      · exact Or.inr (.rightFalse i hdir)
      · exact Or.inr (.rightTrue i hdir)
      · exact Or.inr (.upFalse i hdir)
      · exact Or.inr (.upTrue i hdir)
  · intro h
    rcases h with h | h
    · cases h with
      | within i corner => exact Or.inl ⟨rfl, Or.inl rfl⟩
      | rightFalse i hdir =>
          exact Or.inr ⟨i, false, Or.inl ⟨by simp [hdir, bridgePreviousCorner],
            by simp [hdir, bridgeNextCorner]⟩⟩
      | rightTrue i hdir =>
          exact Or.inr ⟨i, true, Or.inl ⟨by simp [hdir, bridgePreviousCorner],
            by simp [hdir, bridgeNextCorner]⟩⟩
      | upFalse i hdir =>
          exact Or.inr ⟨i, false, Or.inl ⟨by simp [hdir, bridgePreviousCorner],
            by simp [hdir, bridgeNextCorner]⟩⟩
      | upTrue i hdir =>
          exact Or.inr ⟨i, true, Or.inl ⟨by simp [hdir, bridgePreviousCorner],
            by simp [hdir, bridgeNextCorner]⟩⟩
    · cases h with
      | within i corner => exact Or.inl ⟨rfl, Or.inr rfl⟩
      | rightFalse i hdir =>
          exact Or.inr ⟨i, false, Or.inr ⟨by simp [hdir, bridgePreviousCorner],
            by simp [hdir, bridgeNextCorner]⟩⟩
      | rightTrue i hdir =>
          exact Or.inr ⟨i, true, Or.inr ⟨by simp [hdir, bridgePreviousCorner],
            by simp [hdir, bridgeNextCorner]⟩⟩
      | upFalse i hdir =>
          exact Or.inr ⟨i, false, Or.inr ⟨by simp [hdir, bridgePreviousCorner],
            by simp [hdir, bridgeNextCorner]⟩⟩
      | upTrue i hdir =>
          exact Or.inr ⟨i, true, Or.inr ⟨by simp [hdir, bridgePreviousCorner],
            by simp [hdir, bridgeNextCorner]⟩⟩

end LatticePathOrdersKernel
