import LatticePathOrdersKernel.LocalNeighborSlots

namespace LatticePathOrdersKernel
open LatticePathOrdersClassical
set_option maxHeartbeats 1000000
set_option maxRecDepth 4000

theorem local_simple_four_cycle_is_tile_case1
    (directions : Int → Direction) (i₀ : Int)
    (v₁ v₂ v₃ : LocalBandVertex)
    (hcycle : LocalSimpleFourCycle directions
      (i₀, cornerOne) v₁ v₂ v₃) :
    IsLocalTileFourCycle directions (i₀, cornerOne) v₁ v₂ v₃ := by
  rcases hcycle with
    ⟨h₀₁, h₀₂, h₀₃, h₁₂, h₁₃, h₂₃, e₀₁, e₁₂, e₂₃, e₃₀⟩
  obtain ⟨slot₀₁, hs₀₁⟩ := exists_localBandNeighborAt_of_adj directions e₀₁
  obtain ⟨slot₀₃, hs₀₃⟩ :=
    exists_localBandNeighborAt_of_adj directions e₃₀.symm
  fin_cases slot₀₁ <;> fin_cases slot₀₃ <;>
    simp [localBandNeighborAt] at hs₀₁ hs₀₃
  all_goals subst v₁
  all_goals subst v₃
  all_goals obtain ⟨slot₁₂, hs₁₂⟩ :=
    exists_localBandNeighborAt_of_adj directions e₁₂
  all_goals obtain ⟨slot₃₂, hs₃₂⟩ :=
    exists_localBandNeighborAt_of_adj directions e₂₃.symm
  all_goals fin_cases slot₁₂ <;> fin_cases slot₃₂
  all_goals cases hprevious : directions (i₀ - 1) <;>
    cases hcurrent : directions i₀ <;>
    cases hnext : directions (i₀ + 1) <;>
    simp [localBandNeighborAt, hprevious, hcurrent, hnext] at hs₁₂ hs₃₂
  all_goals subst v₂
  all_goals simp at hs₃₂
  all_goals (simp [hprevious, hcurrent, hnext] at h₀₁ h₀₂ h₀₃ h₁₂ h₁₃ h₂₃)
  all_goals (try omega)
  all_goals first
    | simpa [localTileCorner, hcurrent, hnext, cornerZero, cornerOne,
        cornerTwo, cornerThree] using
        (localTile_is_four_cycle_rotate_one directions (.vertex i₀))
    | simpa [localTileCorner, hcurrent, hnext, cornerZero, cornerOne,
        cornerTwo, cornerThree] using
        (localTile_is_four_cycle_rotate_one_reverse directions (.vertex i₀))
    | simpa [localTileCorner, hcurrent, hnext, cornerZero, cornerOne,
        cornerTwo, cornerThree] using
        (localTile_is_four_cycle_rotate_two directions (.midpoint i₀))
    | simpa [localTileCorner, hcurrent, hnext, cornerZero, cornerOne,
        cornerTwo, cornerThree] using
        (localTile_is_four_cycle_rotate_two_reverse directions (.midpoint i₀))
    | simpa [localTileCorner, hcurrent, hnext, cornerZero, cornerOne,
        cornerTwo, cornerThree] using
        (localTile_is_four_cycle directions (.midpoint (i₀ + 1)))
    | simpa [localTileCorner, hcurrent, hnext, cornerZero, cornerOne,
        cornerTwo, cornerThree] using
        (localTile_is_four_cycle_reverse directions (.midpoint (i₀ + 1)))
    | omega

end LatticePathOrdersKernel
