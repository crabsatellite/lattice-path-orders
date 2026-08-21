import LatticePathOrdersKernel.TileDecoration

namespace LatticePathOrdersKernel

open LatticePathOrdersClassical

theorem tilePredecessor_ne_successor
    {n : Nat} [Fact (1 < n)] (tile : BandTile n) :
    tilePredecessor tile ≠ tile.successor := by
  intro h
  apply tileForward_two_ne 0 tile
  have := congrArg BandTile.successor h
  simpa using this.symm

theorem tileCycle_two_neighbors
    {n : Nat} [Fact (1 < n)] {center left right : BandTile n}
    (hleft : TileCycleAdj center left)
    (hright : TileCycleAdj center right) (hne : left ≠ right) :
    (left = tilePredecessor center ∧ right = center.successor) ∨
      (left = center.successor ∧ right = tilePredecessor center) := by
  have classify (tile : BandTile n) (h : TileCycleAdj center tile) :
      tile = center.successor ∨ tile = tilePredecessor center := by
    rcases h with h | h
    · exact Or.inl h
    · right
      apply BandTile.successor_injective
      exact h.symm.trans (tileSuccessor_predecessor center).symm
  rcases classify left hleft with hleft | hleft <;>
    rcases classify right hright with hright | hright
  · exact False.elim (hne (hleft.trans hright.symm))
  · exact Or.inr ⟨hleft, hright⟩
  · exact Or.inl ⟨hleft, hright⟩
  · exact False.elim (hne (hleft.trans hright.symm))

theorem NormalBandGraphIso.tileMap_neighbor_pair
    {n : Nat} (hn : 5 ≤ n) {left right : ZMod n → Direction}
    (iso : NormalBandGraphIso left right) (tile : BandTile n) :
    (iso.tileMap hn (tilePredecessor tile) =
        tilePredecessor (iso.tileMap hn tile) ∧
      iso.tileMap hn tile.successor = (iso.tileMap hn tile).successor) ∨
    (iso.tileMap hn (tilePredecessor tile) =
        (iso.tileMap hn tile).successor ∧
      iso.tileMap hn tile.successor = tilePredecessor (iso.tileMap hn tile)) := by
  letI : Fact (1 < n) := ⟨by omega⟩
  have hpreviousSource : TileCycleAdj (tilePredecessor tile) tile :=
    Or.inl (tileSuccessor_predecessor tile).symm
  have hnextSource : TileCycleAdj tile tile.successor := Or.inl rfl
  have hprevious : TileCycleAdj (iso.tileMap hn tile)
      (iso.tileMap hn (tilePredecessor tile)) :=
    ((iso.tileMap_cycleAdj_iff hn _ _).mpr hpreviousSource).symm
  have hnext : TileCycleAdj (iso.tileMap hn tile)
      (iso.tileMap hn tile.successor) :=
    (iso.tileMap_cycleAdj_iff hn _ _).mpr hnextSource
  exact tileCycle_two_neighbors hprevious hnext
    (fun h => tilePredecessor_ne_successor tile
      (iso.tileMap_injective hn h))

theorem NormalBandGraphIso.tile_has_adjacent_shared_edges_iff
    {n : Nat} (hn : 5 ≤ n) {left right : ZMod n → Direction}
    (iso : NormalBandGraphIso left right) (tile : BandTile n) :
    TileHasAdjacentSharedEdges right (iso.tileMap hn tile) ↔
      TileHasAdjacentSharedEdges left tile := by
  letI : Fact (1 < n) := ⟨by omega⟩
  have hpair := iso.tileMap_neighbor_pair hn tile
  constructor
  · rintro ⟨targetVertex, htargetPrevious, htargetCurrent, htargetNext⟩
    let sourceVertex := iso.vertexEquiv.symm targetVertex
    have hsourceCurrent : sourceVertex ∈ normalTileVertexSet left tile :=
      (iso.mem_tileMap_iff hn tile sourceVertex).mp (by
        simpa [sourceVertex] using htargetCurrent)
    have hmappedPrevious : targetVertex ∈
        normalTileVertexSet right (iso.tileMap hn (tilePredecessor tile)) := by
      rcases hpair with hpair | hpair
      · simpa [hpair.1] using htargetPrevious
      · simpa [hpair.1] using htargetNext
    have hmappedNext : targetVertex ∈
        normalTileVertexSet right (iso.tileMap hn tile.successor) := by
      rcases hpair with hpair | hpair
      · simpa [hpair.2] using htargetNext
      · simpa [hpair.2] using htargetPrevious
    exact ⟨sourceVertex,
      (iso.mem_tileMap_iff hn (tilePredecessor tile) sourceVertex).mp (by
        simpa [sourceVertex] using hmappedPrevious),
      hsourceCurrent,
      (iso.mem_tileMap_iff hn tile.successor sourceVertex).mp (by
        simpa [sourceVertex] using hmappedNext)⟩
  · rintro ⟨sourceVertex, hsourcePrevious, hsourceCurrent, hsourceNext⟩
    have hmappedPrevious :=
      (iso.mem_tileMap_iff hn (tilePredecessor tile) sourceVertex).mpr
        hsourcePrevious
    have hmappedCurrent :=
      (iso.mem_tileMap_iff hn tile sourceVertex).mpr hsourceCurrent
    have hmappedNext :=
      (iso.mem_tileMap_iff hn tile.successor sourceVertex).mpr hsourceNext
    refine ⟨iso.vertexEquiv sourceVertex, ?_, hmappedCurrent, ?_⟩
    · rcases hpair with hpair | hpair
      · simpa [← hpair.1] using hmappedPrevious
      · simpa [← hpair.2] using hmappedNext
    · rcases hpair with hpair | hpair
      · simpa [← hpair.2] using hmappedNext
      · simpa [← hpair.1] using hmappedPrevious

end LatticePathOrdersKernel
