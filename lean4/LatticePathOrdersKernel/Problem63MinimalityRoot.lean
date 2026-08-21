import LatticePathOrdersKernel.GeneratedMinimalityKernelCertificate
import LatticePathOrdersKernel.PathBand
import LatticePathOrdersKernel.LagrangeOrderBridge

/-!
# Kernel-only bounded minimality for Problem 6.3
-/

namespace LatticePathOrdersKernel

open LatticePathOrders

theorem problem63_actual_band_minimal_through_25
    {a b : Nat} (hb : 0 < b) (hab : b < a)
    (hcop : Nat.Coprime a b) (hlen : a + b ≤ 25)
    {left right : Path} (hleft : Carrier a b left)
    (hright : Carrier a b right)
    (hscore : sourceLagrangeValue left = sourceLagrangeValue right) :
    PathBandIso (a + b) left right := by
  have hsq : lagrangeSq left = lagrangeSq right :=
    (sourceLagrangeValue_eq_iff_lagrangeSq_eq
      (by omega) hb hleft hright).mp hscore
  have hcodeBool := problem63_minimal_through_25 hb hab hcop hlen
    left right hleft hright hsq
  have htwo : 2 ≤ left.length := by
    rw [carrier_length hleft]
    omega
  have hcode : Dihedral (closedTurnCode left) (closedTurnCode right) :=
    (dihedralEq_eq_true_iff (closedTurnCode_ne_nil htwo)).mp hcodeBool
  exact carrier_turnCode_dihedral_implies_bandIso
    hb hab hleft hright hcode

end LatticePathOrdersKernel
