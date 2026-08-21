import Mathlib.Data.List.Basic
import Mathlib.Tactic.Ring

/-!
# Finite continued fractions from the kernel

This file is deliberately independent of the lattice-path development.  It
proves the continuant/matrix identity used to evaluate finite continued
fractions.  No theorem from the snake-graph or continued-fraction literature is
imported.
-/

namespace LatticePathOrdersClassical

/-- A minimal natural two-by-two matrix. -/
@[ext] structure NatMatrix2 where
  a11 : Nat
  a12 : Nat
  a21 : Nat
  a22 : Nat
deriving DecidableEq, Repr

namespace NatMatrix2

def one : NatMatrix2 := ⟨1, 0, 0, 1⟩

def mul (A B : NatMatrix2) : NatMatrix2 :=
  ⟨A.a11 * B.a11 + A.a12 * B.a21,
   A.a11 * B.a12 + A.a12 * B.a22,
   A.a21 * B.a11 + A.a22 * B.a21,
   A.a21 * B.a12 + A.a22 * B.a22⟩

instance : One NatMatrix2 := ⟨one⟩
instance : Mul NatMatrix2 := ⟨mul⟩

@[simp] theorem one_a11 : (1 : NatMatrix2).a11 = 1 := rfl
@[simp] theorem one_a12 : (1 : NatMatrix2).a12 = 0 := rfl
@[simp] theorem one_a21 : (1 : NatMatrix2).a21 = 0 := rfl
@[simp] theorem one_a22 : (1 : NatMatrix2).a22 = 1 := rfl

@[simp] theorem mul_a11 (A B : NatMatrix2) :
    (A * B).a11 = A.a11 * B.a11 + A.a12 * B.a21 := rfl

@[simp] theorem mul_a12 (A B : NatMatrix2) :
    (A * B).a12 = A.a11 * B.a12 + A.a12 * B.a22 := rfl

@[simp] theorem mul_a21 (A B : NatMatrix2) :
    (A * B).a21 = A.a21 * B.a11 + A.a22 * B.a21 := rfl

@[simp] theorem mul_a22 (A B : NatMatrix2) :
    (A * B).a22 = A.a21 * B.a12 + A.a22 * B.a22 := rfl

theorem mul_assoc (A B C : NatMatrix2) : (A * B) * C = A * (B * C) := by
  ext <;> simp <;> ring

@[simp] theorem one_mul (A : NatMatrix2) : 1 * A = A := by
  ext <;> simp

@[simp] theorem mul_one (A : NatMatrix2) : A * 1 = A := by
  ext <;> simp

end NatMatrix2

/-- The standard continued-fraction digit matrix. -/
def digitMatrix (a : Nat) : NatMatrix2 := ⟨a, 1, 1, 0⟩

/-- Matrix product in the literal left-to-right order of the digit word. -/
def digitProduct : List Nat → NatMatrix2
  | [] => 1
  | a :: tail => digitMatrix a * digitProduct tail

mutual
  /-- The numerator continuant `K(a₁,...,aₙ)`, with `K() = 1`. -/
  def continuant : List Nat → Nat
    | [] => 1
    | a :: tail => a * continuant tail + denominatorContinuant tail

  /-- The companion denominator, equal to `K(a₂,...,aₙ)` on a nonempty word. -/
  def denominatorContinuant : List Nat → Nat
    | [] => 0
    | _ :: tail => continuant tail
end

@[simp] theorem continuant_nil : continuant [] = 1 := rfl

@[simp] theorem continuant_cons (a : Nat) (tail : List Nat) :
    continuant (a :: tail) =
      a * continuant tail + denominatorContinuant tail := rfl

@[simp] theorem denominatorContinuant_nil : denominatorContinuant [] = 0 := rfl

@[simp] theorem denominatorContinuant_cons (a : Nat) (tail : List Nat) :
    denominatorContinuant (a :: tail) = continuant tail := rfl

/-- The first column of the digit product is exactly the pair of continuants. -/
theorem digitProduct_firstColumn (digits : List Nat) :
    (digitProduct digits).a11 = continuant digits ∧
      (digitProduct digits).a21 = denominatorContinuant digits := by
  induction digits with
  | nil => simp [digitProduct]
  | cons a tail ih =>
      rcases ih with ⟨ih11, ih21⟩
      constructor
      · simp [digitProduct, digitMatrix, ih11, ih21]
      · simp [digitProduct, digitMatrix, ih11]

theorem digitProduct_a11 (digits : List Nat) :
    (digitProduct digits).a11 = continuant digits :=
  (digitProduct_firstColumn digits).1

theorem digitProduct_a21 (digits : List Nat) :
    (digitProduct digits).a21 = denominatorContinuant digits :=
  (digitProduct_firstColumn digits).2

/-- The exact finite continued-fraction value, represented in `Rat`. -/
def finiteContinuedFraction (digits : List Nat) : Rat :=
  (continuant digits : Rat) / (denominatorContinuant digits : Rat)

theorem finiteContinuedFraction_eq_matrixRatio (digits : List Nat) :
    finiteContinuedFraction digits =
      ((digitProduct digits).a11 : Rat) / ((digitProduct digits).a21 : Rat) := by
  rw [finiteContinuedFraction, digitProduct_a11, digitProduct_a21]

end LatticePathOrdersClassical
