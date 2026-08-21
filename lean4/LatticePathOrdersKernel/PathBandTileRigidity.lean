import LatticePathOrdersKernel.PathDirectionEndpoints

namespace LatticePathOrdersKernel

open LatticePathOrdersClassical

theorem NormalBandGraphIso.tileMap_vertex_of_turn
    {n : Nat} (hn : 5 ≤ n) {left right : ZMod n → Direction}
    (iso : NormalBandGraphIso left right) {i : ZMod n}
    (hturn : left i ≠ left (i + 1)) :
    ∃ j : ZMod n, iso.tileMap hn (.vertex i) = .vertex j := by
  letI : Fact (1 < n) := ⟨by omega⟩
  have hsource : TileHasAdjacentSharedEdges left (.vertex i) :=
    (vertex_tile_has_adjacent_shared_edges_iff left i).mpr hturn
  have htarget :=
    (iso.tile_has_adjacent_shared_edges_iff hn (.vertex i)).mpr hsource
  cases himage : iso.tileMap hn (.vertex i) with
  | vertex j => exact ⟨j, rfl⟩
  | midpoint j =>
      rw [himage] at htarget
      exact False.elim ((midpoint_tile_has_no_adjacent_shared_edges right j) htarget)

theorem NormalBandGraphIso.tileMap_orientation_at
    {n : Nat} (hn : 5 ≤ n) {left right : ZMod n → Direction}
    (iso : NormalBandGraphIso left right) (tile : BandTile n) :
    iso.tileMap hn tile.successor = (iso.tileMap hn tile).successor ∨
      iso.tileMap hn tile.successor = tilePredecessor (iso.tileMap hn tile) := by
  letI : Fact (1 < n) := ⟨by omega⟩
  have hadj : TileCycleAdj (iso.tileMap hn tile)
      (iso.tileMap hn tile.successor) :=
    (iso.tileMap_cycleAdj_iff hn _ _).mpr (Or.inl rfl)
  rcases hadj with hforward | hback
  · exact Or.inl hforward
  · right
    apply BandTile.successor_injective
    exact hback.symm.trans (tileSuccessor_predecessor _).symm

theorem NormalBandGraphIso.vertex_orbit_of_turn
    {n : Nat} (hn : 5 ≤ n) {left right : ZMod n → Direction}
    (iso : NormalBandGraphIso left right) {i : ZMod n}
    (hturn : left i ≠ left (i + 1)) :
    ∃ j : ZMod n,
      (∀ k : Nat,
        iso.tileMap hn (.vertex (i + k)) = .vertex (j + k)) ∨
      (∀ k : Nat,
        iso.tileMap hn (.vertex (i + k)) = .vertex (j - k)) := by
  letI : Fact (1 < n) := ⟨by omega⟩
  rcases iso.tileMap_vertex_of_turn hn hturn with ⟨j, hstart⟩
  refine ⟨j, ?_⟩
  rcases iso.tileMap_orientation_at hn (.vertex i) with hforward | hbackward
  · left
    intro k
    let map := iso.tileEquiv hn
    have horbit := cycleMap_forward map
      (fun first second => iso.tileMap_cycleAdj_iff hn first second)
      (.vertex i) hforward (2 * k)
    change iso.tileMap hn (tileForward (2 * k) (.vertex i)) =
      tileForward (2 * k) (iso.tileMap hn (.vertex i)) at horbit
    rw [tileForward_two_mul_vertex, hstart,
      tileForward_two_mul_vertex] at horbit
    exact horbit
  · right
    intro k
    let map := iso.tileEquiv hn
    have horbit := cycleMap_reversing map
      (fun first second => iso.tileMap_cycleAdj_iff hn first second)
      (.vertex i) hbackward (2 * k)
    change iso.tileMap hn (tileForward (2 * k) (.vertex i)) =
      tileBackward (2 * k) (iso.tileMap hn (.vertex i)) at horbit
    rw [tileForward_two_mul_vertex, hstart,
      tileBackward_two_mul_vertex] at horbit
    exact horbit

end LatticePathOrdersKernel
