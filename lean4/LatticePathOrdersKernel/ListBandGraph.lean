import LatticePathOrdersKernel.GraphTableEdges
import LatticePathOrdersKernel.LiteralBandGraph

/-!
# Literal adjacency-list band graphs

This is an efficient presentation of the same unlabelled graph: collect the
endpoints of the square sides, and for every endpoint collect all opposite
endpoints of incident sides.  Duplicate vertices and duplicate neighbors are
removed without changing adjacency.
-/

namespace LatticePathOrdersKernel

open LatticePathOrders

@[reducible] def edgeVertices (edges : List (Coord × Coord)) : List Coord :=
  (edges.flatMap fun edge => [edge.1, edge.2]).eraseDups

@[reducible] def edgeNeighbors (edges : List (Coord × Coord))
    (u : Coord) : List Coord :=
  (edges.filterMap fun edge =>
    if u = edge.1 then some edge.2
    else if u = edge.2 then some edge.1
    else none).eraseDups

@[reducible] def neighborTableOfEdges
    (edges : List (Coord × Coord)) : NeighborTable :=
  (edgeVertices edges).map fun u => (u, edgeNeighbors edges u)

/-- The actual unlabelled band graph obtained from Definition 4.1. -/
@[reducible] def literalBandTable (w : Path) : NeighborTable :=
  neighborTableOfEdges (gluedBandEdges w)

def ValidNeighborTable (table : NeighborTable) : Prop :=
  (tableVertices table).Nodup ∧
  table.Forall fun row => row.2.Nodup ∧
    row.2.Forall fun v => v ∈ tableVertices table

instance validNeighborTableDecidable (table : NeighborTable) :
    Decidable (ValidNeighborTable table) := by
  unfold ValidNeighborTable
  infer_instance

theorem valid_neighbor_nodup {table : NeighborTable}
    (h : ValidNeighborTable table) (u : Coord) :
    (tableNeighbors table u).Nodup :=
  tableNeighbors_nodup_of_rows (fun row hrow =>
    (List.forall_iff_forall_mem.mp h.2 row hrow).1) u

theorem valid_neighbor_closed {table : NeighborTable}
    (h : ValidNeighborTable table) {u v : Coord}
    (hv : v ∈ tableNeighbors table u) :
    v ∈ tableVertices table := by
  apply mem_tableNeighbors_of_rows (P := fun v => v ∈ tableVertices table)
    (fun row hrow v hv =>
      List.forall_iff_forall_mem.mp
        (List.forall_iff_forall_mem.mp h.2 row hrow).2 v hv)
  exact hv

end LatticePathOrdersKernel
