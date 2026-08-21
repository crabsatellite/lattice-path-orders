import LatticePathOrdersKernel.PellExtrema

/-!
# Pell powers and the three-`E` expansion

This file proves the matrix power displayed before manuscript formula
`eq:three-E`, then proves that formula by expanding `E=D+H` inside the exact
adjacency-block product.
-/

namespace LatticePathOrdersKernel

open LatticePathOrders

def pellPrevious : Nat → Nat
  | 0 => 1
  | n + 1 => pell n

@[simp] theorem pellPrevious_zero : pellPrevious 0 = 1 := rfl
@[simp] theorem pellPrevious_succ (n : Nat) : pellPrevious (n + 1) = pell n := rfl

/-- The manuscript identity
`D^j=[[P_{j+1},P_j],[P_j,P_{j-1}]]`, including `P_{-1}=1`. -/
theorem pow_D_pell (j : Nat) :
    Mat2.pow D j =
      ⟨pell (j + 1), pell j, pell j, pellPrevious j⟩ := by
  induction j with
  | zero => decide
  | succ j ih =>
      rw [Mat2.pow_succ, ih]
      ext <;> simp only [Mat2.mul_def, Mat2.mul, D, T,
        pellPrevious_succ, Nat.mul_one, Nat.one_mul, Nat.zero_mul,
        Nat.add_zero]
      · change 2 * pell (j + 1) + pell j = pell (j + 1 + 1)
        simpa [show j + 1 + 1 = j + 2 by omega] using (pell_add_two j).symm
      · change 2 * pell j + pellPrevious j = pell (j + 1)
        cases j with
        | zero => decide
        | succ k =>
            simpa [show k + 1 + 1 = k + 2 by omega] using
              (pell_add_two k).symm

theorem pow_D_mul_pow_D (left right : Nat) :
    Mat2.pow D left * Mat2.pow D right = Mat2.pow D (left + right) := by
  induction left with
  | zero => simpa using Mat2.one_mul (Mat2.pow D right)
  | succ left ih =>
      rw [show left + 1 = left + 1 by rfl, Mat2.pow_succ]
      rw [show left + 1 + right = (left + right) + 1 by omega,
        Mat2.pow_succ, ← ih]
      exact Mat2.mul_assoc _ _ _

theorem pow_D_one : Mat2.pow D 1 = D := by
  change D * (1 : Mat2) = D
  exact Mat2.mul_one D

theorem pow_D_mul_D (n : Nat) :
    Mat2.pow D n * D = Mat2.pow D (n + 1) := by
  calc
    Mat2.pow D n * D = Mat2.pow D n * Mat2.pow D 1 := by rw [pow_D_one]
    _ = Mat2.pow D (n + 1) := pow_D_mul_pow_D n 1

theorem two_E_expansion (A B C : Mat2) :
    (A * E * B * E * C).a11 =
      (A * D * B * D * C).a11 +
        A.a12 * (B * D * C).a21 +
        (A * D * B).a12 * C.a21 +
        A.a12 * B.a22 * C.a21 := by
  cases A
  cases B
  cases C
  simp [Mat2.mul, D, E, T]
  ring

theorem E_left_a11_eq_D_left (Q : Mat2) :
    (E * Q).a11 = (D * Q).a11 := by
  cases Q
  simp [Mat2.mul, D, E, T]

def threeEBlockProduct (m i j : Nat) : Mat2 :=
  E * Mat2.pow D (i - 1) * E * Mat2.pow D (j - i - 1) * E *
    Mat2.pow D (m - 1 - j)

def threeEInteraction (m i j : Nat) : Nat :=
  pell i * pellPrevious (j - i - 1) * pell (m - 1 - j)

theorem threeE_initial_reduce
    {m i j : Nat} (hi : 1 ≤ i) :
    (threeEBlockProduct m i j).a11 =
      (Mat2.pow D i * E * Mat2.pow D (j - i - 1) * E *
        Mat2.pow D (m - 1 - j)).a11 := by
  unfold threeEBlockProduct
  let Q := Mat2.pow D (i - 1) * E * Mat2.pow D (j - i - 1) * E *
    Mat2.pow D (m - 1 - j)
  have hleft := E_left_a11_eq_D_left Q
  have hiEq : 1 + (i - 1) = i := by omega
  have hpow : D * Mat2.pow D (i - 1) = Mat2.pow D i := by
    rw [show D * Mat2.pow D (i - 1) =
      Mat2.pow D 1 * Mat2.pow D (i - 1) by rw [pow_D_one],
      pow_D_mul_pow_D, hiEq]
  calc
    (E * Mat2.pow D (i - 1) * E * Mat2.pow D (j - i - 1) * E *
        Mat2.pow D (m - 1 - j)).a11 = (E * Q).a11 := by
      simp only [Q, Mat2.mul_assoc]
    _ = (D * Q).a11 := hleft
    _ = (Mat2.pow D i * E * Mat2.pow D (j - i - 1) * E *
        Mat2.pow D (m - 1 - j)).a11 := by
      rw [show D * Q =
        (D * Mat2.pow D (i - 1)) * E * Mat2.pow D (j - i - 1) * E *
          Mat2.pow D (m - 1 - j) by simp only [Q, Mat2.mul_assoc], hpow]

theorem pow_D_five
    {m i j : Nat} (hi : 1 ≤ i) (hij : i < j) (hjm : j ≤ m - 1) :
    Mat2.pow D i * D * Mat2.pow D (j - i - 1) * D *
        Mat2.pow D (m - 1 - j) =
      Mat2.pow D m := by
  rw [pow_D_mul_D, pow_D_mul_pow_D, pow_D_mul_D, pow_D_mul_pow_D]
  congr 1
  omega

theorem pow_D_suffix
    {m i j : Nat} (hij : i < j) (hjm : j ≤ m - 1) :
    Mat2.pow D (j - i - 1) * D * Mat2.pow D (m - 1 - j) =
      Mat2.pow D (m - 1 - i) := by
  rw [pow_D_mul_D, pow_D_mul_pow_D]
  congr 1
  omega

theorem pow_D_prefix
    {i j : Nat} (hij : i < j) :
    Mat2.pow D i * D * Mat2.pow D (j - i - 1) = Mat2.pow D j := by
  rw [pow_D_mul_D, pow_D_mul_pow_D]
  congr 1
  omega

/-- Manuscript formula `eq:three-E`, with the stated `P_{-1}=1`
convention represented by `pellPrevious 0`. -/
theorem three_E_formula
    {m i j : Nat} (hi : 1 ≤ i) (hij : i < j) (hjm : j ≤ m - 1) :
    (threeEBlockProduct m i j).a11 =
      pell (m + 1) + pellF (m - 1) i + pellF (m - 1) j +
        threeEInteraction m i j := by
  rw [threeE_initial_reduce hi]
  let A := Mat2.pow D i
  let B := Mat2.pow D (j - i - 1)
  let C := Mat2.pow D (m - 1 - j)
  change (A * E * B * E * C).a11 = _
  rw [two_E_expansion]
  have hbase := congrArg Mat2.a11 (pow_D_five hi hij hjm)
  have hsuffix := congrArg Mat2.a21 (pow_D_suffix hij hjm)
  have hprefix := congrArg Mat2.a12 (pow_D_prefix hij)
  dsimp [A, B, C] at hbase hsuffix hprefix ⊢
  rw [hbase, hsuffix, hprefix]
  simp only [pow_D_pell]
  unfold pellF threeEInteraction
  rfl

end LatticePathOrdersKernel
