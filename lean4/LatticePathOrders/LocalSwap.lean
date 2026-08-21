import LatticePathOrders.MatrixScore

namespace LatticePathOrders

/-!
# Kernel-checked local swap identities

The four identities below are the literal matrix calculation behind the local
`RU ↔ UR` analysis in the paper.  They use natural-number equalities rather
than truncated subtraction, so no sign information is hidden.
-/

/-- Matching contribution of a local block with its full left and right
matrix context. -/
def contextScore (P block S : Mat2) : Nat := (P * block * S).a11

/-- `EDD-DDE = 2(be-ag)`, stated without natural-number subtraction. -/
theorem context_edd_dde
    (P S : Mat2) :
    contextScore P (E * D * D) S + 2 * P.a11 * S.a21 =
      contextScore P (D * D * E) S + 2 * P.a12 * S.a11 := by
  cases P
  cases S
  simp [contextScore, Mat2.mul, E, D, T]
  ring

/-- `EDE-DDD = 2(ag+be+bg)`. -/
theorem context_ede_ddd
    (P S : Mat2) :
    contextScore P (E * D * E) S =
      contextScore P (D * D * D) S +
        2 * (P.a11 * S.a21 + P.a12 * S.a11 + P.a12 * S.a21) := by
  cases P
  cases S
  simp [contextScore, Mat2.mul, E, D, T]
  ring

/-- Reversal of the preceding mixed-neighbor identity. -/
theorem context_ddd_ede
    (P S : Mat2) :
    contextScore P (D * D * D) S +
        2 * (P.a11 * S.a21 + P.a12 * S.a11 + P.a12 * S.a21) =
      contextScore P (E * D * E) S := by
  simpa using (context_ede_ddd P S).symm

/-- `DDE-EDD = 2(ag-be)`, stated without natural-number subtraction. -/
theorem context_dde_edd
    (P S : Mat2) :
    contextScore P (D * D * E) S + 2 * P.a12 * S.a11 =
      contextScore P (E * D * D) S + 2 * P.a11 * S.a21 := by
  simpa using (context_edd_dde P S).symm

/-- Strict direction in the `EDE`/`DDD` case once the displayed positive
context factor is supplied. -/
theorem context_ede_gt_ddd
    (P S : Mat2)
    (hpos : 0 < P.a11 * S.a21 + P.a12 * S.a11 + P.a12 * S.a21) :
    contextScore P (D * D * D) S < contextScore P (E * D * E) S := by
  rw [context_ede_ddd]
  omega

/-- The reverse strict direction in the `DDD`/`EDE` case. -/
theorem context_ddd_lt_ede
    (P S : Mat2)
    (hpos : 0 < P.a11 * S.a21 + P.a12 * S.a11 + P.a12 * S.a21) :
    contextScore P (D * D * D) S < contextScore P (E * D * E) S :=
  context_ede_gt_ddd P S hpos

end LatticePathOrders
