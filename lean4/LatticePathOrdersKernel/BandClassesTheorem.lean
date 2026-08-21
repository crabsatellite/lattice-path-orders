import LatticePathOrdersKernel.IntrinsicTileCycleAll

namespace LatticePathOrdersKernel

open LatticePathOrders

/-- `thm:band-classes`: literal quotient-band isomorphism classes on a
coprime rational-Dyck carrier are precisely the identity and `tau` orbits. -/
theorem manuscript_thm_band_classes
    {a b : Nat} (ha : 0 < a) (hb : 0 < b) (hab : b < a)
    (hcoprime : Nat.Coprime a b)
    {left right : Path} (hleft : Carrier a b left)
    (hright : Carrier a b right) :
    PathBandIso (a + b) left right ↔
      right = left ∨ right = tau a b left := by
  letI : NeZero (a + b) := ⟨by omega⟩
  letI : Fact (1 < a + b) := ⟨by omega⟩
  constructor
  · intro hiso
    have hcode := (manuscript_lem_intrinsic_tile_cycle
      ha hb hab hleft hright).mp hiso
    have hpath := carrier_turnCode_dihedral_implies_path_dihedral
      hb hab hleft hright hcode
    exact (carrier_dihedral_iff_eq_or_tau
      ha hb hcoprime hleft hright).mp hpath
  · intro hcases
    have hpath := (carrier_dihedral_iff_eq_or_tau
      ha hb hcoprime hleft hright).mpr hcases
    exact path_dihedral_implies_bandIso
      (carrier_length hleft) (carrier_length hright) hpath

theorem manuscript_thm_band_classes_size_at_most_two
    {a b : Nat} (ha : 0 < a) (hb : 0 < b) (hab : b < a)
    (hcoprime : Nat.Coprime a b) {left : Path}
    (hleft : Carrier a b left) :
    ∀ right : Path, Carrier a b right →
      PathBandIso (a + b) left right →
      right ∈ ({left, tau a b left} : Set Path) := by
  intro right hright hiso
  simpa [Set.mem_insert_iff, Set.mem_singleton_iff] using
    (manuscript_thm_band_classes ha hb hab hcoprime hleft hright).mp hiso

end LatticePathOrdersKernel
