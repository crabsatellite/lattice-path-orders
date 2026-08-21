import LatticePathOrdersKernel.GraphTable

namespace LatticePathOrdersKernel

theorem mem_tableEdgeSet {table : NeighborTable} {u v : Coord} :
    (u, v) ∈ tableEdgeSet table ↔
      ∃ row ∈ table, row.1 = u ∧ v ∈ row.2 := by
  simp [tableEdgeSet, tableDirectedEdgeList, List.mem_flatMap]

theorem mem_tableEdgeSet_iff_mem_neighbors
    {table : NeighborTable} (hkeys : (tableVertices table).Nodup)
    {u : Coord} (hu : u ∈ tableVertices table) (v : Coord) :
    (u, v) ∈ tableEdgeSet table ↔ v ∈ tableNeighbors table u := by
  induction table with
  | nil => simp [tableVertices] at hu
  | cons row rest ih =>
      rcases row with ⟨key, values⟩
      have hkeys' : key ∉ tableVertices rest ∧
          (tableVertices rest).Nodup := by
        simpa [tableVertices] using hkeys
      have hu' : u = key ∨ u ∈ tableVertices rest := by
        simpa [tableVertices] using hu
      rw [mem_tableEdgeSet]
      rcases hu' with huk | huRest
      · subst u
        simp only [tableNeighbors, if_pos]
        constructor
        · rintro ⟨item, hitem, hfirst, hv⟩
          rcases List.mem_cons.mp hitem with hhead | htail
          · subst item
            exact hv
          · exfalso
            apply hkeys'.1
            exact List.mem_map.mpr ⟨item, htail, hfirst⟩
        · intro hv
          exact ⟨(key, values), by simp, rfl, hv⟩
      · have hne : u ≠ key := by
          intro h
          subst u
          exact hkeys'.1 huRest
        simp only [tableNeighbors, if_neg hne]
        rw [← ih hkeys'.2 huRest]
        rw [mem_tableEdgeSet]
        constructor
        · rintro ⟨item, hitem, hfirst, hv⟩
          rcases List.mem_cons.mp hitem with hhead | htail
          · subst item
            exact (hne hfirst.symm).elim
          · exact ⟨item, htail, hfirst, hv⟩
        · rintro ⟨item, hitem, hfirst, hv⟩
          exact ⟨item, List.mem_cons_of_mem _ hitem, hfirst, hv⟩

theorem mem_tableNeighbors_of_rows
    {table : NeighborTable} {P : Coord → Prop}
    (hrows : ∀ row ∈ table, ∀ v ∈ row.2, P v)
    {u v : Coord} (hv : v ∈ tableNeighbors table u) : P v := by
  induction table with
  | nil => simp [tableNeighbors] at hv
  | cons row rest ih =>
      simp only [tableNeighbors] at hv
      split at hv
      · exact hrows row (by simp) v hv
      · apply ih
        · intro item hitem w hw
          exact hrows item (by simp [hitem]) w hw
        · exact hv

theorem mem_tableNeighbors_mem_vertices
    {table : NeighborTable}
    (hclosed : ∀ row ∈ table, ∀ v ∈ row.2, v ∈ tableVertices table)
    {u v : Coord} (hv : v ∈ tableNeighbors table u) :
    v ∈ tableVertices table :=
  mem_tableNeighbors_of_rows hclosed hv

end LatticePathOrdersKernel
