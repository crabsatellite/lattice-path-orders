import LatticePathOrdersClassical.MatrixDeterminant
import Mathlib.Data.Real.Sqrt
import Mathlib.Tactic

/-!
# Fixed points of positive continued-fraction transformations

This file proves the quadratic fixed-point calculation and the exact squared
gap formula.  It is the algebraic core behind the periodic Lagrange value; no
published Lagrange/continued-fraction identity is assumed.
-/

namespace LatticePathOrdersClassical

open NatMatrix2

noncomputable def mobius (A : NatMatrix2) (x : Real) : Real :=
  ((A.a11 : Real) * x + A.a12) / ((A.a21 : Real) * x + A.a22)

def fixedDiscriminant (A : NatMatrix2) : Real :=
  ((A.a11 : Real) - A.a22) ^ 2 + 4 * A.a12 * A.a21

noncomputable def positiveFixedPoint (A : NatMatrix2) : Real :=
  (((A.a11 : Real) - A.a22) + Real.sqrt (fixedDiscriminant A)) /
    (2 * A.a21)

noncomputable def conjugateFixedPoint (A : NatMatrix2) : Real :=
  (((A.a11 : Real) - A.a22) - Real.sqrt (fixedDiscriminant A)) /
    (2 * A.a21)

noncomputable def fixedPointGap (A : NatMatrix2) : Real :=
  positiveFixedPoint A - conjugateFixedPoint A

theorem fixedDiscriminant_nonneg (A : NatMatrix2) :
    0 ≤ fixedDiscriminant A := by
  unfold fixedDiscriminant
  positivity

theorem fixedDiscriminant_eq_trace {A : NatMatrix2}
    (hdet : determinant A = 1) :
    fixedDiscriminant A = (trace A : Real) ^ 2 - 4 := by
  have hprod := determinant_one_equation hdet
  have hprodR :
      (A.a11 : Real) * A.a22 = (A.a12 : Real) * A.a21 + 1 := by
    exact_mod_cast hprod
  unfold fixedDiscriminant trace
  push_cast
  nlinarith

theorem fixedPointGap_eq (A : NatMatrix2) (hq : 0 < A.a21) :
    fixedPointGap A = Real.sqrt (fixedDiscriminant A) / A.a21 := by
  have hqR : (A.a21 : Real) ≠ 0 := by positivity
  unfold fixedPointGap positiveFixedPoint conjugateFixedPoint
  field_simp
  ring

theorem fixedPointGap_nonneg (A : NatMatrix2) (hq : 0 < A.a21) :
    0 ≤ fixedPointGap A := by
  rw [fixedPointGap_eq A hq]
  positivity

theorem fixedPointGap_sq {A : NatMatrix2}
    (hq : 0 < A.a21) (hdet : determinant A = 1) :
    fixedPointGap A ^ 2 =
      ((trace A : Real) ^ 2 - 4) / (A.a21 : Real) ^ 2 := by
  rw [fixedPointGap_eq A hq, div_pow]
  rw [Real.sq_sqrt (fixedDiscriminant_nonneg A)]
  rw [fixedDiscriminant_eq_trace hdet]

private theorem root_quadratic (A : NatMatrix2) (hq : 0 < A.a21)
    (sign : Real) (hsign : sign ^ 2 = 1) :
    let x := (((A.a11 : Real) - A.a22) +
      sign * Real.sqrt (fixedDiscriminant A)) / (2 * A.a21)
    (A.a21 : Real) * x ^ 2 + ((A.a22 : Real) - A.a11) * x - A.a12 = 0 := by
  dsimp
  have hqR : (A.a21 : Real) ≠ 0 := by positivity
  have hsqrt := Real.sq_sqrt (fixedDiscriminant_nonneg A)
  unfold fixedDiscriminant at hsqrt ⊢
  field_simp
  ring_nf at hsqrt ⊢
  nlinarith

theorem positiveFixedPoint_quadratic (A : NatMatrix2) (hq : 0 < A.a21) :
    (A.a21 : Real) * positiveFixedPoint A ^ 2 +
      ((A.a22 : Real) - A.a11) * positiveFixedPoint A - A.a12 = 0 := by
  simpa [positiveFixedPoint] using root_quadratic A hq 1 (by norm_num)

theorem conjugateFixedPoint_quadratic (A : NatMatrix2) (hq : 0 < A.a21) :
    (A.a21 : Real) * conjugateFixedPoint A ^ 2 +
      ((A.a22 : Real) - A.a11) * conjugateFixedPoint A - A.a12 = 0 := by
  simpa [conjugateFixedPoint, sub_eq_add_neg] using
    root_quadratic A hq (-1) (by norm_num)

theorem denominator_ne_zero_of_quadratic {A : NatMatrix2} {x : Real}
    (hdet : determinant A = 1)
    (hroot : (A.a21 : Real) * x ^ 2 +
      ((A.a22 : Real) - A.a11) * x - A.a12 = 0) :
    (A.a21 : Real) * x + A.a22 ≠ 0 := by
  have hprod := determinant_one_equation hdet
  have hprodR :
      (A.a11 : Real) * A.a22 = (A.a12 : Real) * A.a21 + 1 := by
    exact_mod_cast hprod
  intro hzero
  have hmul :
      ((A.a21 : Real) * x + A.a22) *
        ((A.a21 : Real) * x - A.a11) = 0 := by rw [hzero]; ring
  nlinarith

theorem mobius_fixed_of_quadratic {A : NatMatrix2} {x : Real}
    (hdet : determinant A = 1)
    (hroot : (A.a21 : Real) * x ^ 2 +
      ((A.a22 : Real) - A.a11) * x - A.a12 = 0) :
    mobius A x = x := by
  have hden := denominator_ne_zero_of_quadratic hdet hroot
  unfold mobius
  rw [div_eq_iff hden]
  nlinarith

theorem positiveFixedPoint_is_fixed {A : NatMatrix2}
    (hq : 0 < A.a21) (hdet : determinant A = 1) :
    mobius A (positiveFixedPoint A) = positiveFixedPoint A :=
  mobius_fixed_of_quadratic hdet (positiveFixedPoint_quadratic A hq)

theorem conjugateFixedPoint_is_fixed {A : NatMatrix2}
    (hq : 0 < A.a21) (hdet : determinant A = 1) :
    mobius A (conjugateFixedPoint A) = conjugateFixedPoint A :=
  mobius_fixed_of_quadratic hdet (conjugateFixedPoint_quadratic A hq)

end LatticePathOrdersClassical
