import LatticePathOrdersKernel.NonlocalDistance
import LatticePathOrdersKernel.MatchingBridge

/-!
# Exact block words and scores of `Xₙ,Yₙ`
-/

namespace LatticePathOrdersKernel

open LatticePathOrders

theorem edgeBlocks_R_urPairs_UU (pairs : Nat) :
    edgeBlocks Step.R (urPairs pairs ++ [Step.U, Step.U]) =
      List.replicate (2 * pairs + 1) D ++ [E] := by
  induction pairs with
  | zero => rfl
  | succ pairs ih =>
      simp only [urPairs, List.cons_append, edgeBlocks]
      rw [ih]
      simp [edgeBlock, List.replicate_succ]
      congr 2 <;> omega

theorem edgeBlocks_R_urPairs_Ytail (pairs : Nat) :
    edgeBlocks Step.R
        (urPairs pairs ++ [Step.R, Step.U, Step.U, Step.R, Step.U]) =
      List.replicate (2 * pairs) D ++ [E, D, E, D, D] := by
  induction pairs with
  | zero => rfl
  | succ pairs ih =>
      simp only [urPairs, List.cons_append, edgeBlocks]
      rw [ih]
      simp [edgeBlock, List.replicate_succ]
      congr 2 <;> omega

theorem nonlocalX_adjacencyBlocks {n : Nat} (hn : 4 ≤ n) :
    adjacencyBlocks (nonlocalX n) =
      [E, E] ++ List.replicate (2 * n - 5) D ++ [E] := by
  unfold nonlocalX
  simp only [List.cons_append, List.nil_append, adjacencyBlocks]
  rw [adjacencyBlocks_cons]
  rw [edgeBlocks_R_urPairs_UU]
  have hcount : 2 * (n - 3) + 1 = 2 * n - 5 := by omega
  rw [hcount]
  rfl

theorem nonlocalY_adjacencyBlocks {n : Nat} (hn : 4 ≤ n) :
    adjacencyBlocks (nonlocalY n) =
      [E] ++ List.replicate (2 * n - 8) D ++ [E, D, E, D, D] := by
  unfold nonlocalY
  simp only [List.cons_append, List.nil_append, adjacencyBlocks]
  rw [adjacencyBlocks_cons]
  rw [edgeBlocks_R_urPairs_Ytail]
  have hcount : 2 * (n - 4) = 2 * n - 8 := by omega
  rw [hcount]
  rfl

theorem matrixProduct_replicate_D (n : Nat) :
    matrixProduct (List.replicate n D) = Mat2.pow D n := by
  rw [Mat2.matrixProduct_eq_productR]
  induction n with
  | zero => rfl
  | succ n ih =>
      simp only [List.replicate_succ, Mat2.productR]
      rw [ih]
      rfl

theorem matrixProduct_pattern_threeE
    (m i j : Nat) :
    matrixProduct
        ([E] ++ List.replicate (i - 1) D ++ [E] ++
          List.replicate (j - i - 1) D ++ [E] ++
          List.replicate (m - 1 - j) D) =
      threeEBlockProduct m i j := by
  repeat' rw [matrixProduct_append]
  simp only [matrixProduct_replicate_D]
  have hsingleE : matrixProduct [E] = E := by
    unfold matrixProduct
    simp only [List.foldl_cons, List.foldl_nil]
    exact Mat2.one_mul E
  rw [hsingleE]
  unfold threeEBlockProduct
  rfl

theorem nonlocalX_score {n : Nat} (hn : 4 ≤ n) :
    sourceMatchingNumber (nonlocalX n) =
      pell (2 * n - 1) + pellF (2 * n - 3) 1 := by
  rw [sourceMatchingNumber_eq_matchingScore]
  unfold matchingScore
  rw [nonlocalX_adjacencyBlocks hn]
  have hpattern := matrixProduct_pattern_threeE
    (m := 2 * n - 2) (i := 1) (j := 2 * n - 3)
  have hmiddle : 2 * n - 3 - 1 - 1 = 2 * n - 5 := by omega
  have htail : 2 * n - 2 - 1 - (2 * n - 3) = 0 := by omega
  rw [hmiddle, htail] at hpattern
  norm_num at hpattern
  have hpattern' :
      matrixProduct ([E, E] ++ List.replicate (2 * n - 5) D ++ [E]) =
        threeEBlockProduct (2 * n - 2) 1 (2 * n - 3) := by
    simpa using hpattern
  rw [hpattern']
  rw [three_E_formula (by omega) (by omega) (by omega)]
  have hbase : 2 * n - 2 + 1 = 2 * n - 1 := by omega
  have hN : 2 * n - 2 - 1 = 2 * n - 3 := by omega
  rw [hbase, hN]
  unfold threeEInteraction
  rw [htail]
  simp [pellF, pellPrevious]

theorem nonlocalY_score {n : Nat} (hn : 4 ≤ n) :
    sourceMatchingNumber (nonlocalY n) =
      pell (2 * n - 1) + pellF (2 * n - 3) 2 +
        pellF (2 * n - 3) 4 := by
  rw [sourceMatchingNumber_eq_matchingScore]
  unfold matchingScore
  rw [nonlocalY_adjacencyBlocks hn]
  have hpattern := matrixProduct_pattern_threeE
    (m := 2 * n - 2) (i := 2 * n - 7) (j := 2 * n - 5)
  have hi : 2 * n - 7 - 1 = 2 * n - 8 := by omega
  have hmid : 2 * n - 5 - (2 * n - 7) - 1 = 1 := by omega
  have htail : 2 * n - 2 - 1 - (2 * n - 5) = 2 := by omega
  rw [hi, hmid, htail] at hpattern
  have hpattern' :
      matrixProduct
          ([E] ++ List.replicate (2 * n - 8) D ++ [E, D, E, D, D]) =
        threeEBlockProduct (2 * n - 2) (2 * n - 7) (2 * n - 5) := by
    simpa using hpattern
  rw [hpattern']
  rw [three_E_formula (by omega) (by omega) (by omega)]
  have hbase : 2 * n - 2 + 1 = 2 * n - 1 := by omega
  have hN : 2 * n - 2 - 1 = 2 * n - 3 := by omega
  rw [hbase, hN]
  have hsym1 := pellF_symm (N := 2 * n - 3) (k := 2 * n - 7) (by omega)
  have hsym2 := pellF_symm (N := 2 * n - 3) (k := 2 * n - 5) (by omega)
  have hsym1' : pellF (2 * n - 3) (2 * n - 7) =
      pellF (2 * n - 3) 4 := by
    have hindex : 2 * n - 3 - (2 * n - 7) = 4 := by omega
    rw [hindex] at hsym1
    exact hsym1
  have hsym2' : pellF (2 * n - 3) (2 * n - 5) =
      pellF (2 * n - 3) 2 := by
    have hindex : 2 * n - 3 - (2 * n - 5) = 2 := by omega
    rw [hindex] at hsym2
    exact hsym2
  rw [hsym1', hsym2']
  unfold threeEInteraction
  rw [hmid, htail]
  simp [pellPrevious]
  omega

theorem pell_succ_lt_three_mul {t : Nat} (ht : 0 < t) :
    pell (t + 1) < 3 * pell t := by
  cases t with
  | zero => omega
  | succ k =>
      rw [show k + 1 + 1 = k + 2 by omega, pell_add_two]
      have hprev : pell k < pell (k + 1) := by
        cases k with
        | zero => decide
        | succ j => exact pell_strictMono_pos (by omega) (by omega)
      omega

theorem pell_nonlocal_gap {n : Nat} (hn : 4 ≤ n) :
    pellF (2 * n - 3) 1 <
      pellF (2 * n - 3) 2 + pellF (2 * n - 3) 4 := by
  let t := 2 * n - 7
  have ht : 0 < t := by dsimp [t]; omega
  have ht1 := pell_succ_lt_three_mul ht
  have hrec := pell_add_two (t + 1)
  have hN1 : 2 * n - 3 - 1 = t + 3 := by dsimp [t]; omega
  have hN2 : 2 * n - 3 - 2 = t + 2 := by dsimp [t]; omega
  have hN4 : 2 * n - 3 - 4 = t := by dsimp [t]; omega
  unfold pellF
  rw [hN1, hN2, hN4]
  norm_num [pell]
  nlinarith

theorem nonlocalX_lt_nonlocalY {n : Nat} (hn : 4 ≤ n) :
    sourceMatchingNumber (nonlocalX n) <
      sourceMatchingNumber (nonlocalY n) := by
  rw [nonlocalX_score hn, nonlocalY_score hn]
  have hgap := pell_nonlocal_gap hn
  omega

end LatticePathOrdersKernel
