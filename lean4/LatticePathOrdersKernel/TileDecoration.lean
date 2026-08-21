import LatticePathOrdersKernel.TileCycleAutomorphism
import LatticePathOrdersKernel.NormalTileSets

namespace LatticePathOrdersKernel

open LatticePathOrdersClassical

/-- Intrinsic version of the paper's assertion that the two edges shared by a
tile and its two neighbors in the tile cycle are adjacent.  The witness is the
common endpoint of those two shared edges. -/
def TileHasAdjacentSharedEdges {n : Nat}
    (steps : ZMod n → Direction) (tile : BandTile n) : Prop :=
  ∃ vertex : NormalBandVertex n,
    vertex ∈ normalTileVertexSet steps (tilePredecessor tile) ∧
    vertex ∈ normalTileVertexSet steps tile ∧
    vertex ∈ normalTileVertexSet steps tile.successor

theorem normalTileVertex_fst_of_mem
    {n : Nat} (steps : ZMod n → Direction) (i : ZMod n)
    {vertex : NormalBandVertex n}
    (hvertex : vertex ∈ normalTileVertexSet steps (.vertex i)) :
    vertex.1 = i := by
  rw [normalTileVertexSet_vertex_formula] at hvertex
  simp only [Finset.mem_insert, Finset.mem_singleton] at hvertex
  rcases hvertex with rfl | rfl | rfl | rfl <;> rfl

theorem midpoint_tile_has_no_adjacent_shared_edges
    {n : Nat} [Fact (1 < n)] (steps : ZMod n → Direction) (i : ZMod n) :
    ¬ TileHasAdjacentSharedEdges steps (.midpoint i) := by
  rintro ⟨vertex, hprevious, _, hnext⟩
  have hpreviousIndex := normalTileVertex_fst_of_mem steps (i - 1) hprevious
  have hnextIndex := normalTileVertex_fst_of_mem steps i hnext
  exact zmod_sub_one_ne_self i (hpreviousIndex.symm.trans hnextIndex)

theorem vertex_tile_has_adjacent_shared_edges_iff
    {n : Nat} [Fact (1 < n)] (steps : ZMod n → Direction) (i : ZMod n) :
    TileHasAdjacentSharedEdges steps (.vertex i) ↔
      steps i ≠ steps (i + 1) := by
  cases hcurrent : steps i <;> cases hnext : steps (i + 1) <;>
    simp [TileHasAdjacentSharedEdges, tilePredecessor, BandTile.successor,
      normalTileVertexSet_vertex_formula,
      normalTileVertexSet_midpoint_right, normalTileVertexSet_midpoint_up,
      hcurrent, hnext]

end LatticePathOrdersKernel
