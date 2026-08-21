import LatticePathOrdersKernel.LagrangeBridge
import LatticePathOrders.MatchingBounds
import LatticePathOrders.LagrangeBounds

/-!
# Cyclic matrix intervals for manuscript Lagrange prefix bounds

This file isolates the exact matrix carrier behind `eq:L-lower` and
`eq:L-upper`.  It proves that the cyclic digit product of every completion is
between the two literal matrices displayed in the manuscript and that the
unshifted denominator is bounded by the upper matrix's lower-left entry.
-/

namespace LatticePathOrdersKernel

open LatticePathOrders

theorem toClassicalMatrix_injective :
    Function.Injective toClassicalMatrix := by
  intro A B h
  apply Mat2.ext
  · exact congrArg LatticePathOrdersClassical.NatMatrix2.a11 h
  · exact congrArg LatticePathOrdersClassical.NatMatrix2.a12 h
  · exact congrArg LatticePathOrdersClassical.NatMatrix2.a21 h
  · exact congrArg LatticePathOrdersClassical.NatMatrix2.a22 h

theorem digitProduct_adjacency_eq_matrixProduct (word : Path) :
    LatticePathOrders.digitProduct (adjacencyDigits word) =
      matrixProduct (adjacencyBlocks word) := by
  apply toClassicalMatrix_injective
  rw [digitProduct_bridge, matrixProduct_adjacency_bridge]

theorem cyclicMatrix_eq (word : Path) :
    LatticePathOrders.digitProduct (cyclicDigits word) =
      D * matrixProduct (adjacencyBlocks word) := by
  unfold cyclicDigits LatticePathOrders.digitProduct
  rw [Mat2.matrixProduct_eq_productR]
  simp only [List.map_cons, Mat2.productR]
  change D * Mat2.productR ((adjacencyDigits word).map T) = _
  rw [← Mat2.matrixProduct_eq_productR]
  exact congrArg (D * ·) (digitProduct_adjacency_eq_matrixProduct word)

theorem cyclic_completion_matrix_bounds
    (first : Step) (tail suffix : Path) :
    let prefixMatrix := D * matrixProduct (adjacencyBlocks (first :: tail))
    Mat2.LE (prefixMatrix * Mat2.pow D suffix.length)
        (LatticePathOrders.digitProduct
          (cyclicDigits ((first :: tail) ++ suffix))) ∧
      Mat2.LE
        (LatticePathOrders.digitProduct
          (cyclicDigits ((first :: tail) ++ suffix)))
        (prefixMatrix * Mat2.pow E suffix.length) := by
  let extension := edgeBlocks (LatticePathOrders.lastAfter first tail) suffix
  have hbetween : ∀ A ∈ extension, Mat2.Between A :=
    edgeBlocks_between (LatticePathOrders.lastAfter first tail) suffix
  have hb := Mat2.matrixProduct_bounds hbetween
  have hlen : extension.length = suffix.length := edgeBlocks_length _ _
  have hdecomp : adjacencyBlocks ((first :: tail) ++ suffix) =
      adjacencyBlocks (first :: tail) ++ extension := by
    calc
      adjacencyBlocks ((first :: tail) ++ suffix) =
          edgeBlocks first (tail ++ suffix) :=
        adjacencyBlocks_cons first (tail ++ suffix)
      _ = edgeBlocks first tail ++
          edgeBlocks (LatticePathOrders.lastAfter first tail) suffix :=
        edgeBlocks_append first tail suffix
      _ = adjacencyBlocks (first :: tail) ++ extension := by
        rw [adjacencyBlocks_cons]
  have hproduct :
      matrixProduct (adjacencyBlocks ((first :: tail) ++ suffix)) =
        matrixProduct (adjacencyBlocks (first :: tail)) *
          matrixProduct extension := by
    rw [hdecomp, matrixProduct_append]
  have hcyclic :
      LatticePathOrders.digitProduct
          (cyclicDigits ((first :: tail) ++ suffix)) =
        (D * matrixProduct (adjacencyBlocks (first :: tail))) *
          matrixProduct extension := by
    rw [cyclicMatrix_eq, hproduct]
    exact (Mat2.mul_assoc _ _ _).symm
  have hl := Mat2.mul_mono_left
    (D * matrixProduct (adjacencyBlocks (first :: tail))) hb.1
  have hu := Mat2.mul_mono_left
    (D * matrixProduct (adjacencyBlocks (first :: tail))) hb.2
  rw [hlen] at hl hu
  rw [hcyclic]
  exact ⟨hl, hu⟩

theorem trace_le_of_matrixLE {A B : Mat2} (h : Mat2.LE A B) :
    A.trace ≤ B.trace := by
  unfold Mat2.trace
  exact Nat.add_le_add h.1 h.2.2.2

theorem qMin_le_unshifted (digits : List Nat) (hne : digits ≠ []) :
    qMin digits ≤ (LatticePathOrders.digitProduct digits).a21 := by
  apply List.min?_getD_le_of_mem
  unfold lowerLeftValues rotations
  apply List.mem_map.mpr
  refine ⟨digits, ?_, rfl⟩
  apply List.mem_map.mpr
  refine ⟨0, ?_, by simp⟩
  exact List.mem_range.mpr (List.length_pos_iff.mpr hne)

theorem cyclic_completion_trace_denominator_bounds
    (first : Step) (tail suffix : Path) :
    let prefixMatrix := D * matrixProduct (adjacencyBlocks (first :: tail))
    let lowerMatrix := prefixMatrix * Mat2.pow D suffix.length
    let upperMatrix := prefixMatrix * Mat2.pow E suffix.length
    lowerMatrix.trace ≤
        (LatticePathOrders.digitProduct
          (cyclicDigits ((first :: tail) ++ suffix))).trace ∧
      (LatticePathOrders.digitProduct
          (cyclicDigits ((first :: tail) ++ suffix))).trace ≤
        upperMatrix.trace ∧
      qMin (cyclicDigits ((first :: tail) ++ suffix)) ≤ upperMatrix.a21 := by
  have hb := cyclic_completion_matrix_bounds first tail suffix
  refine ⟨trace_le_of_matrixLE hb.1, trace_le_of_matrixLE hb.2, ?_⟩
  exact (qMin_le_unshifted _ (by simp [cyclicDigits])).trans hb.2.2.2.1

end LatticePathOrdersKernel
