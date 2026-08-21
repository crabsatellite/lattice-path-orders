import LatticePathOrdersKernel.NormalTileSharedEdge

namespace LatticePathOrdersKernel

open LatticePathOrdersClassical

theorem NormalBandGraphIso.mem_tileMap_iff
    {n : Nat} (hn : 5 ≤ n) {left right : ZMod n → Direction}
    (iso : NormalBandGraphIso left right) (tile : BandTile n)
    (vertex : NormalBandVertex n) :
    iso.vertexEquiv vertex ∈ normalTileVertexSet right (iso.tileMap hn tile) ↔
      vertex ∈ normalTileVertexSet left tile := by
  rw [← iso.tileMap_spec hn]
  constructor
  · intro h
    rcases Finset.mem_image.mp h with ⟨source, hsource, heq⟩
    have : source = vertex := iso.vertexEquiv.injective heq
    simpa [this] using hsource
  · intro h
    exact Finset.mem_image.mpr ⟨vertex, h, rfl⟩

theorem NormalBandGraphIso.tilesShareEdge_iff
    {n : Nat} (hn : 5 ≤ n) {left right : ZMod n → Direction}
    (iso : NormalBandGraphIso left right) (tile₁ tile₂ : BandTile n) :
    TilesShareEdge right (iso.tileMap hn tile₁) (iso.tileMap hn tile₂) ↔
      TilesShareEdge left tile₁ tile₂ := by
  constructor
  · rintro ⟨hne, first, second, hfirstSecond,
      hfirst₁, hfirst₂, hsecond₁, hsecond₂⟩
    let sourceFirst := iso.vertexEquiv.symm first
    let sourceSecond := iso.vertexEquiv.symm second
    have hsourceFirstNe : sourceFirst ≠ sourceSecond := by
      intro h
      apply hfirstSecond
      have := congrArg iso.vertexEquiv h
      simpa [sourceFirst, sourceSecond] using this
    refine ⟨fun h => hne (congrArg (iso.tileMap hn) h),
      sourceFirst, sourceSecond, hsourceFirstNe, ?_, ?_, ?_, ?_⟩
    · have := (iso.mem_tileMap_iff hn tile₁ sourceFirst).mp (by
          simpa [sourceFirst] using hfirst₁)
      exact this
    · exact (iso.mem_tileMap_iff hn tile₂ sourceFirst).mp (by
        simpa [sourceFirst] using hfirst₂)
    · exact (iso.mem_tileMap_iff hn tile₁ sourceSecond).mp (by
        simpa [sourceSecond] using hsecond₁)
    · exact (iso.mem_tileMap_iff hn tile₂ sourceSecond).mp (by
        simpa [sourceSecond] using hsecond₂)
  · rintro ⟨hne, first, second, hfirstSecond,
      hfirst₁, hfirst₂, hsecond₁, hsecond₂⟩
    refine ⟨fun heq => hne (iso.tileMap_injective hn heq),
      iso.vertexEquiv first, iso.vertexEquiv second,
      fun h => hfirstSecond (iso.vertexEquiv.injective h), ?_, ?_, ?_, ?_⟩
    · exact (iso.mem_tileMap_iff hn tile₁ first).mpr hfirst₁
    · exact (iso.mem_tileMap_iff hn tile₂ first).mpr hfirst₂
    · exact (iso.mem_tileMap_iff hn tile₁ second).mpr hsecond₁
    · exact (iso.mem_tileMap_iff hn tile₂ second).mpr hsecond₂

theorem NormalBandGraphIso.tileMap_cycleAdj_iff
    {n : Nat} (hn : 5 ≤ n) {left right : ZMod n → Direction}
    (iso : NormalBandGraphIso left right) (tile₁ tile₂ : BandTile n) :
    TileCycleAdj (iso.tileMap hn tile₁) (iso.tileMap hn tile₂) ↔
      TileCycleAdj tile₁ tile₂ := by
  rw [← tilesShareEdge_iff_tileCycleAdj hn right,
    iso.tilesShareEdge_iff hn, tilesShareEdge_iff_tileCycleAdj hn left]

end LatticePathOrdersKernel
