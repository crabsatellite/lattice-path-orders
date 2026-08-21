import LatticePathOrdersKernel.LocalFourCycleCase0
import LatticePathOrdersKernel.LocalFourCycleCase1
import LatticePathOrdersKernel.LocalBandReflectionTile

/-! # Four-cycles in the integer square-band strip -/

namespace LatticePathOrdersKernel

open LatticePathOrdersClassical

theorem reflectLocalSimpleFourCycle
    {directions : Int → Direction}
    {v₀ v₁ v₂ v₃ : LocalBandVertex}
    (h : LocalSimpleFourCycle directions v₀ v₁ v₂ v₃) :
    LocalSimpleFourCycle (reflectLocalDirections directions)
      (reflectLocalBandVertex v₀) (reflectLocalBandVertex v₁)
      (reflectLocalBandVertex v₂) (reflectLocalBandVertex v₃) := by
  rcases h with ⟨h₀₁, h₀₂, h₀₃, h₁₂, h₁₃, h₂₃,
    e₀₁, e₁₂, e₂₃, e₃₀⟩
  exact ⟨fun heq => h₀₁ (reflectLocalBandVertex_injective heq),
    fun heq => h₀₂ (reflectLocalBandVertex_injective heq),
    fun heq => h₀₃ (reflectLocalBandVertex_injective heq),
    fun heq => h₁₂ (reflectLocalBandVertex_injective heq),
    fun heq => h₁₃ (reflectLocalBandVertex_injective heq),
    fun heq => h₂₃ (reflectLocalBandVertex_injective heq),
    reflectLocalBandAdj e₀₁, reflectLocalBandAdj e₁₂,
    reflectLocalBandAdj e₂₃, reflectLocalBandAdj e₃₀⟩

/-- Every simple four-cycle in an unglued width-one square strip is one of
its constituent tiles. -/
theorem local_simple_four_cycle_is_tile
    (directions : Int → Direction)
    (v₀ v₁ v₂ v₃ : LocalBandVertex)
    (hcycle : LocalSimpleFourCycle directions v₀ v₁ v₂ v₃) :
    IsLocalTileFourCycle directions v₀ v₁ v₂ v₃ := by
  rcases v₀ with ⟨i₀, corner⟩
  fin_cases corner
  · exact local_simple_four_cycle_is_tile_case0 directions i₀ v₁ v₂ v₃ hcycle
  · exact local_simple_four_cycle_is_tile_case1 directions i₀ v₁ v₂ v₃ hcycle
  · have hreflect := reflectLocalSimpleFourCycle hcycle
    have htile := local_simple_four_cycle_is_tile_case0
      (reflectLocalDirections directions) (-i₀)
      (reflectLocalBandVertex v₁) (reflectLocalBandVertex v₂)
      (reflectLocalBandVertex v₃) (by
        simpa [reflectLocalBandVertex, cornerHalfTurn] using hreflect)
    exact (isLocalTileFourCycle_reflect_iff directions
      (i₀, cornerTwo) v₁ v₂ v₃).mp htile
  · have hreflect := reflectLocalSimpleFourCycle hcycle
    have htile := local_simple_four_cycle_is_tile_case1
      (reflectLocalDirections directions) (-i₀)
      (reflectLocalBandVertex v₁) (reflectLocalBandVertex v₂)
      (reflectLocalBandVertex v₃) (by
        simpa [reflectLocalBandVertex, cornerHalfTurn] using hreflect)
    exact (isLocalTileFourCycle_reflect_iff directions
      (i₀, cornerThree) v₁ v₂ v₃).mp htile

end LatticePathOrdersKernel
