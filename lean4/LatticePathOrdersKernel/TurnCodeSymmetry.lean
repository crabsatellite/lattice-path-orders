import LatticePathOrdersKernel.TurnCodeRecovery

/-!
# Rotation and reversal of the cyclic turn code
-/

namespace LatticePathOrdersKernel

open LatticePathOrders

def cyclicZipCode (word : Path) : List Bool :=
  List.zipWith stepEq word (word.rotate 1)

theorem zipWith_tail_append_terminal (terminal current : Step) :
    ∀ tail : Path,
      List.zipWith stepEq (current :: tail) (tail ++ [terminal]) =
        turnCodeTo terminal (current :: tail)
  | [] => by simp [turnCodeTo, stepEq]
  | next :: rest => by
      simp only [List.cons_append, List.zipWith_cons_cons, turnCodeTo]
      congr 1
      exact zipWith_tail_append_terminal terminal next rest

theorem closedTurnCode_eq_cyclicZipCode {word : Path}
    (hlength : 2 ≤ word.length) :
    closedTurnCode word = cyclicZipCode word := by
  rcases word with _ | ⟨first, _ | ⟨next, tail⟩⟩
  · simp at hlength
  · simp at hlength
  rw [closedTurnCode_eq_turnCodeTo]
  unfold cyclicZipCode
  rw [List.rotate_cons_succ]
  simpa using (zipWith_tail_append_terminal first first (next :: tail)).symm

theorem closedTurnCode_length {word : Path} (hlength : 2 ≤ word.length) :
    (closedTurnCode word).length = word.length := by
  rw [closedTurnCode_eq_cyclicZipCode hlength]
  simp [cyclicZipCode]

theorem closedTurnCode_rotate {word : Path} (hlength : 2 ≤ word.length)
    (rotation : Nat) :
    closedTurnCode (word.rotate rotation) =
      (closedTurnCode word).rotate rotation := by
  have hrotLength : 2 ≤ (word.rotate rotation).length := by simpa
  rw [closedTurnCode_eq_cyclicZipCode hrotLength,
    closedTurnCode_eq_cyclicZipCode hlength]
  unfold cyclicZipCode
  have hsecond :
      (word.rotate rotation).rotate 1 =
        (word.rotate 1).rotate rotation := by
    simp [Nat.add_comm]
  rw [hsecond]
  exact (List.zipWith_rotate_distrib stepEq word (word.rotate 1) rotation
    (by simp)).symm

theorem rotate_one_reverse_rotate_one (word : Path) :
    (word.rotate 1).reverse.rotate 1 = word.reverse := by
  cases word with
  | nil => rfl
  | cons first tail => simp

theorem stepEq_symmetric (left right : Step) :
    stepEq right left = stepEq left right := by
  cases left <;> cases right <;> rfl

theorem closedTurnCode_reverse {word : Path} (hlength : 2 ≤ word.length) :
    closedTurnCode word.reverse =
      (closedTurnCode word).reverse.rotate 1 := by
  have hreverseLength : 2 ≤ word.reverse.length := by simpa
  rw [closedTurnCode_eq_cyclicZipCode hreverseLength,
    closedTurnCode_eq_cyclicZipCode hlength]
  unfold cyclicZipCode
  rw [List.reverse_zipWith (by simp)]
  rw [List.zipWith_rotate_distrib stepEq word.reverse
    (word.rotate 1).reverse 1 (by simp)]
  rw [rotate_one_reverse_rotate_one]
  exact List.zipWith_comm_of_comm
    (fun left right => (stepEq_symmetric left right).symm)

end LatticePathOrdersKernel
