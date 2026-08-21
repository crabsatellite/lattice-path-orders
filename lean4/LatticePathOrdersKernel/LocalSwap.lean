import LatticePathOrdersKernel.MatchingBridge
import LatticePathOrders.LocalSwap
import LatticePathOrders.MatchingBounds

/-!
# Literal path form of the local `RU ↔ UR` interchange

The project-local matrix identities are lifted here to the actual path words
and the literal snake-graph perfect-matching count used in the manuscript.
The left and right exterior products contain precisely the adjacency blocks
strictly outside the three changed blocks.
-/

namespace LatticePathOrdersKernel

open LatticePathOrders

set_option maxHeartbeats 800000

theorem adjacencyBlocks_join
    (first : Step) (leftTail : Path) (rightFirst : Step) (rightTail : Path) :
    adjacencyBlocks ((first :: leftTail) ++ (rightFirst :: rightTail)) =
      adjacencyBlocks (first :: leftTail) ++
        edgeBlock (LatticePathOrders.lastAfter first leftTail) rightFirst ::
          adjacencyBlocks (rightFirst :: rightTail) := by
  change adjacencyBlocks (first :: (leftTail ++ rightFirst :: rightTail)) = _
  rw [adjacencyBlocks_cons, edgeBlocks_append]
  simp only [edgeBlocks]
  rw [← adjacencyBlocks_cons, ← adjacencyBlocks_cons]

theorem matrixProduct_adjacency_join
    (first : Step) (leftTail : Path) (rightFirst : Step) (rightTail : Path) :
    matrixProduct
        (adjacencyBlocks ((first :: leftTail) ++ (rightFirst :: rightTail))) =
      matrixProduct (adjacencyBlocks (first :: leftTail)) *
        edgeBlock (LatticePathOrders.lastAfter first leftTail) rightFirst *
          matrixProduct (adjacencyBlocks (rightFirst :: rightTail)) := by
  rw [adjacencyBlocks_join, matrixProduct_append]
  rw [show edgeBlock (LatticePathOrders.lastAfter first leftTail) rightFirst ::
      adjacencyBlocks (rightFirst :: rightTail) =
      [edgeBlock (LatticePathOrders.lastAfter first leftTail) rightFirst] ++
        adjacencyBlocks (rightFirst :: rightTail) by rfl]
  rw [matrixProduct_append]
  have hsingle : matrixProduct
      [edgeBlock (LatticePathOrders.lastAfter first leftTail) rightFirst] =
      edgeBlock (LatticePathOrders.lastAfter first leftTail) rightFirst := by
    unfold matrixProduct
    simp only [List.foldl_cons, List.foldl_nil]
    exact Mat2.one_mul _
  rw [hsingle]
  exact (Mat2.mul_assoc _ _ _).symm

theorem matrixProduct_adjacency_three
    (left middle right : Step) (tail : Path) :
    matrixProduct (adjacencyBlocks (left :: middle :: right :: tail)) =
      edgeBlock left middle * edgeBlock middle right *
        matrixProduct (adjacencyBlocks (right :: tail)) := by
  rw [show adjacencyBlocks (left :: middle :: right :: tail) =
      [edgeBlock left middle, edgeBlock middle right] ++
        adjacencyBlocks (right :: tail) by
    simp [adjacencyBlocks, edgeBlock]]
  rw [matrixProduct_append]
  have htwo : matrixProduct [edgeBlock left middle, edgeBlock middle right] =
      edgeBlock left middle * edgeBlock middle right := by
    unfold matrixProduct
    simp only [List.foldl_cons, List.foldl_nil]
    rw [Mat2.one_mul]
  rw [htwo]

theorem mul_three_context_assoc (P A B C Q : Mat2) :
    (P * A) * ((B * C) * Q) = (P * ((A * B) * C)) * Q := by
  calc
    (P * A) * ((B * C) * Q) = P * (A * ((B * C) * Q)) :=
      Mat2.mul_assoc P A ((B * C) * Q)
    _ = P * (A * (B * (C * Q))) := by
      rw [Mat2.mul_assoc B C Q]
    _ = P * ((A * B) * (C * Q)) := by
      rw [Mat2.mul_assoc A B (C * Q)]
    _ = P * (((A * B) * C) * Q) := by
      rw [Mat2.mul_assoc (A * B) C Q]
    _ = (P * ((A * B) * C)) * Q :=
      (Mat2.mul_assoc P ((A * B) * C) Q).symm

theorem matrixProduct_cons_localSwap (block : Mat2) (blocks : List Mat2) :
    matrixProduct (block :: blocks) = block * matrixProduct blocks := by
  rw [show block :: blocks = [block] ++ blocks by rfl, matrixProduct_append]
  have hsingle : matrixProduct [block] = block := by
    unfold matrixProduct
    simp only [List.foldl_cons, List.foldl_nil]
    exact Mat2.one_mul block
  rw [hsingle]

theorem adjacencyProduct_a11_pos : ∀ (first : Step) (tail : Path),
    0 < (matrixProduct (adjacencyBlocks (first :: tail))).a11
  | first, [] => by cases first <;> decide
  | first, next :: rest => by
      rw [adjacencyBlocks_cons]
      simp only [edgeBlocks]
      rw [← adjacencyBlocks_cons, matrixProduct_cons_localSwap]
      have ih := adjacencyProduct_a11_pos next rest
      have hblock : 0 < (edgeBlock first next).a11 := by
        cases first <;> cases next <;> decide
      change 0 < (edgeBlock first next).a11 *
          (matrixProduct (adjacencyBlocks (next :: rest))).a11 +
        (edgeBlock first next).a12 *
          (matrixProduct (adjacencyBlocks (next :: rest))).a21
      exact Nat.add_pos_left (Nat.mul_pos hblock ih) _

theorem adjacencyProduct_a12_pos (first next : Step) (rest : Path) :
    0 < (matrixProduct (adjacencyBlocks (first :: next :: rest))).a12 := by
  induction rest generalizing first next with
  | nil =>
      cases first <;> cases next <;>
        decide
  | cons third tail ih =>
      rw [adjacencyBlocks_cons]
      simp only [edgeBlocks]
      rw [← adjacencyBlocks_cons, matrixProduct_cons_localSwap]
      have htail := ih next third
      have hblock : 0 < (edgeBlock first next).a11 := by
        cases first <;> cases next <;> decide
      change 0 < (edgeBlock first next).a11 *
          (matrixProduct (adjacencyBlocks (next :: third :: tail))).a12 +
        (edgeBlock first next).a12 *
          (matrixProduct (adjacencyBlocks (next :: third :: tail))).a22
      exact Nat.add_pos_left (Nat.mul_pos hblock htail) _

theorem adjacencyProduct_a21_pos (first next : Step) (rest : Path) :
    0 < (matrixProduct (adjacencyBlocks (first :: next :: rest))).a21 := by
  rw [adjacencyBlocks_cons]
  simp only [edgeBlocks]
  rw [← adjacencyBlocks_cons, matrixProduct_cons_localSwap]
  have htail := adjacencyProduct_a11_pos next rest
  have hblock : 0 < (edgeBlock first next).a21 := by
    cases first <;> cases next <;> decide
  change 0 < (edgeBlock first next).a21 *
      (matrixProduct (adjacencyBlocks (next :: rest))).a11 +
    (edgeBlock first next).a22 *
      (matrixProduct (adjacencyBlocks (next :: rest))).a21
  exact Nat.add_pos_left (Nat.mul_pos hblock htail) _

def localSwapFactor (left right : Mat2) : Nat :=
  left.a11 * right.a21 + left.a12 * right.a11 +
    left.a12 * right.a21

theorem mixedSwap_contextFactor_pos
    {a b : Nat} (hab : b < a)
    (first leftNeighbor rightNeighbor : Step)
    (leftTail rightTail : Path)
    (hlast : LatticePathOrders.lastAfter first leftTail = leftNeighbor)
    (hneighbors : leftNeighbor ≠ rightNeighbor)
    (hcarrier : Carrier a b
      ((first :: leftTail) ++ [Step.R, Step.U] ++
        (rightNeighbor :: rightTail))) :
    0 < localSwapFactor
      (matrixProduct (adjacencyBlocks (first :: leftTail)))
      (matrixProduct (adjacencyBlocks (rightNeighbor :: rightTail))) := by
  by_cases hleft : leftTail = []
  · subst leftTail
    by_cases hright : rightTail = []
    · subst rightTail
      simp [LatticePathOrders.lastAfter] at hlast
      subst first
      have hc := carrier_components hcarrier
      cases leftNeighbor <;> cases rightNeighbor <;>
        simp_all [Path.countR, Path.countU] <;> exfalso <;> omega
    · obtain ⟨next, rest, hrest⟩ := List.exists_cons_of_ne_nil hright
      subst rightTail
      have hp := adjacencyProduct_a11_pos first []
      have hw := adjacencyProduct_a21_pos rightNeighbor next rest
      have hpw : 0 <
          (matrixProduct (adjacencyBlocks [first])).a11 *
            (matrixProduct
              (adjacencyBlocks (rightNeighbor :: next :: rest))).a21 :=
        Nat.mul_pos hp hw
      unfold localSwapFactor
      exact Nat.add_pos_left (Nat.add_pos_left hpw _) _
  · obtain ⟨next, rest, hrest⟩ := List.exists_cons_of_ne_nil hleft
    subst leftTail
    have hr := adjacencyProduct_a12_pos first next rest
    have hu := adjacencyProduct_a11_pos rightNeighbor rightTail
    have hru : 0 <
        (matrixProduct (adjacencyBlocks (first :: next :: rest))).a12 *
          (matrixProduct
            (adjacencyBlocks (rightNeighbor :: rightTail))).a11 :=
      Nat.mul_pos hr hu
    unfold localSwapFactor
    omega

theorem matchingScore_RU_context
    (first : Step) (leftTail : Path) (rightFirst : Step) (rightTail : Path) :
    matchingScore
        ((first :: leftTail) ++ [Step.R, Step.U] ++
          (rightFirst :: rightTail)) =
      contextScore (matrixProduct (adjacencyBlocks (first :: leftTail)))
        (edgeBlock (LatticePathOrders.lastAfter first leftTail) Step.R * D *
          edgeBlock Step.U rightFirst)
        (matrixProduct (adjacencyBlocks (rightFirst :: rightTail))) := by
  unfold matchingScore contextScore
  rw [show (first :: leftTail) ++ [Step.R, Step.U] ++
      (rightFirst :: rightTail) =
      (first :: leftTail) ++
        (Step.R :: Step.U :: rightFirst :: rightTail) by simp]
  rw [matrixProduct_adjacency_join]
  rw [matrixProduct_adjacency_three]
  cases hlast : LatticePathOrders.lastAfter first leftTail <;>
    cases rightFirst <;> simp [edgeBlock, hlast] <;>
      apply congrArg Mat2.a11 <;> apply mul_three_context_assoc

theorem matchingScore_UR_context
    (first : Step) (leftTail : Path) (rightFirst : Step) (rightTail : Path) :
    matchingScore
        ((first :: leftTail) ++ [Step.U, Step.R] ++
          (rightFirst :: rightTail)) =
      contextScore (matrixProduct (adjacencyBlocks (first :: leftTail)))
        (edgeBlock (LatticePathOrders.lastAfter first leftTail) Step.U * D *
          edgeBlock Step.R rightFirst)
        (matrixProduct (adjacencyBlocks (rightFirst :: rightTail))) := by
  unfold matchingScore contextScore
  rw [show (first :: leftTail) ++ [Step.U, Step.R] ++
      (rightFirst :: rightTail) =
      (first :: leftTail) ++
        (Step.U :: Step.R :: rightFirst :: rightTail) by simp]
  rw [matrixProduct_adjacency_join]
  rw [matrixProduct_adjacency_three]
  cases hlast : LatticePathOrders.lastAfter first leftTail <;>
    cases rightFirst <;> simp [edgeBlock, hlast] <;>
      apply congrArg Mat2.a11 <;> apply mul_three_context_assoc

/-- First row of manuscript Proposition `prop:local-swap`, in a
subtraction-free equality over natural matching counts. -/
theorem localSwap_RR
    (first : Step) (leftTail rightTail : Path)
    (hlast : LatticePathOrders.lastAfter first leftTail = Step.R) :
    sourceMatchingNumber
          ((first :: leftTail) ++ [Step.R, Step.U] ++ (Step.R :: rightTail)) +
        2 * (matrixProduct (adjacencyBlocks (first :: leftTail))).a11 *
          (matrixProduct (adjacencyBlocks (Step.R :: rightTail))).a21 =
      sourceMatchingNumber
          ((first :: leftTail) ++ [Step.U, Step.R] ++ (Step.R :: rightTail)) +
        2 * (matrixProduct (adjacencyBlocks (first :: leftTail))).a12 *
          (matrixProduct (adjacencyBlocks (Step.R :: rightTail))).a11 := by
  simp only [sourceMatchingNumber_eq_matchingScore]
  rw [matchingScore_RU_context, matchingScore_UR_context, hlast]
  simpa [edgeBlock] using
    context_edd_dde
      (matrixProduct (adjacencyBlocks (first :: leftTail)))
      (matrixProduct (adjacencyBlocks (Step.R :: rightTail)))

/-- Second row of manuscript Proposition `prop:local-swap`. -/
theorem localSwap_RU
    (first : Step) (leftTail rightTail : Path)
    (hlast : LatticePathOrders.lastAfter first leftTail = Step.R) :
    sourceMatchingNumber
        ((first :: leftTail) ++ [Step.R, Step.U] ++ (Step.U :: rightTail)) =
      sourceMatchingNumber
          ((first :: leftTail) ++ [Step.U, Step.R] ++ (Step.U :: rightTail)) +
        2 * ((matrixProduct (adjacencyBlocks (first :: leftTail))).a11 *
              (matrixProduct (adjacencyBlocks (Step.U :: rightTail))).a21 +
            (matrixProduct (adjacencyBlocks (first :: leftTail))).a12 *
              (matrixProduct (adjacencyBlocks (Step.U :: rightTail))).a11 +
            (matrixProduct (adjacencyBlocks (first :: leftTail))).a12 *
              (matrixProduct (adjacencyBlocks (Step.U :: rightTail))).a21) := by
  simp only [sourceMatchingNumber_eq_matchingScore]
  rw [matchingScore_RU_context, matchingScore_UR_context, hlast]
  simpa [edgeBlock] using
    context_ede_ddd
      (matrixProduct (adjacencyBlocks (first :: leftTail)))
      (matrixProduct (adjacencyBlocks (Step.U :: rightTail)))

/-- Third row of manuscript Proposition `prop:local-swap`. -/
theorem localSwap_UR
    (first : Step) (leftTail rightTail : Path)
    (hlast : LatticePathOrders.lastAfter first leftTail = Step.U) :
    sourceMatchingNumber
          ((first :: leftTail) ++ [Step.R, Step.U] ++ (Step.R :: rightTail)) +
        2 * ((matrixProduct (adjacencyBlocks (first :: leftTail))).a11 *
              (matrixProduct (adjacencyBlocks (Step.R :: rightTail))).a21 +
            (matrixProduct (adjacencyBlocks (first :: leftTail))).a12 *
              (matrixProduct (adjacencyBlocks (Step.R :: rightTail))).a11 +
            (matrixProduct (adjacencyBlocks (first :: leftTail))).a12 *
              (matrixProduct (adjacencyBlocks (Step.R :: rightTail))).a21) =
      sourceMatchingNumber
        ((first :: leftTail) ++ [Step.U, Step.R] ++ (Step.R :: rightTail)) := by
  simp only [sourceMatchingNumber_eq_matchingScore]
  rw [matchingScore_RU_context, matchingScore_UR_context, hlast]
  simpa [edgeBlock] using
    context_ddd_ede
      (matrixProduct (adjacencyBlocks (first :: leftTail)))
      (matrixProduct (adjacencyBlocks (Step.R :: rightTail)))

/-- Fourth row of manuscript Proposition `prop:local-swap`. -/
theorem localSwap_UU
    (first : Step) (leftTail rightTail : Path)
    (hlast : LatticePathOrders.lastAfter first leftTail = Step.U) :
    sourceMatchingNumber
          ((first :: leftTail) ++ [Step.R, Step.U] ++ (Step.U :: rightTail)) +
        2 * (matrixProduct (adjacencyBlocks (first :: leftTail))).a12 *
          (matrixProduct (adjacencyBlocks (Step.U :: rightTail))).a11 =
      sourceMatchingNumber
          ((first :: leftTail) ++ [Step.U, Step.R] ++ (Step.U :: rightTail)) +
        2 * (matrixProduct (adjacencyBlocks (first :: leftTail))).a11 *
          (matrixProduct (adjacencyBlocks (Step.U :: rightTail))).a21 := by
  simp only [sourceMatchingNumber_eq_matchingScore]
  rw [matchingScore_RU_context, matchingScore_UR_context, hlast]
  simpa [edgeBlock] using
    context_dde_edd
      (matrixProduct (adjacencyBlocks (first :: leftTail)))
      (matrixProduct (adjacencyBlocks (Step.U :: rightTail)))

/-- Strict sign in the manuscript's `(R,U)` neighbor row, derived from path
membership and `a>b` rather than assumed as an algebraic side condition. -/
theorem localSwap_RU_strict
    {a b : Nat} (hab : b < a)
    (first : Step) (leftTail rightTail : Path)
    (hlast : LatticePathOrders.lastAfter first leftTail = Step.R)
    (hcarrier : Carrier a b
      ((first :: leftTail) ++ [Step.R, Step.U] ++ (Step.U :: rightTail))) :
    sourceMatchingNumber
        ((first :: leftTail) ++ [Step.U, Step.R] ++ (Step.U :: rightTail)) <
      sourceMatchingNumber
        ((first :: leftTail) ++ [Step.R, Step.U] ++ (Step.U :: rightTail)) := by
  have heq := localSwap_RU first leftTail rightTail hlast
  have hpos := mixedSwap_contextFactor_pos hab first Step.R Step.U
    leftTail rightTail hlast (by decide) hcarrier
  unfold localSwapFactor at hpos
  omega

/-- Strict sign in the manuscript's `(U,R)` neighbor row. -/
theorem localSwap_UR_strict
    {a b : Nat} (hab : b < a)
    (first : Step) (leftTail rightTail : Path)
    (hlast : LatticePathOrders.lastAfter first leftTail = Step.U)
    (hcarrier : Carrier a b
      ((first :: leftTail) ++ [Step.R, Step.U] ++ (Step.R :: rightTail))) :
    sourceMatchingNumber
        ((first :: leftTail) ++ [Step.R, Step.U] ++ (Step.R :: rightTail)) <
      sourceMatchingNumber
        ((first :: leftTail) ++ [Step.U, Step.R] ++ (Step.R :: rightTail)) := by
  have heq := localSwap_UR first leftTail rightTail hlast
  have hpos := mixedSwap_contextFactor_pos hab first Step.U Step.R
    leftTail rightTail hlast (by decide) hcarrier
  unfold localSwapFactor at hpos
  omega

end LatticePathOrdersKernel
