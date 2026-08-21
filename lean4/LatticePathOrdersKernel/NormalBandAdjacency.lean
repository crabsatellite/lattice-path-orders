import LatticePathOrdersKernel.NormalBandGraph

/-! # Closed adjacency formula on the normal band graph -/

namespace LatticePathOrdersKernel

open LatticePathOrdersClassical

def CornerCycleAdj (left right : CornerIndex) : Prop :=
  right = cornerSuccessor left ∨ left = cornerSuccessor right

def bridgePreviousCorner : Direction → Bool → CornerIndex
  | .right, false => cornerOne
  | .right, true => cornerTwo
  | .up, false => cornerTwo
  | .up, true => cornerThree

def bridgeNextCorner : Direction → Bool → CornerIndex
  | .right, false => cornerZero
  | .right, true => cornerThree
  | .up, false => cornerOne
  | .up, true => cornerZero

def ExplicitNormalBandAdj {n : Nat} (steps : ZMod n → Direction)
    (left right : NormalBandVertex n) : Prop :=
  (left.1 = right.1 ∧ CornerCycleAdj left.2 right.2) ∨
  ∃ i endpoint,
    (left = (i - 1, bridgePreviousCorner (steps i) endpoint) ∧
      right = (i, bridgeNextCorner (steps i) endpoint)) ∨
    (right = (i - 1, bridgePreviousCorner (steps i) endpoint) ∧
      left = (i, bridgeNextCorner (steps i) endpoint))

theorem normalBandAdj_iff_explicit
    {n : Nat} (steps : ZMod n → Direction)
    (left right : NormalBandVertex n) :
    NormalBandAdj steps left right ↔ ExplicitNormalBandAdj steps left right := by
  rw [normalBandAdj_iff_tile_side]
  constructor
  · rintro ⟨tile, corner, h | h⟩
    · rcases h with ⟨hleft, hright⟩
      rw [hleft, hright]
      cases tile with
      | vertex i =>
          exact Or.inl ⟨rfl, Or.inl rfl⟩
      | midpoint i =>
          cases hdir : steps i with
          | right =>
              fin_cases corner
              · refine Or.inr ⟨i, false, Or.inl ⟨?_, ?_⟩⟩ <;>
                  simp [normalTileCorner, normalizedBandPair,
                    rawBandCornerPair, normalizeRawBandCorner,
                    bridgePreviousCorner, bridgeNextCorner,
                    cornerSuccessor, hdir]
              · simp [ExplicitNormalBandAdj, CornerCycleAdj,
                  normalTileCorner, normalizedBandPair, rawBandCornerPair,
                  normalizeRawBandCorner, cornerSuccessor, hdir]
              · refine Or.inr ⟨i, true, Or.inr ⟨?_, ?_⟩⟩ <;>
                  simp [normalTileCorner, normalizedBandPair,
                    rawBandCornerPair, normalizeRawBandCorner,
                    bridgePreviousCorner, bridgeNextCorner,
                    cornerSuccessor, hdir]
              · simp [ExplicitNormalBandAdj, CornerCycleAdj,
                  normalTileCorner, normalizedBandPair, rawBandCornerPair,
                  normalizeRawBandCorner, cornerSuccessor, hdir]
          | up =>
              fin_cases corner
              · simp [ExplicitNormalBandAdj, CornerCycleAdj,
                  normalTileCorner, normalizedBandPair, rawBandCornerPair,
                  normalizeRawBandCorner, cornerSuccessor, hdir]
              · refine Or.inr ⟨i, false, Or.inl ⟨?_, ?_⟩⟩ <;>
                  simp [normalTileCorner, normalizedBandPair,
                    rawBandCornerPair, normalizeRawBandCorner,
                    bridgePreviousCorner, bridgeNextCorner,
                    cornerSuccessor, hdir]
              · simp [ExplicitNormalBandAdj, CornerCycleAdj,
                  normalTileCorner, normalizedBandPair, rawBandCornerPair,
                  normalizeRawBandCorner, cornerSuccessor, hdir]
              · refine Or.inr ⟨i, true, Or.inr ⟨?_, ?_⟩⟩ <;>
                  simp [normalTileCorner, normalizedBandPair,
                    rawBandCornerPair, normalizeRawBandCorner,
                    bridgePreviousCorner, bridgeNextCorner,
                    cornerSuccessor, hdir]
    · rcases h with ⟨hright, hleft⟩
      rw [hleft, hright]
      cases tile with
      | vertex i =>
          exact Or.inl ⟨rfl, Or.inr rfl⟩
      | midpoint i =>
          cases hdir : steps i with
          | right =>
              fin_cases corner
              · refine Or.inr ⟨i, false, Or.inr ⟨?_, ?_⟩⟩ <;>
                  simp [normalTileCorner, normalizedBandPair,
                    rawBandCornerPair, normalizeRawBandCorner,
                    bridgePreviousCorner, bridgeNextCorner,
                    cornerSuccessor, hdir]
              · simp [ExplicitNormalBandAdj, CornerCycleAdj,
                  normalTileCorner, normalizedBandPair, rawBandCornerPair,
                  normalizeRawBandCorner, cornerSuccessor, hdir]
              · refine Or.inr ⟨i, true, Or.inl ⟨?_, ?_⟩⟩ <;>
                  simp [normalTileCorner, normalizedBandPair,
                    rawBandCornerPair, normalizeRawBandCorner,
                    bridgePreviousCorner, bridgeNextCorner,
                    cornerSuccessor, hdir]
              · simp [ExplicitNormalBandAdj, CornerCycleAdj,
                  normalTileCorner, normalizedBandPair, rawBandCornerPair,
                  normalizeRawBandCorner, cornerSuccessor, hdir]
          | up =>
              fin_cases corner
              · simp [ExplicitNormalBandAdj, CornerCycleAdj,
                  normalTileCorner, normalizedBandPair, rawBandCornerPair,
                  normalizeRawBandCorner, cornerSuccessor, hdir]
              · refine Or.inr ⟨i, false, Or.inr ⟨?_, ?_⟩⟩ <;>
                  simp [normalTileCorner, normalizedBandPair,
                    rawBandCornerPair, normalizeRawBandCorner,
                    bridgePreviousCorner, bridgeNextCorner,
                    cornerSuccessor, hdir]
              · simp [ExplicitNormalBandAdj, CornerCycleAdj,
                  normalTileCorner, normalizedBandPair, rawBandCornerPair,
                  normalizeRawBandCorner, cornerSuccessor, hdir]
              · refine Or.inr ⟨i, true, Or.inl ⟨?_, ?_⟩⟩ <;>
                  simp [normalTileCorner, normalizedBandPair,
                    rawBandCornerPair, normalizeRawBandCorner,
                    bridgePreviousCorner, bridgeNextCorner,
                    cornerSuccessor, hdir]
  · intro h
    rcases h with hsame | hbridge
    · rcases left with ⟨i, leftCorner⟩
      rcases right with ⟨j, rightCorner⟩
      simp only [Prod.fst, Prod.snd, Prod.mk.injEq] at hsame
      rcases hsame with ⟨rfl, hcorner⟩
      rcases hcorner with hcorner | hcorner
      · subst rightCorner
        exact ⟨BandTile.vertex i, leftCorner, Or.inl ⟨rfl, rfl⟩⟩
      · subst leftCorner
        exact ⟨BandTile.vertex i, rightCorner, Or.inr ⟨rfl, rfl⟩⟩
    · rcases hbridge with ⟨i, endpoint, h | h⟩
      · rcases h with ⟨hleft, hright⟩
        rw [hleft, hright]
        cases hdir : steps i <;> cases endpoint
        · exact ⟨BandTile.midpoint i, cornerZero, Or.inl ⟨by
              simp [normalTileCorner, normalizedBandPair, rawBandCornerPair,
                normalizeRawBandCorner, bridgePreviousCorner,
                bridgeNextCorner, hdir], by
              simp [normalTileCorner, normalizedBandPair, rawBandCornerPair,
                normalizeRawBandCorner, bridgePreviousCorner,
                bridgeNextCorner, cornerSuccessor, hdir]⟩⟩
        · exact ⟨BandTile.midpoint i, cornerTwo, Or.inr ⟨by
              simp [normalTileCorner, normalizedBandPair, rawBandCornerPair,
                normalizeRawBandCorner, bridgePreviousCorner,
                bridgeNextCorner, hdir], by
              simp [normalTileCorner, normalizedBandPair, rawBandCornerPair,
                normalizeRawBandCorner, bridgePreviousCorner,
                bridgeNextCorner, cornerSuccessor, hdir]⟩⟩
        · exact ⟨BandTile.midpoint i, cornerOne, Or.inl ⟨by
              simp [normalTileCorner, normalizedBandPair, rawBandCornerPair,
                normalizeRawBandCorner, bridgePreviousCorner,
                bridgeNextCorner, hdir], by
              simp [normalTileCorner, normalizedBandPair, rawBandCornerPair,
                normalizeRawBandCorner, bridgePreviousCorner,
                bridgeNextCorner, cornerSuccessor, hdir]⟩⟩
        · exact ⟨BandTile.midpoint i, cornerThree, Or.inr ⟨by
              simp [normalTileCorner, normalizedBandPair, rawBandCornerPair,
                normalizeRawBandCorner, bridgePreviousCorner,
                bridgeNextCorner, hdir], by
              simp [normalTileCorner, normalizedBandPair, rawBandCornerPair,
                normalizeRawBandCorner, bridgePreviousCorner,
                bridgeNextCorner, cornerSuccessor, hdir]⟩⟩
      · rcases h with ⟨hright, hleft⟩
        rw [hleft, hright]
        cases hdir : steps i <;> cases endpoint
        · exact ⟨BandTile.midpoint i, cornerZero, Or.inr ⟨by
              simp [normalTileCorner, normalizedBandPair, rawBandCornerPair,
                normalizeRawBandCorner, bridgePreviousCorner,
                bridgeNextCorner, hdir], by
              simp [normalTileCorner, normalizedBandPair, rawBandCornerPair,
                normalizeRawBandCorner, bridgePreviousCorner,
                bridgeNextCorner, cornerSuccessor, hdir]⟩⟩
        · exact ⟨BandTile.midpoint i, cornerTwo, Or.inl ⟨by
              simp [normalTileCorner, normalizedBandPair, rawBandCornerPair,
                normalizeRawBandCorner, bridgePreviousCorner,
                bridgeNextCorner, hdir], by
              simp [normalTileCorner, normalizedBandPair, rawBandCornerPair,
                normalizeRawBandCorner, bridgePreviousCorner,
                bridgeNextCorner, cornerSuccessor, hdir]⟩⟩
        · exact ⟨BandTile.midpoint i, cornerOne, Or.inr ⟨by
              simp [normalTileCorner, normalizedBandPair, rawBandCornerPair,
                normalizeRawBandCorner, bridgePreviousCorner,
                bridgeNextCorner, hdir], by
              simp [normalTileCorner, normalizedBandPair, rawBandCornerPair,
                normalizeRawBandCorner, bridgePreviousCorner,
                bridgeNextCorner, cornerSuccessor, hdir]⟩⟩
        · exact ⟨BandTile.midpoint i, cornerThree, Or.inl ⟨by
              simp [normalTileCorner, normalizedBandPair, rawBandCornerPair,
                normalizeRawBandCorner, bridgePreviousCorner,
                bridgeNextCorner, hdir], by
              simp [normalTileCorner, normalizedBandPair, rawBandCornerPair,
                normalizeRawBandCorner, bridgePreviousCorner,
                bridgeNextCorner, cornerSuccessor, hdir]⟩⟩

theorem NormalBandAdj.symm
    {n : Nat} {steps : ZMod n → Direction}
    {left right : NormalBandVertex n}
    (h : NormalBandAdj steps left right) : NormalBandAdj steps right left := by
  rw [normalBandAdj_iff_explicit] at h ⊢
  rcases h with h | ⟨i, endpoint, h | h⟩
  · exact Or.inl ⟨h.1.symm, h.2.symm⟩
  · exact Or.inr ⟨i, endpoint, Or.inr ⟨h.1, h.2⟩⟩
  · exact Or.inr ⟨i, endpoint, Or.inl ⟨h.1, h.2⟩⟩

end LatticePathOrdersKernel
