import LatticePathOrdersKernel.NormalFourCycleDefs

/-! # The integer strip covers the cyclic normal band -/

namespace LatticePathOrdersKernel

open LatticePathOrdersClassical

theorem projectLocalBandAdj
    {n : Nat} {steps : ZMod n → Direction}
    {left right : LocalBandVertex}
    (h : LocalBandAdj (liftNormalDirections steps) left right) :
    NormalBandAdj steps (projectLocalBandVertex n left)
      (projectLocalBandVertex n right) := by
  rw [normalBandAdj_iff_explicit]
  rcases h with hsame | ⟨i, endpoint, h | h⟩
  · exact Or.inl ⟨congrArg (fun value : Int => (value : ZMod n)) hsame.1,
      hsame.2⟩
  · rcases h with ⟨rfl, rfl⟩
    refine Or.inr ⟨(i : ZMod n), endpoint, Or.inl ⟨?_, ?_⟩⟩ <;>
      simp [projectLocalBandVertex, liftNormalDirections]
  · rcases h with ⟨rfl, rfl⟩
    refine Or.inr ⟨(i : ZMod n), endpoint, Or.inr ⟨?_, ?_⟩⟩ <;>
      simp [projectLocalBandVertex, liftNormalDirections]

theorem liftNormalBandAdj
    {n : Nat} {steps : ZMod n → Direction}
    {normalLeft normalRight : NormalBandVertex n}
    {localLeft : LocalBandVertex}
    (hleft : projectLocalBandVertex n localLeft = normalLeft)
    (hadj : NormalBandAdj steps normalLeft normalRight) :
    ∃ localRight,
      projectLocalBandVertex n localRight = normalRight ∧
        LocalBandAdj (liftNormalDirections steps) localLeft localRight := by
  rw [← hleft, normalBandAdj_iff_explicit] at hadj
  rcases localLeft with ⟨leftIndex, leftCorner⟩
  rcases normalRight with ⟨rightIndex, rightCorner⟩
  rcases hadj with hsame | ⟨i, endpoint, h | h⟩
  · rcases hsame with ⟨hindex, hcorner⟩
    refine ⟨(leftIndex, rightCorner), ?_, Or.inl ⟨rfl, hcorner⟩⟩
    exact Prod.ext hindex rfl
  · rcases h with ⟨hsource, htarget⟩
    have hindex : (leftIndex : ZMod n) = i - 1 :=
      congrArg Prod.fst hsource
    have hcorner : leftCorner =
        bridgePreviousCorner (steps i) endpoint :=
      congrArg Prod.snd hsource
    have hnextIndex : ((leftIndex + 1 : Int) : ZMod n) = i := by
      push_cast
      rw [hindex]
      ring
    have hdirection : liftNormalDirections steps (leftIndex + 1) = steps i := by
      unfold liftNormalDirections
      rw [hnextIndex]
    refine ⟨(leftIndex + 1, bridgeNextCorner (steps i) endpoint), ?_, ?_⟩
    · rw [htarget]
      exact Prod.ext hnextIndex rfl
    · refine Or.inr ⟨leftIndex + 1, endpoint, Or.inl ⟨?_, ?_⟩⟩
      · apply Prod.ext
        · simp
        · simpa [hdirection] using hcorner
      · simp [hdirection]
  · rcases h with ⟨htarget, hsource⟩
    have hindex : (leftIndex : ZMod n) = i :=
      congrArg Prod.fst hsource
    have hcorner : leftCorner = bridgeNextCorner (steps i) endpoint :=
      congrArg Prod.snd hsource
    have hpreviousIndex : ((leftIndex - 1 : Int) : ZMod n) = i - 1 := by
      push_cast
      rw [hindex]
    have hdirection : liftNormalDirections steps leftIndex = steps i := by
      unfold liftNormalDirections
      rw [hindex]
    refine ⟨(leftIndex - 1, bridgePreviousCorner (steps i) endpoint), ?_, ?_⟩
    · rw [htarget]
      exact Prod.ext hpreviousIndex rfl
    · refine Or.inr ⟨leftIndex, endpoint, Or.inr ⟨?_, ?_⟩⟩
      · apply Prod.ext
        · rfl
        · simp [hdirection]
      · apply Prod.ext
        · simp
        · simpa [hdirection] using hcorner

end LatticePathOrdersKernel
