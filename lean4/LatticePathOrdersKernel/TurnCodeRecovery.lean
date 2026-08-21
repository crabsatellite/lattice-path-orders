import LatticePathOrders.MinimalityCertificate

/-!
# Recovering a binary step word from its cyclic turn code
-/

namespace LatticePathOrdersKernel

open LatticePathOrders

def stepEq (left right : Step) : Bool := decide (left = right)

def turnCodeTo (terminal : Step) : Path → List Bool
  | [] => []
  | [current] => [stepEq current terminal]
  | current :: next :: tail =>
      stepEq current next :: turnCodeTo terminal (next :: tail)

theorem turnCodeTo_length (terminal : Step) : (word : Path) →
    (turnCodeTo terminal word).length = word.length
  | [] => rfl
  | [_] => rfl
  | current :: next :: rest => by
      simp only [turnCodeTo, List.length_cons]
      exact congrArg Nat.succ (turnCodeTo_length terminal (next :: rest))
termination_by word => word.length

def adjacentZipCode (word : Path) : List Bool :=
  (word.zip word.tail).map fun pair => stepEq pair.1 pair.2

theorem adjacentZipCode_append_terminal (terminal current : Step)
    (tail : Path) :
    adjacentZipCode ((current :: tail) ++ [terminal]) =
      turnCodeTo terminal (current :: tail) := by
  induction tail generalizing current with
  | nil => simp [adjacentZipCode, turnCodeTo, stepEq]
  | cons next rest ih =>
      simp only [List.cons_append, List.tail_cons, List.zip_cons_cons,
        List.map_cons, adjacentZipCode, turnCodeTo]
      congr 1
      exact ih next

theorem closedTurnCode_eq_turnCodeTo {first next : Step} {tail : Path} :
    closedTurnCode (first :: next :: tail) =
      turnCodeTo first (first :: next :: tail) := by
  change adjacentZipCode ((first :: next :: tail) ++ [first]) = _
  exact adjacentZipCode_append_terminal first first (next :: tail)

theorem step_eq_test_injective (current left right : Step)
    (h : stepEq current left = stepEq current right) : left = right := by
  cases current <;> cases left <;> cases right <;>
    simp [stepEq] at h ⊢

theorem turnCodeTo_recover :
    ∀ {terminalLeft terminalRight currentLeft currentRight : Step}
      {tailLeft tailRight : Path},
      terminalLeft = terminalRight →
      currentLeft = currentRight →
      (currentLeft :: tailLeft).length = (currentRight :: tailRight).length →
      turnCodeTo terminalLeft (currentLeft :: tailLeft) =
        turnCodeTo terminalRight (currentRight :: tailRight) →
      currentLeft :: tailLeft = currentRight :: tailRight
  | terminalLeft, terminalRight, currentLeft, currentRight,
      [], [], _, hcurrent, _, _ => by simp [hcurrent]
  | terminalLeft, terminalRight, currentLeft, currentRight,
      [], _ :: _, _, _, hlength, _ => by simp at hlength
  | terminalLeft, terminalRight, currentLeft, currentRight,
      _ :: _, [], _, _, hlength, _ => by simp at hlength
  | terminalLeft, terminalRight, currentLeft, currentRight,
      nextLeft :: restLeft, nextRight :: restRight,
      hterminal, hcurrent, hlength, hcode => by
      have htest : stepEq currentLeft nextLeft =
          stepEq currentRight nextRight := by
        simpa [turnCodeTo] using congrArg List.head? hcode
      subst currentRight
      have hnext : nextLeft = nextRight :=
        step_eq_test_injective currentLeft nextLeft nextRight htest
      subst nextRight
      have htailCode :
          turnCodeTo terminalLeft (nextLeft :: restLeft) =
            turnCodeTo terminalRight (nextLeft :: restRight) := by
        simpa [turnCodeTo] using congrArg List.tail hcode
      have htailLength :
          (nextLeft :: restLeft).length = (nextLeft :: restRight).length := by
        simpa using Nat.succ.inj hlength
      have htail := turnCodeTo_recover hterminal rfl htailLength htailCode
      simpa using congrArg (currentLeft :: ·) htail
termination_by terminalLeft terminalRight currentLeft currentRight tailLeft tailRight =>
  tailLeft.length

theorem closedTurnCode_recover_of_heads {left right : Path}
    (hleft : 2 ≤ left.length) (hright : 2 ≤ right.length)
    (hlength : left.length = right.length)
    (hheads : left.head? = right.head?)
    (hcode : closedTurnCode left = closedTurnCode right) : left = right := by
  rcases left with _ | ⟨firstLeft, _ | ⟨nextLeft, tailLeft⟩⟩
  · simp at hleft
  · simp at hleft
  rcases right with _ | ⟨firstRight, _ | ⟨nextRight, tailRight⟩⟩
  · simp at hright
  · simp at hright
  simp only [List.head?_cons, Option.some.injEq] at hheads
  rw [closedTurnCode_eq_turnCodeTo, closedTurnCode_eq_turnCodeTo] at hcode
  exact turnCodeTo_recover hheads hheads hlength hcode

def flipStep : Step → Step
  | .R => .U
  | .U => .R

@[simp] theorem flipStep_flipStep (step : Step) : flipStep (flipStep step) = step := by
  cases step <;> rfl

theorem stepEq_flip (left right : Step) :
    stepEq (flipStep left) (flipStep right) = stepEq left right := by
  cases left <;> cases right <;> rfl

theorem turnCodeTo_map_flip (terminal : Step) (word : Path) :
    turnCodeTo (flipStep terminal) (word.map flipStep) =
      turnCodeTo terminal word := by
  induction word with
  | nil => rfl
  | cons current tail ih =>
      cases tail with
      | nil => simp [turnCodeTo, stepEq_flip]
      | cons next rest =>
          simp only [List.map_cons, turnCodeTo, stepEq_flip]
          exact congrArg (stepEq current next :: ·) ih

theorem closedTurnCode_map_flip {word : Path} (hlength : 2 ≤ word.length) :
    closedTurnCode (word.map flipStep) = closedTurnCode word := by
  rcases word with _ | ⟨first, _ | ⟨next, tail⟩⟩
  · simp at hlength
  · simp at hlength
  simp only [List.map_cons]
  rw [closedTurnCode_eq_turnCodeTo, closedTurnCode_eq_turnCodeTo]
  exact turnCodeTo_map_flip first (first :: next :: tail)

theorem heads_equal_or_flip_equal {left right : Step} :
    left = right ∨ flipStep left = right := by
  cases left <;> cases right <;> simp [flipStep]

theorem closedTurnCode_recovers_up_to_flip {left right : Path}
    (hleft : 2 ≤ left.length) (hright : 2 ≤ right.length)
    (hlength : left.length = right.length)
    (hcode : closedTurnCode left = closedTurnCode right) :
    left = right ∨ left.map flipStep = right := by
  rcases left with _ | ⟨leftHead, _ | ⟨leftNext, leftTail⟩⟩
  · simp at hleft
  · simp at hleft
  rcases right with _ | ⟨rightHead, _ | ⟨rightNext, rightTail⟩⟩
  · simp at hright
  · simp at hright
  rcases heads_equal_or_flip_equal (left := leftHead) (right := rightHead) with
    hheads | hheads
  · left
    apply closedTurnCode_recover_of_heads hleft hright hlength
    · simpa [hheads]
    · exact hcode
  · right
    have hmapLength :
        2 ≤ ((leftHead :: leftNext :: leftTail).map flipStep).length := by
      simpa
    apply closedTurnCode_recover_of_heads hmapLength hright
      (by simpa using hlength)
    · simpa [hheads]
    · rw [closedTurnCode_map_flip hleft]
      exact hcode

end LatticePathOrdersKernel
