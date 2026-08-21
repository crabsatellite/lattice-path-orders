import LatticePathOrdersKernel.ListBandGraphIso

/-!
# Intrinsic isomorphisms of valid neighbor tables

The subtype `TableVertex table` removes the irrelevant behavior of the total
coordinate maps used by `NeighborTableIso`.  This file proves once and for all
that an adjacency-preserving equivalence of those literal vertices induces the
older adjacency-list isomorphism consumed by the walk-profile invariant.
-/

namespace LatticePathOrdersKernel

abbrev TableVertex (table : NeighborTable) :=
  {u : Coord // u ∈ tableVertices table}

def TableAdj (table : NeighborTable)
    (u v : TableVertex table) : Prop :=
  v.1 ∈ tableNeighbors table u.1

structure TableGraphIso (left right : NeighborTable) where
  vertexEquiv : TableVertex left ≃ TableVertex right
  map_adj_iff : ∀ u v,
    TableAdj left u v ↔
      TableAdj right (vertexEquiv u) (vertexEquiv v)

namespace TableGraphIso

variable {left right : NeighborTable}

def symm (e : TableGraphIso left right) :
    TableGraphIso right left where
  vertexEquiv := e.vertexEquiv.symm
  map_adj_iff u v := by
    simpa using
      (e.map_adj_iff (e.vertexEquiv.symm u) (e.vertexEquiv.symm v)).symm

def toCoord (e : TableGraphIso left right) (u : Coord) : Coord :=
  if hu : u ∈ tableVertices left then e.vertexEquiv ⟨u, hu⟩ else u

def invCoord (e : TableGraphIso left right) (v : Coord) : Coord :=
  if hv : v ∈ tableVertices right then e.vertexEquiv.symm ⟨v, hv⟩ else v

@[simp] theorem toCoord_of_mem (e : TableGraphIso left right)
    {u : Coord} (hu : u ∈ tableVertices left) :
    e.toCoord u = e.vertexEquiv ⟨u, hu⟩ := by
  simp [toCoord, hu]

@[simp] theorem invCoord_of_mem (e : TableGraphIso left right)
    {v : Coord} (hv : v ∈ tableVertices right) :
    e.invCoord v = e.vertexEquiv.symm ⟨v, hv⟩ := by
  simp [invCoord, hv]

theorem toCoord_mem (e : TableGraphIso left right)
    {u : Coord} (hu : u ∈ tableVertices left) :
    e.toCoord u ∈ tableVertices right := by
  rw [e.toCoord_of_mem hu]
  exact (e.vertexEquiv ⟨u, hu⟩).2

theorem invCoord_mem (e : TableGraphIso left right)
    {v : Coord} (hv : v ∈ tableVertices right) :
    e.invCoord v ∈ tableVertices left := by
  rw [e.invCoord_of_mem hv]
  exact (e.vertexEquiv.symm ⟨v, hv⟩).2

theorem invCoord_toCoord (e : TableGraphIso left right)
    {u : Coord} (hu : u ∈ tableVertices left) :
    e.invCoord (e.toCoord u) = u := by
  rw [toCoord]
  simp only [dif_pos hu]
  rw [invCoord]
  simp only [dif_pos (e.vertexEquiv ⟨u, hu⟩).2]
  exact congrArg Subtype.val
    (e.vertexEquiv.symm_apply_apply ⟨u, hu⟩)

theorem toCoord_invCoord (e : TableGraphIso left right)
    {v : Coord} (hv : v ∈ tableVertices right) :
    e.toCoord (e.invCoord v) = v := by
  rw [invCoord]
  simp only [dif_pos hv]
  rw [toCoord]
  simp only [dif_pos (e.vertexEquiv.symm ⟨v, hv⟩).2]
  exact congrArg Subtype.val
    (e.vertexEquiv.apply_symm_apply ⟨v, hv⟩)

theorem toCoord_injective_on (e : TableGraphIso left right)
    {u v : Coord} (hu : u ∈ tableVertices left)
    (hv : v ∈ tableVertices left) (h : e.toCoord u = e.toCoord v) :
    u = v := by
  have heq : e.vertexEquiv ⟨u, hu⟩ = e.vertexEquiv ⟨v, hv⟩ := by
    apply Subtype.ext
    simpa [e.toCoord_of_mem hu, e.toCoord_of_mem hv] using h
  exact congrArg Subtype.val (e.vertexEquiv.injective heq)

theorem map_neighbors_perm (e : TableGraphIso left right)
    (hleft : ValidNeighborTable left) (hright : ValidNeighborTable right)
    {u : Coord} (hu : u ∈ tableVertices left) :
    ((tableNeighbors left u).map e.toCoord).Perm
      (tableNeighbors right (e.toCoord u)) := by
  have hmapNodup :
      ((tableNeighbors left u).map e.toCoord).Nodup := by
    apply (valid_neighbor_nodup hleft u).map_on
    intro x hx y hy hxy
    exact e.toCoord_injective_on
      (valid_neighbor_closed hleft hx)
      (valid_neighbor_closed hleft hy) hxy
  apply (List.perm_ext_iff_of_nodup hmapNodup
    (valid_neighbor_nodup hright _)).2
  intro z
  constructor
  · rw [List.mem_map]
    rintro ⟨x, hx, hxz⟩
    have hxv := valid_neighbor_closed hleft hx
    have hadj := (e.map_adj_iff ⟨u, hu⟩ ⟨x, hxv⟩).mp hx
    rw [← hxz]
    simpa [TableAdj, e.toCoord_of_mem hu, e.toCoord_of_mem hxv] using hadj
  · intro hz
    have hzv := valid_neighbor_closed hright hz
    let x : TableVertex left := e.vertexEquiv.symm ⟨z, hzv⟩
    have hx : TableAdj left ⟨u, hu⟩ x := by
      apply (e.map_adj_iff ⟨u, hu⟩ x).mpr
      simpa [TableAdj, e.toCoord_of_mem hu, x] using hz
    refine List.mem_map.mpr ⟨x.1, hx, ?_⟩
    have hxv : x.1 ∈ tableVertices left := x.2
    simpa [e.toCoord_of_mem hxv, x]

def toNeighborTableIso (e : TableGraphIso left right)
    (hleft : ValidNeighborTable left) (hright : ValidNeighborTable right) :
    NeighborTableIso left right where
  toFun := e.toCoord
  invFun := e.invCoord
  map_vertex _ hu := e.toCoord_mem hu
  inv_vertex _ hv := e.invCoord_mem hv
  left_inv _ hu := e.invCoord_toCoord hu
  right_inv _ hv := e.toCoord_invCoord hv
  map_neighbors _ hu := e.map_neighbors_perm hleft hright hu
  inv_neighbors _ hv := e.symm.map_neighbors_perm hright hleft hv

end TableGraphIso

end LatticePathOrdersKernel
