import LatticePathOrders.MatrixBounds
import LatticePathOrders.CoverCertificate

namespace LatticePathOrders

/-!
# Sound matching-score intervals for path prefixes

This is the project-local bridge used by matching cover certificates.  No
published theorem is gated here: the proof is entrywise matrix arithmetic.
-/

def edgeBlock (x y : Step) : Mat2 := if x = y then E else D

def edgeBlocks (previous : Step) : Path → List Mat2
  | [] => []
  | next :: rest => edgeBlock previous next :: edgeBlocks next rest

def lastAfter (previous : Step) : Path → Step
  | [] => previous
  | next :: rest => lastAfter next rest

theorem adjacencyBlocks_cons (first : Step) (tail : Path) :
    adjacencyBlocks (first :: tail) = edgeBlocks first tail := by
  induction tail generalizing first with
  | nil => rfl
  | cons next rest ih =>
      simp [adjacencyBlocks, edgeBlocks, edgeBlock, ih next]

theorem edgeBlocks_append (previous : Step) (xs ys : Path) :
    edgeBlocks previous (xs ++ ys) =
      edgeBlocks previous xs ++ edgeBlocks (lastAfter previous xs) ys := by
  induction xs generalizing previous with
  | nil => rfl
  | cons next rest ih =>
      simp [edgeBlocks, lastAfter, ih next]

theorem edgeBlocks_length (previous : Step) (xs : Path) :
    (edgeBlocks previous xs).length = xs.length := by
  induction xs generalizing previous with
  | nil => rfl
  | cons next rest ih => simp [edgeBlocks, ih next]

theorem edgeBlock_between (x y : Step) : Mat2.Between (edgeBlock x y) := by
  by_cases h : x = y
  · simp [edgeBlock, h, Mat2.E_between]
  · simp [edgeBlock, h, Mat2.D_between]

theorem edgeBlocks_between (previous : Step) (xs : Path) :
    ∀ A ∈ edgeBlocks previous xs, Mat2.Between A := by
  intro A hA
  induction xs generalizing previous with
  | nil => simp [edgeBlocks] at hA
  | cons next rest ih =>
      simp only [edgeBlocks, List.mem_cons] at hA
      rcases hA with rfl | hrest
      · exact edgeBlock_between previous next
      · exact ih next hrest

theorem matrixProduct_append (xs ys : List Mat2) :
    matrixProduct (xs ++ ys) = matrixProduct xs * matrixProduct ys := by
  simp only [Mat2.matrixProduct_eq_productR]
  induction xs with
  | nil => exact (Mat2.one_mul (Mat2.productR ys)).symm
  | cons A As ih =>
      simp only [List.cons_append, Mat2.productR]
      rw [ih]
      exact (Mat2.mul_assoc A (Mat2.productR As) (Mat2.productR ys)).symm

def matchingLower (pfx : Path) (remaining : Nat) : Nat :=
  (matrixProduct (adjacencyBlocks pfx) * Mat2.pow D remaining).a11

def matchingUpper (pfx : Path) (remaining : Nat) : Nat :=
  (matrixProduct (adjacencyBlocks pfx) * Mat2.pow E remaining).a11

/-- Literal soundness of the matching interval for every completion of a
nonempty prefix. -/
theorem matching_completion_bounds (first : Step) (tail suffix : Path) :
    matchingLower (first :: tail) suffix.length ≤
        matchingScore ((first :: tail) ++ suffix) ∧
      matchingScore ((first :: tail) ++ suffix) ≤
        matchingUpper (first :: tail) suffix.length := by
  let extension := edgeBlocks (lastAfter first tail) suffix
  have hbetween : ∀ A ∈ extension, Mat2.Between A :=
    edgeBlocks_between (lastAfter first tail) suffix
  have hb := Mat2.matrixProduct_bounds hbetween
  have hlen : extension.length = suffix.length := edgeBlocks_length _ _
  have hdecomp : adjacencyBlocks ((first :: tail) ++ suffix) =
      adjacencyBlocks (first :: tail) ++ extension := by
    calc
      adjacencyBlocks ((first :: tail) ++ suffix) =
          edgeBlocks first (tail ++ suffix) := adjacencyBlocks_cons first (tail ++ suffix)
      _ = edgeBlocks first tail ++ edgeBlocks (lastAfter first tail) suffix :=
          edgeBlocks_append first tail suffix
      _ = adjacencyBlocks (first :: tail) ++ extension := by
          rw [adjacencyBlocks_cons]
  have hproduct : matrixProduct (adjacencyBlocks ((first :: tail) ++ suffix)) =
      matrixProduct (adjacencyBlocks (first :: tail)) * matrixProduct extension := by
    rw [hdecomp, matrixProduct_append]
  have hl := Mat2.mul_mono_left (matrixProduct (adjacencyBlocks (first :: tail))) hb.1
  have hu := Mat2.mul_mono_left (matrixProduct (adjacencyBlocks (first :: tail))) hb.2
  rw [hlen] at hl hu
  constructor
  · exact hl.1.trans_eq (congrArg Mat2.a11 hproduct).symm
  · exact (congrArg Mat2.a11 hproduct).le.trans hu.1

/-- Fixed-total form consumed by certificate entries. -/
theorem matching_prefix_bound_sound {pfx w : Path} {total : Nat}
    (hpNonempty : pfx ≠ [])
    (hpref : IsPrefix pfx w)
    (hwlen : w.length = total) :
    matchingLower pfx (total - pfx.length) ≤ matchingScore w ∧
      matchingScore w ≤ matchingUpper pfx (total - pfx.length) := by
  rcases hpref with ⟨suffix, rfl⟩
  obtain ⟨first, tail, rfl⟩ := List.exists_cons_of_ne_nil hpNonempty
  simp only [List.length_append, List.length_cons] at hwlen
  have hsum : (first :: tail).length + suffix.length = total := by
    simp only [List.length_cons]
    omega
  have hremaining : total - (first :: tail).length = suffix.length := by
    omega
  rw [hremaining]
  exact matching_completion_bounds first tail suffix

end LatticePathOrders
