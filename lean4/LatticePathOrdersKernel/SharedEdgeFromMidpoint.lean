import LatticePathOrdersKernel.SharedEdgeFromVertex

namespace LatticePathOrdersKernel

open LatticePathOrdersClassical

theorem TileCycleAdj.symm
    {n : Nat} {left right : BandTile n} (h : TileCycleAdj left right) :
    TileCycleAdj right left := by
  rcases h with h | h
  · exact Or.inr h
  · exact Or.inl h

theorem tileCycleAdj_of_midpoint_sharesEdge
    {n : Nat} (hn : 5 ≤ n) (steps : ZMod n → Direction) (i : ZMod n)
    (right : BandTile n)
    (h : TilesShareEdge steps (.midpoint i) right) :
    TileCycleAdj (.midpoint i) right := by
  cases right with
  | vertex j =>
      exact (tileCycleAdj_of_vertex_sharesEdge steps j (.midpoint i) h.symm).symm
  | midpoint j =>
      rcases h with ⟨hne, first, second, hfirstSecond,
        hfirstLeft, hfirstRight, hsecondLeft, hsecondRight⟩
      have hleftIndex := normalTileVertex_index_mem hfirstLeft
      have hrightIndex := normalTileVertex_index_mem hfirstRight
      have hi : first.1 = i - 1 ∨ first.1 = i := by
        simpa [normalTileIndexSet_midpoint] using hleftIndex
      have hj : first.1 = j - 1 ∨ first.1 = j := by
        simpa [normalTileIndexSet_midpoint] using hrightIndex
      rcases hi with hi | hi <;> rcases hj with hj | hj
      · have hij : i = j := by
          calc i = (i - 1) + 1 := by ring
            _ = (j - 1) + 1 := by rw [← hi, ← hj]
            _ = j := by ring
        exact False.elim (hne (congrArg BandTile.midpoint hij))
      · have hji : j = i - 1 := hj.symm.trans hi
        have hsucc : j + 1 = i := by rw [hji]; ring
        have heq := midpoint_successor_common_unique hn steps j
          hfirstRight (by simpa [hsucc] using hfirstLeft)
          hsecondRight (by simpa [hsucc] using hsecondLeft)
        exact False.elim (hfirstSecond heq)
      · have hji : j = i + 1 := by
          calc j = (j - 1) + 1 := by ring
            _ = i + 1 := by rw [← hj, hi]
        have heq := midpoint_successor_common_unique hn steps i
          hfirstLeft (by simpa [hji] using hfirstRight)
          hsecondLeft (by simpa [hji] using hsecondRight)
        exact False.elim (hfirstSecond heq)
      · have hij : i = j := hi.symm.trans hj
        exact False.elim (hne (congrArg BandTile.midpoint hij))

end LatticePathOrdersKernel
