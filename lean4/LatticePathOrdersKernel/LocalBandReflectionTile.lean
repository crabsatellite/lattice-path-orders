import LatticePathOrdersKernel.LocalBandReflectionEdge

namespace LatticePathOrdersKernel

open LatticePathOrdersClassical

theorem reflectLocalTileCorner
    (directions : Int → Direction) (tile : LocalBandTile)
    (corner : CornerIndex) :
    reflectLocalBandVertex (localTileCorner directions tile corner) =
      localTileCorner (reflectLocalDirections directions)
        (reflectLocalBandTile tile) (cornerHalfTurn corner) := by
  cases tile with
  | vertex i => simp [reflectLocalBandVertex, reflectLocalBandTile,
      localTileCorner]
  | midpoint i =>
      cases hdir : directions i <;> fin_cases corner <;>
        simp [reflectLocalBandVertex, reflectLocalBandTile,
          localTileCorner, reflectLocalDirections, cornerHalfTurn, hdir] <;>
        ring

theorem image_reflect_localTileVertexSet
    (directions : Int → Direction) (tile : LocalBandTile) :
    (localTileVertexSet directions tile).image reflectLocalBandVertex =
      localTileVertexSet (reflectLocalDirections directions)
        (reflectLocalBandTile tile) := by
  apply Finset.ext
  intro vertex
  constructor
  · intro hvertex
    rcases Finset.mem_image.mp hvertex with ⟨oldVertex, holdVertex, rfl⟩
    rcases Finset.mem_image.mp holdVertex with ⟨corner, _, rfl⟩
    apply Finset.mem_image.mpr
    refine ⟨cornerHalfTurn corner, Finset.mem_univ _, ?_⟩
    exact (reflectLocalTileCorner directions tile corner).symm
  · intro hvertex
    rcases Finset.mem_image.mp hvertex with ⟨corner, _, rfl⟩
    apply Finset.mem_image.mpr
    refine ⟨localTileCorner directions tile (cornerHalfTurn corner),
      localTileCorner_mem directions tile (cornerHalfTurn corner), ?_⟩
    rw [reflectLocalTileCorner, cornerHalfTurn_involution]

theorem image_reflect_fourVertexSet
    (v₀ v₁ v₂ v₃ : LocalBandVertex) :
    (fourVertexSet v₀ v₁ v₂ v₃).image reflectLocalBandVertex =
      fourVertexSet (reflectLocalBandVertex v₀) (reflectLocalBandVertex v₁)
        (reflectLocalBandVertex v₂) (reflectLocalBandVertex v₃) := by
  simp [fourVertexSet]

theorem reflect_isLocalTileFourCycle
    {directions : Int → Direction}
    {v₀ v₁ v₂ v₃ : LocalBandVertex}
    (h : IsLocalTileFourCycle directions v₀ v₁ v₂ v₃) :
    IsLocalTileFourCycle (reflectLocalDirections directions)
      (reflectLocalBandVertex v₀) (reflectLocalBandVertex v₁)
      (reflectLocalBandVertex v₂) (reflectLocalBandVertex v₃) := by
  rcases h with ⟨tile, htile⟩
  refine ⟨reflectLocalBandTile tile, ?_⟩
  have himage := congrArg (Finset.image reflectLocalBandVertex) htile
  rw [image_reflect_fourVertexSet,
    image_reflect_localTileVertexSet] at himage
  exact himage

theorem isLocalTileFourCycle_reflect_iff
    (directions : Int → Direction)
    (v₀ v₁ v₂ v₃ : LocalBandVertex) :
    IsLocalTileFourCycle (reflectLocalDirections directions)
        (reflectLocalBandVertex v₀) (reflectLocalBandVertex v₁)
        (reflectLocalBandVertex v₂) (reflectLocalBandVertex v₃) ↔
      IsLocalTileFourCycle directions v₀ v₁ v₂ v₃ := by
  constructor
  · intro h
    have hreflect := reflect_isLocalTileFourCycle h
    simpa using hreflect
  · exact reflect_isLocalTileFourCycle

end LatticePathOrdersKernel
