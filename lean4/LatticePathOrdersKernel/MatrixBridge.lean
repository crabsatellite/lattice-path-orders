import LatticePathOrders.MatrixBounds
import LatticePathOrdersKernel.PathDomain

/-!
# Bridge between the cached project matrices and the classical proof layer

The two representations are related entry by entry.  This file is project
mathematics: it contains no source theorem and no admitted semantic transport.
-/

namespace LatticePathOrdersKernel

open LatticePathOrders

def toClassicalMatrix (A : Mat2) :
    LatticePathOrdersClassical.NatMatrix2 :=
  ⟨A.a11, A.a12, A.a21, A.a22⟩

@[simp] theorem toClassicalMatrix_a11 (A : Mat2) :
    (toClassicalMatrix A).a11 = A.a11 := rfl

@[simp] theorem toClassicalMatrix_a12 (A : Mat2) :
    (toClassicalMatrix A).a12 = A.a12 := rfl

@[simp] theorem toClassicalMatrix_a21 (A : Mat2) :
    (toClassicalMatrix A).a21 = A.a21 := rfl

@[simp] theorem toClassicalMatrix_a22 (A : Mat2) :
    (toClassicalMatrix A).a22 = A.a22 := rfl

@[simp] theorem toClassicalMatrix_one :
    toClassicalMatrix (1 : Mat2) =
      (1 : LatticePathOrdersClassical.NatMatrix2) := rfl

@[simp] theorem toClassicalMatrix_mul (A B : Mat2) :
    toClassicalMatrix (A * B) = toClassicalMatrix A * toClassicalMatrix B := by
  ext <;> rfl

@[simp] theorem toClassicalMatrix_T (digit : Nat) :
    toClassicalMatrix (T digit) =
      LatticePathOrdersClassical.digitMatrix digit := rfl

theorem toClassicalMatrix_productR (matrices : List Mat2) :
    toClassicalMatrix (Mat2.productR matrices) =
      matrices.foldr (fun A result => toClassicalMatrix A * result) 1 := by
  induction matrices with
  | nil => rfl
  | cons A tail ih =>
      change toClassicalMatrix (A * Mat2.productR tail) = _
      rw [toClassicalMatrix_mul, ih]
      rfl

theorem digitProduct_bridge (digits : List Nat) :
    toClassicalMatrix (LatticePathOrders.digitProduct digits) =
      LatticePathOrdersClassical.digitProduct digits := by
  unfold LatticePathOrders.digitProduct
  rw [Mat2.matrixProduct_eq_productR]
  induction digits with
  | nil => rfl
  | cons digit tail ih =>
      change toClassicalMatrix (T digit * Mat2.productR (tail.map T)) = _
      rw [toClassicalMatrix_mul, toClassicalMatrix_T, ih]
      rfl

theorem matrixProduct_adjacency_bridge (w : Path) :
    toClassicalMatrix (matrixProduct (adjacencyBlocks w)) =
      LatticePathOrdersClassical.digitProduct (adjacencyDigits w) := by
  rw [Mat2.matrixProduct_eq_productR]
  induction w with
  | nil => rfl
  | cons first tail ih =>
      cases tail with
      | nil => rfl
      | cons next rest =>
          by_cases hsame : first = next
          · subst first
            simp only [adjacencyBlocks, adjacencyDigits, if_pos,
              Mat2.productR, E]
            rw [toClassicalMatrix_mul, toClassicalMatrix_mul,
              toClassicalMatrix_T, ih]
            exact LatticePathOrdersClassical.NatMatrix2.mul_assoc _ _ _
          · simp only [adjacencyBlocks, adjacencyDigits, hsame,
              Mat2.productR, D]
            change toClassicalMatrix
              (T 2 * Mat2.productR (adjacencyBlocks (next :: rest))) = _
            rw [toClassicalMatrix_mul, toClassicalMatrix_T, ih]
            simp [LatticePathOrdersClassical.digitProduct]

theorem matchingScore_eq_continuant (w : Path) :
    matchingScore w =
      LatticePathOrdersClassical.continuant (adjacencyDigits w) := by
  unfold matchingScore
  rw [← LatticePathOrdersClassical.digitProduct_a11]
  exact congrArg LatticePathOrdersClassical.NatMatrix2.a11
    (matrixProduct_adjacency_bridge w)

theorem trace_bridge (digits : List Nat) :
    (LatticePathOrders.digitProduct digits).trace =
      LatticePathOrdersClassical.trace
        (LatticePathOrdersClassical.digitProduct digits) := by
  unfold Mat2.trace LatticePathOrdersClassical.trace
  have h := digitProduct_bridge digits
  exact congrArg
    (fun A : LatticePathOrdersClassical.NatMatrix2 => A.a11 + A.a22) h

theorem lowerLeft_bridge (digits : List Nat) :
    (LatticePathOrders.digitProduct digits).a21 =
      (LatticePathOrdersClassical.digitProduct digits).a21 := by
  exact congrArg LatticePathOrdersClassical.NatMatrix2.a21
    (digitProduct_bridge digits)

end LatticePathOrdersKernel
