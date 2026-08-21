import LatticePathOrdersKernel.ListBandGraph
import LatticePathOrdersKernel.GraphTableEdges

/-!
# Isomorphisms and walk invariants for adjacency-list graphs
-/

namespace LatticePathOrdersKernel

structure NeighborTableIso (left right : NeighborTable) where
  toFun : Coord → Coord
  invFun : Coord → Coord
  map_vertex : ∀ u ∈ tableVertices left, toFun u ∈ tableVertices right
  inv_vertex : ∀ v ∈ tableVertices right, invFun v ∈ tableVertices left
  left_inv : ∀ u ∈ tableVertices left, invFun (toFun u) = u
  right_inv : ∀ v ∈ tableVertices right, toFun (invFun v) = v
  map_neighbors : ∀ u ∈ tableVertices left,
    ((tableNeighbors left u).map toFun).Perm
      (tableNeighbors right (toFun u))
  inv_neighbors : ∀ v ∈ tableVertices right,
    ((tableNeighbors right v).map invFun).Perm
      (tableNeighbors left (invFun v))

namespace NeighborTableIso

variable {left right : NeighborTable}

def symm (e : NeighborTableIso left right) :
    NeighborTableIso right left where
  toFun := e.invFun
  invFun := e.toFun
  map_vertex := e.inv_vertex
  inv_vertex := e.map_vertex
  left_inv := e.right_inv
  right_inv := e.left_inv
  map_neighbors := e.inv_neighbors
  inv_neighbors := e.map_neighbors

theorem degree_eq (e : NeighborTableIso left right)
    {u : Coord} (hu : u ∈ tableVertices left) :
    (tableNeighbors left u).length =
      (tableNeighbors right (e.toFun u)).length := by
  rw [← e.map_neighbors u hu |>.length_eq]
  simp

theorem degreeWalkCount_eq (e : NeighborTableIso left right)
    (hleft : ValidNeighborTable left) (hright : ValidNeighborTable right)
    (d n : Nat) {u : Coord} (hu : u ∈ tableVertices left) :
    tableDegreeWalkCount left d n u =
      tableDegreeWalkCount right d n (e.toFun u) := by
  induction n generalizing u with
  | zero => simp [tableDegreeWalkCount, e.degree_eq hu]
  | succ n ih =>
      simp only [tableDegreeWalkCount]
      have hperm := (e.map_neighbors u hu).map
        (tableDegreeWalkCount right d n)
      rw [List.map_map] at hperm
      have hpoint :
          (tableNeighbors left u).map (tableDegreeWalkCount left d n) =
            (tableNeighbors left u).map
              (fun v => tableDegreeWalkCount right d n (e.toFun v)) := by
        apply List.map_congr_left
        intro v hv
        apply ih
        exact valid_neighbor_closed hleft hv
      rw [hpoint]
      exact hperm.sum_eq

end NeighborTableIso

def HasDegreeWalkProfile (table : NeighborTable)
    (d n value : Nat) : Prop :=
  ∃ u ∈ tableVertices table, tableDegreeWalkCount table d n u = value

theorem hasDegreeWalkProfile_iff
    {left right : NeighborTable} (e : NeighborTableIso left right)
    (hleft : ValidNeighborTable left) (hright : ValidNeighborTable right)
    (d n value : Nat) :
    HasDegreeWalkProfile left d n value ↔
      HasDegreeWalkProfile right d n value := by
  constructor
  · rintro ⟨u, hu, hvalue⟩
    exact ⟨e.toFun u, e.map_vertex u hu,
      (e.degreeWalkCount_eq hleft hright d n hu).symm.trans hvalue⟩
  · rintro ⟨v, hv, hvalue⟩
    have heq := e.symm.degreeWalkCount_eq hright hleft d n hv
    exact ⟨e.invFun v, e.inv_vertex v hv, heq.symm.trans hvalue⟩

end LatticePathOrdersKernel
