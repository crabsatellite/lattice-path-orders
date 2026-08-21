import LatticePathOrdersKernel.NormalTileSharedEdgeForward

namespace LatticePathOrdersKernel

open LatticePathOrdersClassical

theorem tileCycleAdj_of_vertex_sharesEdge
    {n : Nat} (steps : ZMod n → Direction) (i : ZMod n)
    (right : BandTile n)
    (h : TilesShareEdge steps (.vertex i) right) :
    TileCycleAdj (.vertex i) right := by
  rcases h with ⟨hne, first, second, hfirstSecond,
    hfirstLeft, hfirstRight, hsecondLeft, hsecondRight⟩
  have hleftIndex := normalTileVertex_index_mem hfirstLeft
  have hrightIndex := normalTileVertex_index_mem hfirstRight
  have hfirstIndex : first.1 = i := by
    simpa [normalTileIndexSet_vertex] using hleftIndex
  cases right with
  | vertex j =>
      have hrightIndex' : first.1 = j := by
        simpa [normalTileIndexSet_vertex] using hrightIndex
      have hij : i = j := hfirstIndex.symm.trans hrightIndex'
      exact False.elim (hne (congrArg BandTile.vertex hij))
  | midpoint j =>
      have hcases : first.1 = j - 1 ∨ first.1 = j := by
        simpa [normalTileIndexSet_midpoint] using hrightIndex
      rcases hcases with hcase | hcase
      · left
        simp [TileCycleAdj, BandTile.successor]
        calc j = (j - 1) + 1 := by ring
          _ = i + 1 := by rw [← hcase, hfirstIndex]
      · right
        simp [TileCycleAdj, BandTile.successor, ← hcase, hfirstIndex]

end LatticePathOrdersKernel
