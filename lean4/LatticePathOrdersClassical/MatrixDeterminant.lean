import LatticePathOrdersClassical.Continuant
import Mathlib.Data.Int.Basic
import Mathlib.Tactic

/-!
# Determinants and cyclic traces of continued-fraction matrices

All statements are proved directly for the small matrix type used by the
classical layer.  In particular, determinant parity and cyclic trace invariance
are not imported as literature results.
-/

namespace LatticePathOrdersClassical

open NatMatrix2

/-- Integer determinant of a natural matrix. -/
def determinant (A : NatMatrix2) : Int :=
  (A.a11 : Int) * A.a22 - (A.a12 : Int) * A.a21

def trace (A : NatMatrix2) : Nat := A.a11 + A.a22

theorem determinant_mul (A B : NatMatrix2) :
    determinant (A * B) = determinant A * determinant B := by
  simp [determinant]
  ring

@[simp] theorem determinant_one : determinant (1 : NatMatrix2) = 1 := by
  rfl

@[simp] theorem determinant_digitMatrix (a : Nat) :
    determinant (digitMatrix a) = -1 := by
  simp [determinant, digitMatrix]

theorem determinant_digitProduct (digits : List Nat) :
    determinant (digitProduct digits) = (-1 : Int) ^ digits.length := by
  induction digits with
  | nil => simp [digitProduct]
  | cons a tail ih =>
      simp [digitProduct, determinant_mul, ih, pow_succ]

theorem trace_mul_comm (A B : NatMatrix2) : trace (A * B) = trace (B * A) := by
  simp [trace, Nat.mul_comm, Nat.add_left_comm, Nat.add_assoc]

theorem digitProduct_append (left right : List Nat) :
    digitProduct (left ++ right) = digitProduct left * digitProduct right := by
  induction left with
  | nil => simp [digitProduct]
  | cons a tail ih =>
      simp only [List.cons_append, digitProduct, ih]
      rw [NatMatrix2.mul_assoc]

theorem trace_digitProduct_append_comm (left right : List Nat) :
    trace (digitProduct (left ++ right)) =
      trace (digitProduct (right ++ left)) := by
  rw [digitProduct_append, digitProduct_append]
  exact trace_mul_comm _ _

/-- Moving any prefix of a digit word to the end preserves the trace. -/
theorem trace_rotate_eq (digits : List Nat) (k : Nat) :
    trace (digitProduct (digits.rotate k)) = trace (digitProduct digits) := by
  rw [List.rotate_eq_drop_append_take_mod]
  rw [trace_digitProduct_append_comm]
  rw [List.take_append_drop]

theorem determinant_one_equation {A : NatMatrix2}
    (hdet : determinant A = 1) :
    A.a11 * A.a22 = A.a12 * A.a21 + 1 := by
  have hcast :
      (A.a11 : Int) * A.a22 = (A.a12 : Int) * A.a21 + 1 := by
    unfold determinant at hdet
    omega
  exact_mod_cast hcast

theorem trace_sq_sub_four_eq_discriminant {A : NatMatrix2}
    (hdet : determinant A = 1) :
    (trace A : Int) ^ 2 - 4 =
      ((A.a11 : Int) - A.a22) ^ 2 + 4 * A.a12 * A.a21 := by
  have hprod :
      (A.a11 : Int) * A.a22 = (A.a12 : Int) * A.a21 + 1 := by
    unfold determinant at hdet
    linarith
  simp only [trace, Nat.cast_add]
  nlinarith

end LatticePathOrdersClassical
