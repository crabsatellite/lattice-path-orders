import LatticePathOrdersClassical.PeriodicMaximum

/-!
# Purely periodic continued fractions

A nonempty positive even digit word acts by a determinant-one Mobius map.  We
define its purely periodic continued fraction as the unique positive fixed
point and prove that characterization from the quadratic formula.  Its
algebraic conjugate is the other, negative fixed point.
-/

namespace LatticePathOrdersClassical

open NatMatrix2

theorem positiveFixedPoint_pos_of_entries {A : NatMatrix2}
    (hq : 0 < A.a21) (hr : 0 < A.a12) : 0 < positiveFixedPoint A := by
  have hsqrtNonneg : 0 ≤ Real.sqrt (fixedDiscriminant A) := Real.sqrt_nonneg _
  have hsqrtSq := Real.sq_sqrt (fixedDiscriminant_nonneg A)
  have hstrict :
      (A.a22 : Real) - A.a11 < Real.sqrt (fixedDiscriminant A) := by
    unfold fixedDiscriminant at hsqrtNonneg hsqrtSq ⊢
    ring_nf at hsqrtNonneg hsqrtSq ⊢
    have hqR : 0 < (A.a21 : Real) := by exact_mod_cast hq
    have hrR : 0 < (A.a12 : Real) := by exact_mod_cast hr
    nlinarith
  unfold positiveFixedPoint
  have hden : 0 < (2 : Real) * A.a21 := by positivity
  exact div_pos (by nlinarith) hden

theorem conjugateFixedPoint_neg_of_entries {A : NatMatrix2}
    (hq : 0 < A.a21) (hr : 0 < A.a12) : conjugateFixedPoint A < 0 := by
  have hsqrtNonneg : 0 ≤ Real.sqrt (fixedDiscriminant A) := Real.sqrt_nonneg _
  have hsqrtSq := Real.sq_sqrt (fixedDiscriminant_nonneg A)
  have hstrict :
      (A.a11 : Real) - A.a22 < Real.sqrt (fixedDiscriminant A) := by
    unfold fixedDiscriminant at hsqrtNonneg hsqrtSq ⊢
    ring_nf at hsqrtNonneg hsqrtSq ⊢
    have hqR : 0 < (A.a21 : Real) := by exact_mod_cast hq
    have hrR : 0 < (A.a12 : Real) := by exact_mod_cast hr
    nlinarith
  unfold conjugateFixedPoint
  have hden : 0 < (2 : Real) * A.a21 := by positivity
  exact div_neg_of_neg_of_pos (by nlinarith) hden

private theorem quadratic_factor {A : NatMatrix2}
    (hq : 0 < A.a21) (x : Real) :
    (A.a21 : Real) * (x - positiveFixedPoint A) *
        (x - conjugateFixedPoint A) =
      (A.a21 : Real) * x ^ 2 +
        ((A.a22 : Real) - A.a11) * x - A.a12 := by
  have hqR : (A.a21 : Real) ≠ 0 := by positivity
  have hsqrt := Real.sq_sqrt (fixedDiscriminant_nonneg A)
  unfold fixedDiscriminant at hsqrt
  unfold positiveFixedPoint conjugateFixedPoint fixedDiscriminant
  field_simp
  ring_nf at hsqrt ⊢
  nlinarith

theorem positive_fixedPoint_unique {A : NatMatrix2}
    (hq : 0 < A.a21) (hr : 0 < A.a12)
    {x : Real} (hx : 0 < x) (hfixed : mobius A x = x) :
    x = positiveFixedPoint A := by
  have hdenPos : 0 < (A.a21 : Real) * x + A.a22 := by positivity
  have hroot :
      (A.a21 : Real) * x ^ 2 +
        ((A.a22 : Real) - A.a11) * x - A.a12 = 0 := by
    unfold mobius at hfixed
    rw [div_eq_iff (ne_of_gt hdenPos)] at hfixed
    nlinarith
  have hfactor := quadratic_factor hq x
  rw [hroot] at hfactor
  have hqNe : (A.a21 : Real) ≠ 0 := by positivity
  rcases mul_eq_zero.mp hfactor with hleft | hneg
  · have hpos := (mul_eq_zero.mp hleft).resolve_left hqNe
    exact sub_eq_zero.mp hpos
  · have hcneg := conjugateFixedPoint_neg_of_entries hq hr
    have : x = conjugateFixedPoint A := sub_eq_zero.mp hneg
    nlinarith

noncomputable def periodicContinuedFraction
    (digits : List Nat) : Real :=
  positiveFixedPoint (digitProduct digits)

noncomputable def periodicContinuedFractionConjugate
    (digits : List Nat) : Real :=
  conjugateFixedPoint (digitProduct digits)

theorem periodicContinuedFraction_pos {digits : List Nat}
    (hne : digits ≠ []) (hpos : PositiveDigits digits) :
    0 < periodicContinuedFraction digits := by
  apply positiveFixedPoint_pos_of_entries
  · exact digitProduct_a21_pos hne hpos
  · exact digitProduct_a12_pos hne hpos

theorem periodicContinuedFraction_is_fixed {digits : List Nat}
    (hne : digits ≠ []) (hpos : PositiveDigits digits)
    (heven : Even digits.length) :
    mobius (digitProduct digits) (periodicContinuedFraction digits) =
      periodicContinuedFraction digits := by
  exact positiveFixedPoint_is_fixed
    (digitProduct_a21_pos hne hpos)
    (determinant_digitProduct_of_even heven)

theorem periodicContinuedFraction_unique {digits : List Nat}
    (hne : digits ≠ []) (hpos : PositiveDigits digits)
    {x : Real}
    (hx : 0 < x)
    (hfixed : mobius (digitProduct digits) x = x) :
    x = periodicContinuedFraction digits := by
  exact positive_fixedPoint_unique
    (digitProduct_a21_pos hne hpos)
    (digitProduct_a12_pos hne hpos)
    hx hfixed

theorem periodic_conjugate_gap (digits : List Nat) :
    periodicContinuedFraction digits -
        periodicContinuedFractionConjugate digits =
      fixedPointGap (digitProduct digits) := rfl

/-- The Lagrange value of a finite positive period, in the exact cyclic-shift
form used by Schiffler's Remark 4.4. -/
noncomputable def periodicLagrangeValue
    (digits : List Nat) (hne : digits ≠ []) : Real :=
  periodicGapMaximum digits hne

theorem periodicLagrangeValue_sq {digits : List Nat}
    (hne : digits ≠ []) (hpos : PositiveDigits digits)
    (heven : Even digits.length) :
    periodicLagrangeValue digits hne ^ 2 =
      ((trace (digitProduct digits) : Real) ^ 2 - 4) /
        (cyclicDenominatorMin digits hne : Real) ^ 2 :=
  periodicGapMaximum_sq hne hpos heven

end LatticePathOrdersClassical
