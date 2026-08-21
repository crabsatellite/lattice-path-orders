import LatticePathOrdersKernel.CarrierOneUp

namespace LatticePathOrdersKernel

open LatticePathOrders

/-- Full-length version of `lem:tile-cycle`.  Totals three and four reduce to
the unique one-up path; totals at least five use the intrinsic four-cycle
classification. -/
theorem manuscript_lem_intrinsic_tile_cycle
    {a b : Nat} (ha : 0 < a) (hb : 0 < b) (hab : b < a)
    {left right : Path} (hleft : Carrier a b left)
    (hright : Carrier a b right) :
    PathBandIso (a + b) left right ↔
      Dihedral (closedTurnCode left) (closedTurnCode right) := by
  by_cases hn : 5 ≤ a + b
  · exact manuscript_lem_intrinsic_tile_cycle_of_five_le
      ha hb hab hn hleft hright
  · have hbOne : b = 1 := by omega
    subst b
    have heq := carrier_one_up_unique ha hleft hright
    subst right
    exact ⟨fun _ => Dihedral.refl _, fun _ => PathBandIso.refl _ _⟩

end LatticePathOrdersKernel
