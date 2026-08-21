import LatticePathOrdersKernel.InitialLevelPaths

/-! # Recovery of a step word from its open adjacency-block word -/

namespace LatticePathOrdersKernel

open LatticePathOrders

theorem edgeBlock_recover_next
    (current left right : Step)
    (h : edgeBlock current left = edgeBlock current right) : left = right := by
  cases current <;> cases left <;> cases right <;>
    simp [edgeBlock, D, E, T, Mat2.mul] at h ⊢

theorem adjacencyBlocks_recover_from_head :
    ∀ (current : Step) (leftTail rightTail : Path),
      leftTail.length = rightTail.length →
      adjacencyBlocks (current :: leftTail) =
        adjacencyBlocks (current :: rightTail) →
      leftTail = rightTail
  | _, [], [], _, _ => rfl
  | _, [], _ :: _, hlength, _ => by simp at hlength
  | _, _ :: _, [], hlength, _ => by simp at hlength
  | current, leftNext :: leftRest, rightNext :: rightRest,
      hlength, hblocks => by
      rw [adjacencyBlocks_cons, adjacencyBlocks_cons] at hblocks
      simp only [edgeBlocks] at hblocks
      have hfirst := congrArg List.head? hblocks
      simp only [List.head?_cons, Option.some.injEq] at hfirst
      have hnext := edgeBlock_recover_next current leftNext rightNext hfirst
      subst rightNext
      have htailBlocks := congrArg List.tail hblocks
      simp only [List.tail_cons] at htailBlocks
      have hrestLength : leftRest.length = rightRest.length := by
        simpa using Nat.succ.inj hlength
      have hrest := adjacencyBlocks_recover_from_head leftNext
        leftRest rightRest hrestLength (by
          rw [adjacencyBlocks_cons, adjacencyBlocks_cons]
          exact htailBlocks)
      exact congrArg (leftNext :: ·) hrest
termination_by _ leftTail _ => leftTail.length

theorem carrier_adjacencyBlocks_injective
    {a b : Nat} (ha : 0 < a)
    {left right : Path} (hleft : Carrier a b left)
    (hright : Carrier a b right)
    (hblocks : adjacencyBlocks left = adjacencyBlocks right) :
    left = right := by
  rcases carrier_starts_R ha hleft with ⟨leftTail, hleftEq⟩
  rcases carrier_starts_R ha hright with ⟨rightTail, hrightEq⟩
  simp only [List.singleton_append] at hleftEq hrightEq
  subst left
  subst right
  have hlength : leftTail.length = rightTail.length := by
    have hl := carrier_length hleft
    have hr := carrier_length hright
    simp only [List.length_cons] at hl hr
    omega
  exact congrArg (Step.R :: ·)
    (adjacencyBlocks_recover_from_head Step.R leftTail rightTail
      hlength hblocks)

theorem adjacencyBlocks_injective_of_same_head
    {head : Step} {leftTail rightTail : Path}
    (hlength : leftTail.length = rightTail.length)
    (hblocks : adjacencyBlocks (head :: leftTail) =
      adjacencyBlocks (head :: rightTail)) :
    head :: leftTail = head :: rightTail :=
  congrArg (head :: ·)
    (adjacencyBlocks_recover_from_head head leftTail rightTail hlength hblocks)

end LatticePathOrdersKernel
