import LatticePathOrdersKernel.NonlocalPaths

/-! # Hamming distance of the nonlocal family -/

namespace LatticePathOrdersKernel

open LatticePathOrders

def hammingDistance : Path → Path → Nat
  | [], right => right.length
  | left, [] => left.length
  | left :: leftTail, right :: rightTail =>
      (if left = right then 0 else 1) +
        hammingDistance leftTail rightTail

def ruPairs : Nat → Path
  | 0 => []
  | n + 1 => Step.R :: Step.U :: ruPairs n

@[simp] theorem ruPairs_length (n : Nat) : (ruPairs n).length = 2 * n := by
  induction n with
  | zero => rfl
  | succ n ih => simp [ruPairs, ih]; omega

theorem hammingDistance_append
    (leftPrefix rightPrefix leftSuffix rightSuffix : Path)
    (hlength : leftPrefix.length = rightPrefix.length) :
    hammingDistance (leftPrefix ++ leftSuffix) (rightPrefix ++ rightSuffix) =
      hammingDistance leftPrefix rightPrefix +
        hammingDistance leftSuffix rightSuffix := by
  induction leftPrefix generalizing rightPrefix with
  | nil =>
      have : rightPrefix = [] := List.length_eq_zero_iff.mp hlength.symm
      subst rightPrefix
      simp [hammingDistance]
  | cons left leftTail ih =>
      cases rightPrefix with
      | nil => simp at hlength
      | cons right rightTail =>
          simp only [List.cons_append, hammingDistance]
          rw [ih rightTail (by simpa using Nat.succ.inj hlength)]
          omega

@[simp] theorem hamming_ur_ru (n : Nat) :
    hammingDistance (ruPairs n) (urPairs n) = 2 * n := by
  induction n with
  | zero => rfl
  | succ n ih =>
      simp [ruPairs, urPairs, hammingDistance, ih]
      omega

theorem nonlocalX_tail_decompose (t : Nat) :
    Step.R :: (urPairs (t + 1) ++ [Step.U, Step.U]) =
      ruPairs t ++ [Step.R, Step.U, Step.R, Step.U, Step.U] := by
  induction t with
  | zero => rfl
  | succ t ih =>
      simp only [urPairs, ruPairs, List.cons_append]
      exact congrArg (fun tail => Step.R :: Step.U :: tail) ih

/-- Hamming-distance clause of manuscript Theorem `thm:nonlocal`. -/
theorem nonlocal_hamming_distance {n : Nat} (hn : 4 ≤ n) :
    hammingDistance (nonlocalX n) (nonlocalY n) = 2 * n - 6 := by
  let t := n - 4
  have hnEq : n = t + 4 := by dsimp [t]; omega
  rw [hnEq]
  unfold nonlocalX nonlocalY
  simp only [show t + 4 - 3 = t + 1 by omega,
    show t + 4 - 4 = t by omega, List.nil_append, List.cons_append]
  simp only [hammingDistance, if_pos rfl, Nat.zero_add]
  rw [nonlocalX_tail_decompose]
  rw [hammingDistance_append (ruPairs t) (urPairs t)
    [Step.R, Step.U, Step.R, Step.U, Step.U]
    [Step.R, Step.U, Step.U, Step.R, Step.U] (by simp)]
  simp [hammingDistance]
  omega

end LatticePathOrdersKernel
