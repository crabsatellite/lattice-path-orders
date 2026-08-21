import LatticePathOrdersKernel.ZModList

namespace LatticePathOrdersKernel

open LatticePathOrders
open LatticePathOrdersClassical

theorem decide_eq_of_not_iff_not {p q : Prop} [Decidable p] [Decidable q]
    (h : (¬p ↔ ¬q)) : decide p = decide q := by
  by_cases hp : p <;> by_cases hq : q <;> simp_all

/-- Kernel-only formalization of the forward implication in the manuscript's
intrinsic-tile-cycle lemma, on the literal cyclic square-band quotient. -/
theorem bandIso_implies_turnCode_dihedral_of_five_le
    {a b : Nat} (ha : 0 < a) (hb : 0 < b) (hn : 5 ≤ a + b)
    {left right : Path} (hleft : Carrier a b left)
    (hright : Carrier a b right)
    (hiso : PathBandIso (a + b) left right) :
    Dihedral (closedTurnCode left) (closedTurnCode right) := by
  letI : NeZero (a + b) := ⟨by omega⟩
  letI : Fact (1 < a + b) := ⟨by omega⟩
  rcases hiso with ⟨bandIso⟩
  let iso := LatticePathOrdersKernel.BandGraphIso.toNormal bandIso
  rcases carrier_pathDirections_has_turn ha hb hleft with ⟨i, hturn⟩
  rcases iso.vertex_orbit_of_turn hn hturn with ⟨j, hforward | hbackward⟩
  · have hvalues : ∀ k : Nat,
        decide (pathDirections (a + b) left (i + k) =
          pathDirections (a + b) left (i + k + 1)) =
        decide (pathDirections (a + b) right (j + k) =
          pathDirections (a + b) right (j + k + 1)) := by
      intro k
      have hinvariant := iso.tile_has_adjacent_shared_edges_iff hn
        (.vertex (i + k))
      rw [hforward k, vertex_tile_has_adjacent_shared_edges_iff,
        vertex_tile_has_adjacent_shared_edges_iff] at hinvariant
      exact decide_eq_of_not_iff_not hinvariant.symm
    rw [closedTurnCode_eq_directionEqualityCode (carrier_length hleft) (by omega),
      closedTurnCode_eq_directionEqualityCode (carrier_length hright) (by omega),
      directionEqualityCode_eq_zmodList, directionEqualityCode_eq_zmodList]
    exact zmodList_dihedral_of_forward _ _ i j hvalues
  · have hvalues : ∀ k : Nat,
        decide (pathDirections (a + b) left (i + k) =
          pathDirections (a + b) left (i + k + 1)) =
        decide (pathDirections (a + b) right (j - k) =
          pathDirections (a + b) right (j - k + 1)) := by
      intro k
      have hinvariant := iso.tile_has_adjacent_shared_edges_iff hn
        (.vertex (i + k))
      rw [hbackward k, vertex_tile_has_adjacent_shared_edges_iff,
        vertex_tile_has_adjacent_shared_edges_iff] at hinvariant
      exact decide_eq_of_not_iff_not hinvariant.symm
    rw [closedTurnCode_eq_directionEqualityCode (carrier_length hleft) (by omega),
      closedTurnCode_eq_directionEqualityCode (carrier_length hright) (by omega),
      directionEqualityCode_eq_zmodList, directionEqualityCode_eq_zmodList]
    exact zmodList_dihedral_of_backward _ _ i j hvalues

/-- Exact `lem:tile-cycle` for coprime rational-Dyck paths of total length at
least five.  The reverse implication is induced by literal band rotations and
reversals; the forward implication is recovered from chordless four-cycles,
their shared-edge cycle, and the intrinsic adjacent-edge decoration. -/
theorem manuscript_lem_intrinsic_tile_cycle_of_five_le
    {a b : Nat} (ha : 0 < a) (hb : 0 < b) (hab : b < a)
    (hn : 5 ≤ a + b) {left right : Path}
    (hleft : Carrier a b left) (hright : Carrier a b right) :
    PathBandIso (a + b) left right ↔
      Dihedral (closedTurnCode left) (closedTurnCode right) := by
  constructor
  · exact bandIso_implies_turnCode_dihedral_of_five_le ha hb hn hleft hright
  · exact carrier_turnCode_dihedral_implies_bandIso hb hab hleft hright

end LatticePathOrdersKernel
