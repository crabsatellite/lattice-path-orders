import LatticePathOrdersKernel.SharedEdgeFromMidpoint

namespace LatticePathOrdersKernel

open LatticePathOrdersClassical

theorem tilesShareEdge_iff_tileCycleAdj
    {n : Nat} (hn : 5 ≤ n) (steps : ZMod n → Direction)
    (left right : BandTile n) :
    TilesShareEdge steps left right ↔ TileCycleAdj left right := by
  letI : Fact (1 < n) := ⟨by omega⟩
  constructor
  · intro h
    cases left with
    | vertex i => exact tileCycleAdj_of_vertex_sharesEdge steps i right h
    | midpoint i => exact tileCycleAdj_of_midpoint_sharesEdge hn steps i right h
  · intro h
    rcases h with rfl | h
    · exact tilesShareEdge_of_successor steps left
    · rw [h]
      exact (tilesShareEdge_of_successor steps right).symm

end LatticePathOrdersKernel
