import LatticePathOrders.Basic

namespace LatticePathOrders

/-- A deliberately small two-by-two natural matrix used by every score
certificate.  Keeping the carrier explicit makes generated data ordinary
kernel-reduced arithmetic. -/
@[ext] structure Mat2 where
  a11 : Nat
  a12 : Nat
  a21 : Nat
  a22 : Nat
deriving DecidableEq, Repr

namespace Mat2

def one : Mat2 := ⟨1, 0, 0, 1⟩

def mul (A B : Mat2) : Mat2 :=
  ⟨A.a11 * B.a11 + A.a12 * B.a21,
   A.a11 * B.a12 + A.a12 * B.a22,
   A.a21 * B.a11 + A.a22 * B.a21,
   A.a21 * B.a12 + A.a22 * B.a22⟩

instance : Mul Mat2 := ⟨mul⟩
instance : One Mat2 := ⟨one⟩

@[simp] theorem mul_def (A B : Mat2) : A * B = mul A B := rfl

@[simp] theorem one_def : (1 : Mat2) = one := rfl

theorem mul_assoc (A B C : Mat2) : (A * B) * C = A * (B * C) := by
  ext <;> simp [mul] <;> ring

@[simp] theorem one_mul (A : Mat2) : 1 * A = A := by
  ext <;> simp [mul, one]

@[simp] theorem mul_one (A : Mat2) : A * 1 = A := by
  ext <;> simp [mul, one]

instance : Std.Associative (· * · : Mat2 → Mat2 → Mat2) :=
  ⟨mul_assoc⟩

instance : Std.LawfulIdentity (· * · : Mat2 → Mat2 → Mat2) 1 where
  left_id := one_mul
  right_id := mul_one

def trace (A : Mat2) : Nat := A.a11 + A.a22

end Mat2

def T (c : Nat) : Mat2 := ⟨c, 1, 1, 0⟩

def D : Mat2 := T 2

def E : Mat2 := T 1 * T 1

def matrixProduct (xs : List Mat2) : Mat2 := xs.foldl (· * ·) 1

def digitProduct (xs : List Nat) : Mat2 := matrixProduct (xs.map T)

def adjacencyDigits : Path → List Nat
  | [] | [_] => []
  | x :: y :: xs =>
      (if x = y then [1, 1] else [2]) ++ adjacencyDigits (y :: xs)

def adjacencyBlocks : Path → List Mat2
  | [] | [_] => []
  | x :: y :: xs =>
      (if x = y then E else D) :: adjacencyBlocks (y :: xs)

def matchingScore (w : Path) : Nat :=
  (matrixProduct (adjacencyBlocks w)).a11

def cyclicDigits (w : Path) : List Nat := 2 :: adjacencyDigits w

def rotations {α : Type} (xs : List α) : List (List α) :=
  (List.range xs.length).map fun k => xs.rotate k

def lowerLeftValues (digits : List Nat) : List Nat :=
  (rotations digits).map fun r => (digitProduct r).a21

def qMin (digits : List Nat) : Nat :=
  (lowerLeftValues digits).min?.getD 1

def lagrangeNumerator (w : Path) : Nat :=
  let tr := (digitProduct (cyclicDigits w)).trace
  tr ^ 2 - 4

/-- The exact rational square used to compare the positive Lagrange values. -/
def lagrangeSq (w : Path) : Rat :=
  (lagrangeNumerator w : Rat) / ((qMin (cyclicDigits w) ^ 2 : Nat) : Rat)

/-- Cyclic equality/difference code of the closed step word.  It is the
tile-turn code used in the band-graph certificate. -/
def closedTurnCode : Path → List Bool
  | [] | [_] => []
  | w =>
      let closed := w ++ [w.head!]
      (closed.zip closed.tail).map fun xy => xy.1 = xy.2

def dihedralOrbit {α : Type} (xs : List α) : List (List α) :=
  rotations xs ++ rotations xs.reverse

def dihedralEq {α : Type} [DecidableEq α] (xs ys : List α) : Bool :=
  ys ∈ dihedralOrbit xs

end LatticePathOrders
