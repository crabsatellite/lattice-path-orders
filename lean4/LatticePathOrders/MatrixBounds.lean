import LatticePathOrders.MatrixScore

namespace LatticePathOrders
namespace Mat2

/-! Entrywise interval arithmetic for the nonnegative two-by-two matrices. -/

def LE (A B : Mat2) : Prop :=
  A.a11 ≤ B.a11 ∧ A.a12 ≤ B.a12 ∧ A.a21 ≤ B.a21 ∧ A.a22 ≤ B.a22

theorem le_refl (A : Mat2) : LE A A := ⟨le_rfl, le_rfl, le_rfl, le_rfl⟩

theorem le_trans {A B C : Mat2} (hAB : LE A B) (hBC : LE B C) : LE A C :=
  ⟨hAB.1.trans hBC.1,
   hAB.2.1.trans hBC.2.1,
   hAB.2.2.1.trans hBC.2.2.1,
   hAB.2.2.2.trans hBC.2.2.2⟩

theorem mul_mono_left (P : Mat2) {A B : Mat2} (h : LE A B) :
    LE (P * A) (P * B) := by
  refine ⟨?_, ?_, ?_, ?_⟩ <;>
    simp only [mul_def, mul]
  · exact Nat.add_le_add (Nat.mul_le_mul_left P.a11 h.1)
      (Nat.mul_le_mul_left P.a12 h.2.2.1)
  · exact Nat.add_le_add (Nat.mul_le_mul_left P.a11 h.2.1)
      (Nat.mul_le_mul_left P.a12 h.2.2.2)
  · exact Nat.add_le_add (Nat.mul_le_mul_left P.a21 h.1)
      (Nat.mul_le_mul_left P.a22 h.2.2.1)
  · exact Nat.add_le_add (Nat.mul_le_mul_left P.a21 h.2.1)
      (Nat.mul_le_mul_left P.a22 h.2.2.2)

theorem mul_mono_right {A B : Mat2} (h : LE A B) (S : Mat2) :
    LE (A * S) (B * S) := by
  refine ⟨?_, ?_, ?_, ?_⟩ <;>
    simp only [mul_def, mul]
  · exact Nat.add_le_add (Nat.mul_le_mul_right S.a11 h.1)
      (Nat.mul_le_mul_right S.a21 h.2.1)
  · exact Nat.add_le_add (Nat.mul_le_mul_right S.a12 h.1)
      (Nat.mul_le_mul_right S.a22 h.2.1)
  · exact Nat.add_le_add (Nat.mul_le_mul_right S.a11 h.2.2.1)
      (Nat.mul_le_mul_right S.a21 h.2.2.2)
  · exact Nat.add_le_add (Nat.mul_le_mul_right S.a12 h.2.2.1)
      (Nat.mul_le_mul_right S.a22 h.2.2.2)

theorem mul_mono {A B C D : Mat2} (hAB : LE A B) (hCD : LE C D) :
    LE (A * C) (B * D) :=
  le_trans (mul_mono_right hAB C) (mul_mono_left B hCD)

def pow (A : Mat2) : Nat → Mat2
  | 0 => 1
  | n + 1 => A * pow A n

@[simp] theorem pow_zero (A : Mat2) : pow A 0 = 1 := rfl
@[simp] theorem pow_succ (A : Mat2) (n : Nat) : pow A (n + 1) = A * pow A n := rfl

theorem pow_mono {A B : Mat2} (h : LE A B) : ∀ n, LE (pow A n) (pow B n)
  | 0 => le_refl 1
  | n + 1 => mul_mono h (pow_mono h n)

theorem D_le_E : LE D E := by
  norm_num [LE, D, E, T, Mat2.mul_def, Mat2.mul]

def Between (A : Mat2) : Prop := LE D A ∧ LE A E

theorem D_between : Between D := ⟨le_refl D, D_le_E⟩
theorem E_between : Between E := ⟨D_le_E, le_refl E⟩

def productR : List Mat2 → Mat2
  | [] => 1
  | A :: As => A * productR As

theorem matrixProduct_eq_productR (xs : List Mat2) : matrixProduct xs = productR xs := by
  have hprod : productR xs =
      List.foldr (· * · : Mat2 → Mat2 → Mat2) 1 xs := by
    induction xs with
    | nil => rfl
    | cons A As ih => simp [productR, ih]
  rw [hprod]
  exact (List.foldr_eq_foldl (f := (· * · : Mat2 → Mat2 → Mat2))
    (init := (1 : Mat2)) (xs := xs)).symm

theorem productR_bounds : ∀ {xs : List Mat2},
    (∀ A ∈ xs, Between A) →
      LE (pow D xs.length) (productR xs) ∧ LE (productR xs) (pow E xs.length)
  | [], _ => ⟨le_refl 1, le_refl 1⟩
  | A :: As, h => by
      have hA : Between A := h A (by simp)
      have hAs : ∀ B ∈ As, Between B := by
        intro B hB
        exact h B (by simp [hB])
      have ih := productR_bounds hAs
      simp only [List.length_cons, productR, pow_succ]
      exact ⟨mul_mono hA.1 ih.1, mul_mono hA.2 ih.2⟩

theorem matrixProduct_bounds {xs : List Mat2}
    (h : ∀ A ∈ xs, Between A) :
    LE (pow D xs.length) (matrixProduct xs) ∧
      LE (matrixProduct xs) (pow E xs.length) := by
  rw [matrixProduct_eq_productR]
  exact productR_bounds h

end Mat2
end LatticePathOrders
