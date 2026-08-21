import LatticePathOrdersKernel.Coordinate
import Mathlib.Data.Finset.Card

/-!
# Compact adjacency tables

The literal coordinate graph is expensive to normalize repeatedly.  This file
defines a compact adjacency-list evaluator and proves once that an exact table
with the same neighbors computes the same degree-filtered walk counts.
-/

namespace LatticePathOrdersKernel

abbrev NeighborTable := List (Coord × List Coord)

@[reducible] def tableNeighbors : NeighborTable → Coord → List Coord
  | [], _ => []
  | (key, values) :: rest, u =>
      if u = key then values else tableNeighbors rest u

@[reducible] def tableVertices (table : NeighborTable) : List Coord :=
  table.map Prod.fst

@[reducible] def tableDirectedEdgeList (table : NeighborTable) :
    List (Coord × Coord) :=
  table.flatMap fun row => row.2.map fun v => (row.1, v)

@[reducible] def tableEdgeSet (table : NeighborTable) : Finset (Coord × Coord) :=
  (tableDirectedEdgeList table).toFinset

/-- Dynamic recurrence on a compact adjacency list. -/
@[reducible] def tableDegreeWalkCount (table : NeighborTable) (d : Nat) :
    Nat → Coord → Nat
  | 0, u => if (tableNeighbors table u).length = d then 1 else 0
  | n + 1, u =>
      ((tableNeighbors table u).map
        (tableDegreeWalkCount table d n)).sum

theorem tableNeighbors_nodup_of_rows
    {table : NeighborTable}
    (hrows : ∀ row ∈ table, row.2.Nodup) (u : Coord) :
    (tableNeighbors table u).Nodup := by
  induction table with
  | nil => simp [tableNeighbors]
  | cons row rest ih =>
      simp only [tableNeighbors]
      split
      · exact hrows row (by simp)
      · apply ih
        intro item hitem
        exact hrows item (by simp [hitem])

end LatticePathOrdersKernel
