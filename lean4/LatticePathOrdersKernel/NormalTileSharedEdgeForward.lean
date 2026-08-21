import LatticePathOrdersKernel.MidpointCommonUnique

namespace LatticePathOrdersKernel

open LatticePathOrdersClassical

def TilesShareEdge {n : Nat} (steps : ZMod n → Direction)
    (left right : BandTile n) : Prop :=
  left ≠ right ∧ ∃ first second,
    first ≠ second ∧
    first ∈ normalTileVertexSet steps left ∧
    first ∈ normalTileVertexSet steps right ∧
    second ∈ normalTileVertexSet steps left ∧
    second ∈ normalTileVertexSet steps right

def TileCycleAdj {n : Nat} (left right : BandTile n) : Prop :=
  right = left.successor ∨ left = right.successor

theorem normalTileVertex_index_mem
    {n : Nat} {steps : ZMod n → Direction} {tile : BandTile n}
    {vertex : NormalBandVertex n}
    (h : vertex ∈ normalTileVertexSet steps tile) :
    vertex.1 ∈ normalTileIndexSet steps tile :=
  Finset.mem_image.mpr ⟨vertex, h, rfl⟩

theorem tilesShareEdge_of_successor
    {n : Nat} [Fact (1 < n)] (steps : ZMod n → Direction)
    (tile : BandTile n) : TilesShareEdge steps tile tile.successor := by
  cases tile with
  | midpoint i =>
      refine ⟨by simp [BandTile.successor], ?_⟩
      cases hdir : steps i
      · refine ⟨(i, cornerZero), (i, cornerThree), by simp,
          ?_, ?_, ?_, ?_⟩ <;>
          simp [BandTile.successor, normalTileVertexSet_vertex_formula,
            normalTileVertexSet_midpoint_right steps i hdir]
      · refine ⟨(i, cornerOne), (i, cornerZero), by simp,
          ?_, ?_, ?_, ?_⟩ <;>
          simp [BandTile.successor, normalTileVertexSet_vertex_formula,
            normalTileVertexSet_midpoint_up steps i hdir]
  | vertex i =>
      refine ⟨by simp [BandTile.successor], ?_⟩
      cases hdir : steps (i + 1)
      · refine ⟨(i, cornerOne), (i, cornerTwo), by simp,
          ?_, ?_, ?_, ?_⟩ <;>
          simp [BandTile.successor, normalTileVertexSet_vertex_formula,
            normalTileVertexSet_midpoint_right steps (i + 1) hdir]
      · refine ⟨(i, cornerThree), (i, cornerTwo), by simp,
          ?_, ?_, ?_, ?_⟩ <;>
          simp [BandTile.successor, normalTileVertexSet_vertex_formula,
            normalTileVertexSet_midpoint_up steps (i + 1) hdir]

theorem TilesShareEdge.symm
    {n : Nat} {steps : ZMod n → Direction} {left right : BandTile n}
    (h : TilesShareEdge steps left right) : TilesShareEdge steps right left := by
  rcases h with ⟨hne, first, second, hfs, hfl, hfr, hsl, hsr⟩
  exact ⟨hne.symm, first, second, hfs, hfr, hfl, hsr, hsl⟩

end LatticePathOrdersKernel
