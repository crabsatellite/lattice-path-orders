import LatticePathOrdersClassical.PeriodicBackward
import LatticePathOrdersClassical.PeriodicMaximum

/-!
# Standard forward-plus-backward periodic Lagrange value

For each cyclic cut we add the forward purely periodic continued fraction to
the backward tail.  The periodic Lagrange value is the maximum of these
finitely many approximation coefficients.  The theorem below derives
Schiffler's `max (α - α')` formula from this source definition.
-/

namespace LatticePathOrdersClassical

noncomputable def periodicCutApproximation
    (digits : List Nat) (k : CyclicIndex digits) : Real :=
  periodicContinuedFraction (digits.rotate k.val) +
    periodicBackwardContinuedFraction (digits.rotate k.val)

noncomputable def standardPeriodicLagrangeValue
    (digits : List Nat) (hne : digits ≠ []) : Real :=
  (Finset.univ.image (periodicCutApproximation digits)).max'
    ((cyclicIndex_nonempty hne).image _)

theorem periodicCutApproximation_eq_cyclicGap {digits : List Nat}
    (hne : digits ≠ []) (hpos : PositiveDigits digits)
    (heven : Even digits.length) (k : CyclicIndex digits) :
    periodicCutApproximation digits k = cyclicGap digits k := by
  have hrotateNe := rotate_ne_nil hne k.val
  have hrotatePos := hpos.rotate k.val
  have hrotateEven : Even (digits.rotate k.val).length := by
    simpa using heven
  unfold periodicCutApproximation cyclicGap cyclicProduct
  rw [periodicBackward_eq_neg_conjugate hrotateNe hrotatePos hrotateEven]
  unfold periodicContinuedFraction periodicContinuedFractionConjugate
    fixedPointGap
  ring

theorem standardPeriodicLagrangeValue_eq_gapMaximum {digits : List Nat}
    (hne : digits ≠ []) (hpos : PositiveDigits digits)
    (heven : Even digits.length) :
    standardPeriodicLagrangeValue digits hne =
      periodicGapMaximum digits hne := by
  unfold standardPeriodicLagrangeValue periodicGapMaximum
  apply le_antisymm
  · apply Finset.max'_le
    intro value hvalue
    rcases Finset.mem_image.mp hvalue with ⟨k, _, rfl⟩
    rw [periodicCutApproximation_eq_cyclicGap hne hpos heven k]
    apply Finset.le_max'
    exact Finset.mem_image.mpr ⟨k, Finset.mem_univ _, rfl⟩
  · apply Finset.max'_le
    intro value hvalue
    rcases Finset.mem_image.mp hvalue with ⟨k, _, rfl⟩
    rw [← periodicCutApproximation_eq_cyclicGap hne hpos heven k]
    apply Finset.le_max'
    exact Finset.mem_image.mpr ⟨k, Finset.mem_univ _, rfl⟩

theorem periodicCutApproximation_pos {digits : List Nat}
    (hne : digits ≠ []) (hpos : PositiveDigits digits)
    (k : CyclicIndex digits) :
    0 < periodicCutApproximation digits k := by
  unfold periodicCutApproximation periodicBackwardContinuedFraction
  have hrotateNe := rotate_ne_nil hne k.val
  have hrotatePos := hpos.rotate k.val
  have hforward := periodicContinuedFraction_pos hrotateNe hrotatePos
  have hreverseNe : (digits.rotate k.val).reverse ≠ [] := by
    simpa using hrotateNe
  have hreversePos := hrotatePos.reverse
  have hbackwardBase :=
    periodicContinuedFraction_pos hreverseNe hreversePos
  positivity

theorem standardPeriodicLagrangeValue_pos {digits : List Nat}
    (hne : digits ≠ []) (hpos : PositiveDigits digits) :
    0 < standardPeriodicLagrangeValue digits hne := by
  unfold standardPeriodicLagrangeValue
  have hmem := Finset.max'_mem
    (Finset.univ.image (periodicCutApproximation digits))
    ((cyclicIndex_nonempty hne).image _)
  rcases Finset.mem_image.mp hmem with ⟨k, -, hk⟩
  rw [← hk]
  exact periodicCutApproximation_pos hne hpos k

end LatticePathOrdersClassical
