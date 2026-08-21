import LatticePathOrdersKernel.CyclicMinimumBridge
import LatticePathOrdersClassical.PeriodicStandardLagrange

/-!
# Source Lagrange value and the cached rational square

`sourceLagrangeValue` is a real number: the maximum conjugate gap of the
positive periodic continued fractions over all cyclic cuts.  The theorem below
derives, for literal rational-Dyck carriers, the reduced rational square used by
the certificate engine.
-/

namespace LatticePathOrdersKernel

open LatticePathOrders

noncomputable def sourceLagrangeValue (w : Path) : Real :=
  LatticePathOrdersClassical.standardPeriodicLagrangeValue (cyclicDigits w) (by
    simp [cyclicDigits])

theorem cyclic_trace_sq_ge_four {a b : Nat}
    (ha : 0 < a) (hb : 0 < b) {w : Path} (hw : Carrier a b w) :
    4 ≤ (LatticePathOrdersClassical.trace
      (LatticePathOrdersClassical.digitProduct (cyclicDigits w))) ^ 2 := by
  have hne : cyclicDigits w ≠ [] := by simp [cyclicDigits]
  have hpos := cyclicDigits_positive w
  have heven := carrier_cyclicDigits_even ha hb hw
  let A := LatticePathOrdersClassical.digitProduct (cyclicDigits w)
  have hq : 0 < A.a21 :=
    LatticePathOrdersClassical.digitProduct_a21_pos hne hpos
  have hr : 0 < A.a12 :=
    LatticePathOrdersClassical.digitProduct_a12_pos hne hpos
  have hdet := LatticePathOrdersClassical.determinant_digitProduct_of_even heven
  have hprod := LatticePathOrdersClassical.determinant_one_equation hdet
  have hmul : 0 < A.a11 * A.a22 := by
    rw [hprod]
    positivity
  have hp : 0 < A.a11 := Nat.pos_of_mul_pos_right hmul
  have hs : 0 < A.a22 := Nat.pos_of_mul_pos_left hmul
  have htrace : 2 ≤ LatticePathOrdersClassical.trace A := by
    unfold LatticePathOrdersClassical.trace
    omega
  nlinarith

theorem sourceLagrangeValue_sq {a b : Nat}
    (ha : 0 < a) (hb : 0 < b) {w : Path} (hw : Carrier a b w) :
    sourceLagrangeValue w ^ 2 =
      (((LatticePathOrders.digitProduct (cyclicDigits w)).trace : Real) ^ 2 - 4) /
        (qMin (cyclicDigits w) : Real) ^ 2 := by
  have hne : cyclicDigits w ≠ [] := by simp [cyclicDigits]
  have hpos := cyclicDigits_positive w
  have heven := carrier_cyclicDigits_even ha hb hw
  unfold sourceLagrangeValue
  rw [LatticePathOrdersClassical.standardPeriodicLagrangeValue_eq_gapMaximum
    hne hpos heven]
  rw [LatticePathOrdersClassical.periodicGapMaximum_sq hne hpos heven]
  rw [← trace_bridge]
  rw [cyclicDenominatorMin_eq_qMin hne]

theorem lagrangeNumerator_cast_real {a b : Nat}
    (ha : 0 < a) (hb : 0 < b) {w : Path} (hw : Carrier a b w) :
    (lagrangeNumerator w : Real) =
      ((LatticePathOrders.digitProduct (cyclicDigits w)).trace : Real) ^ 2 - 4 := by
  have hfourClassical := cyclic_trace_sq_ge_four ha hb hw
  have htrace := trace_bridge (cyclicDigits w)
  have hfour :
      4 ≤ (LatticePathOrders.digitProduct (cyclicDigits w)).trace ^ 2 := by
    rw [htrace]
    exact hfourClassical
  unfold lagrangeNumerator
  rw [Nat.cast_sub hfour]
  push_cast
  rfl

theorem sourceLagrangeValue_sq_eq_lagrangeSq {a b : Nat}
    (ha : 0 < a) (hb : 0 < b) {w : Path} (hw : Carrier a b w) :
    sourceLagrangeValue w ^ 2 = (lagrangeSq w : Real) := by
  rw [sourceLagrangeValue_sq ha hb hw]
  unfold lagrangeSq
  push_cast
  rw [lagrangeNumerator_cast_real ha hb hw]

theorem sourceLagrangeValue_pos (w : Path) :
    0 < sourceLagrangeValue w := by
  have hne : cyclicDigits w ≠ [] := by simp [cyclicDigits]
  unfold sourceLagrangeValue
  exact LatticePathOrdersClassical.standardPeriodicLagrangeValue_pos
    hne (cyclicDigits_positive w)

end LatticePathOrdersKernel
