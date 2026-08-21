import LatticePathOrdersClassical.MatrixDeterminant

/-! # Reversing a continued-fraction word transposes its matrix product -/

namespace LatticePathOrdersClassical

open NatMatrix2

def transpose (A : NatMatrix2) : NatMatrix2 :=
  ⟨A.a11, A.a21, A.a12, A.a22⟩

@[simp] theorem transpose_one : transpose (1 : NatMatrix2) = 1 := rfl

@[simp] theorem transpose_digitMatrix (digit : Nat) :
    transpose (digitMatrix digit) = digitMatrix digit := rfl

theorem transpose_mul (left right : NatMatrix2) :
    transpose (left * right) = transpose right * transpose left := by
  ext <;> simp [transpose] <;> ring

theorem digitProduct_reverse (digits : List Nat) :
    digitProduct digits.reverse = transpose (digitProduct digits) := by
  induction digits with
  | nil => rfl
  | cons digit digits ih =>
      rw [List.reverse_cons, digitProduct_append, ih]
      simp [digitProduct, transpose_mul]

@[simp] theorem transpose_a11 (A : NatMatrix2) :
    (transpose A).a11 = A.a11 := rfl

@[simp] theorem transpose_a12 (A : NatMatrix2) :
    (transpose A).a12 = A.a21 := rfl

@[simp] theorem transpose_a21 (A : NatMatrix2) :
    (transpose A).a21 = A.a12 := rfl

@[simp] theorem transpose_a22 (A : NatMatrix2) :
    (transpose A).a22 = A.a22 := rfl

theorem determinant_transpose (A : NatMatrix2) :
    determinant (transpose A) = determinant A := by
  simp [determinant, transpose]
  ring

end LatticePathOrdersClassical
