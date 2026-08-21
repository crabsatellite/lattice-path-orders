import LatticePathOrdersClassical.PeriodicContinuedFraction
import LatticePathOrdersClassical.MatrixTranspose

/-!
# Backward periodic tails and algebraic conjugation

For a positive even period, the backward continued-fraction tail is the
reciprocal of the purely periodic continued fraction of the reversed word.
This file proves directly that it is the negative of the conjugate forward
root.  This is the load-bearing classical identity behind the standard
forward-plus-backward definition of the periodic Lagrange number.
-/

namespace LatticePathOrdersClassical

open NatMatrix2

theorem PositiveDigits.reverse {digits : List Nat}
    (h : PositiveDigits digits) : PositiveDigits digits.reverse := by
  intro digit hdigit
  exact h digit (List.mem_reverse.mp hdigit)

noncomputable def periodicBackwardContinuedFraction
    (digits : List Nat) : Real :=
  1 / periodicContinuedFraction digits.reverse

theorem periodicBackward_eq_neg_conjugate {digits : List Nat}
    (hne : digits ≠ []) (hpos : PositiveDigits digits)
    (heven : Even digits.length) :
    periodicBackwardContinuedFraction digits =
      -periodicContinuedFractionConjugate digits := by
  let A := digitProduct digits
  let B := digitProduct digits.reverse
  let x := conjugateFixedPoint A
  let y : Real := -1 / x
  have hqA : 0 < A.a21 := digitProduct_a21_pos hne hpos
  have hrA : 0 < A.a12 := digitProduct_a12_pos hne hpos
  have hxneg : x < 0 := conjugateFixedPoint_neg_of_entries hqA hrA
  have hxne : x ≠ 0 := ne_of_lt hxneg
  have hypos : 0 < y := by
    dsimp [y]
    exact div_pos_of_neg_of_neg (by norm_num) hxneg
  have hreverse : B = transpose A := by
    dsimp [A, B]
    exact digitProduct_reverse digits
  have hqB : 0 < B.a21 := by
    rw [hreverse]
    simpa using hrA
  have hrB : 0 < B.a12 := by
    rw [hreverse]
    simpa using hqA
  have hrootA :
      (A.a21 : Real) * x ^ 2 +
        ((A.a22 : Real) - A.a11) * x - A.a12 = 0 := by
    exact conjugateFixedPoint_quadratic A hqA
  have hrootB :
      (B.a21 : Real) * y ^ 2 +
        ((B.a22 : Real) - B.a11) * y - B.a12 = 0 := by
    rw [hreverse]
    simp only [transpose_a21, transpose_a22, transpose_a11, transpose_a12]
    dsimp [y]
    field_simp [hxne]
    nlinarith [hrootA]
  have hdetB : determinant B = 1 := by
    dsimp [B]
    apply determinant_digitProduct_of_even
    simpa using heven
  have hfixed : mobius B y = y :=
    mobius_fixed_of_quadratic hdetB hrootB
  have hy := positive_fixedPoint_unique hqB hrB hypos hfixed
  unfold periodicBackwardContinuedFraction periodicContinuedFraction
    periodicContinuedFractionConjugate
  change 1 / positiveFixedPoint B = -x
  rw [← hy]
  dsimp [y]
  field_simp [hxne]

end LatticePathOrdersClassical
