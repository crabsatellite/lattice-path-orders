import LatticePathOrdersKernel.AdjacencyRecovery

/-! # Classification of the final-`E` three-block paths -/

namespace LatticePathOrdersKernel

open LatticePathOrders

def oddBeforePath (r s : Nat) : Path :=
  [Step.R, Step.R] ++ urPairs r ++ [Step.U, Step.U] ++
    ruPairs s ++ [Step.U]

@[simp] theorem ruPairs_countR (n : Nat) : Path.countR (ruPairs n) = n := by
  unfold Path.countR
  induction n with
  | zero => rfl
  | succ n ih => simp [ruPairs, ih]

@[simp] theorem ruPairs_countU (n : Nat) : Path.countU (ruPairs n) = n := by
  unfold Path.countU
  induction n with
  | zero => rfl
  | succ n ih => simp [ruPairs, ih]

theorem oddBeforePath_countR (r s : Nat) :
    Path.countR (oddBeforePath r s) = 2 + r + s := by
  have hur := urPairs_countR r
  have hru := ruPairs_countR s
  unfold Path.countR at hur hru ⊢
  simp [oddBeforePath, hur, hru]
  omega

theorem lastAfter_R_urPairs_U (pairs : Nat) :
    LatticePathOrders.lastAfter Step.R (urPairs pairs ++ [Step.U]) = Step.U := by
  induction pairs with
  | zero => rfl
  | succ pairs ih =>
      simp only [urPairs, List.cons_append, LatticePathOrders.lastAfter]
      exact ih

theorem oddBeforePath_length (r s : Nat) :
    (oddBeforePath r s).length = 5 + 2 * r + 2 * s := by
  simp [oddBeforePath]
  omega

theorem edgeBlocks_U_ruPairs_U (pairs : Nat) :
    edgeBlocks Step.U (ruPairs pairs ++ [Step.U]) =
      List.replicate (2 * pairs) D ++ [E] := by
  induction pairs with
  | zero => rfl
  | succ pairs ih =>
      simp only [ruPairs, List.cons_append, edgeBlocks]
      rw [ih]
      simp only [edgeBlock, if_neg (by decide : Step.U ≠ Step.R),
        if_neg (by decide : Step.R ≠ Step.U)]
      have hrep : List.replicate (2 * (pairs + 1)) D =
          D :: D :: List.replicate (2 * pairs) D := by
        rw [show 2 * (pairs + 1) = 2 * pairs + 2 by omega]
        simp [List.replicate_succ]
      rw [hrep]
      simp [List.append_assoc]

theorem oddBeforePath_adjacencyBlocks (r s : Nat) :
    adjacencyBlocks (oddBeforePath r s) =
      [E] ++ List.replicate (2 * r + 1) D ++ [E] ++
        List.replicate (2 * s) D ++ [E] := by
  unfold oddBeforePath
  rw [show [Step.R, Step.R] ++ urPairs r ++ [Step.U, Step.U] ++
      ruPairs s ++ [Step.U] =
    Step.R :: Step.R ::
      ((urPairs r ++ [Step.U]) ++ ([Step.U] ++ ruPairs s ++ [Step.U])) by
    simp [List.append_assoc]]
  rw [adjacencyBlocks_cons]
  simp only [edgeBlocks, edgeBlock, if_pos rfl]
  rw [edgeBlocks_append]
  have hfirst : edgeBlocks Step.R (urPairs r ++ [Step.U]) =
      List.replicate (2 * r + 1) D := by
    induction r with
    | zero => rfl
    | succ r ih =>
        simp only [urPairs, List.cons_append, edgeBlocks]
        rw [ih]
        simp only [edgeBlock, if_neg (by decide : Step.R ≠ Step.U),
          if_neg (by decide : Step.U ≠ Step.R)]
        have hrep : List.replicate (2 * (r + 1) + 1) D =
            D :: D :: List.replicate (2 * r + 1) D := by
          rw [show 2 * (r + 1) + 1 = (2 * r + 1) + 2 by omega]
          simp [List.replicate_succ]
        rw [hrep]
  rw [hfirst]
  rw [lastAfter_R_urPairs_U]
  simp only [List.singleton_append, if_true]
  rw [show edgeBlocks Step.U (Step.U :: ruPairs s ++ [Step.U]) =
      E :: edgeBlocks Step.U (ruPairs s ++ [Step.U]) by
    simp [edgeBlocks, edgeBlock]]
  rw [edgeBlocks_U_ruPairs_U]
  simp [List.append_assoc]

theorem final_threeE_path_is_initialLevelPath
    {n before middle : Nat} (hn : 4 ≤ n) {word : Path}
    (hword : Carrier n (n - 1) word)
    (hblocks : adjacencyBlocks word =
      [E] ++ List.replicate before D ++ [E] ++
        List.replicate middle D ++ [E]) :
    ∃ r ≤ n - 3, word = initialLevelPath n r := by
  have hwordBlocksLength := (carrier_nn1_block_data hn hword).1
  have hlength : 1 + before + 1 + middle + 1 = 2 * n - 2 := by
    have h := congrArg List.length hblocks
    rw [hwordBlocksLength] at h
    simp at h
    omega
  rcases Nat.even_or_odd before with heven | hodd
  · rcases heven with ⟨r, hr⟩
    have hrRange : r ≤ n - 3 := by omega
    refine ⟨r, hrRange, ?_⟩
    apply carrier_adjacencyBlocks_injective (by omega) hword
      (initialLevelPath_carrier hn hrRange)
    rw [initialLevelPath_adjacencyBlocks hn hrRange]
    have hbefore : before = 2 * r := by omega
    have hmiddle : middle = 2 * n - 2 * r - 5 := by omega
    rw [hbefore, hmiddle] at hblocks
    exact hblocks
  · rcases hodd with ⟨r, hr⟩
    let s := n - r - 3
    have hs : middle = 2 * s := by dsimp [s]; omega
    have hbefore : before = 2 * r + 1 := by omega
    have hoddBlocks : adjacencyBlocks word =
        adjacencyBlocks (oddBeforePath r s) := by
      rw [oddBeforePath_adjacencyBlocks]
      simpa [hbefore, hs] using hblocks
    have hwordLength := carrier_length hword
    have hoddLength : (oddBeforePath r s).length = word.length := by
      rw [oddBeforePath_length, hwordLength]
      dsimp [s]
      omega
    rcases carrier_starts_R (by omega) hword with ⟨wordTail, hwordEq⟩
    simp only [List.singleton_append] at hwordEq
    have hoddEq : oddBeforePath r s =
        Step.R :: (Step.R :: urPairs r ++ [Step.U, Step.U] ++
          ruPairs s ++ [Step.U]) := by
      simp [oddBeforePath, List.append_assoc]
    rw [hwordEq, hoddEq] at hoddBlocks hoddLength
    have heq := adjacencyBlocks_injective_of_same_head
      (Nat.succ.inj hoddLength.symm) hoddBlocks
    have hcount := congrArg Path.countR heq
    have hc := carrier_components hword
    rw [← hwordEq, hc.1] at hcount
    have hoddCount :
        Path.countR (Step.R :: (Step.R :: urPairs r ++ [Step.U, Step.U] ++
          ruPairs s ++ [Step.U])) = 2 + r + s := by
      rw [← hoddEq]
      exact oddBeforePath_countR r s
    rw [hoddCount] at hcount
    dsimp [s] at hcount
    exfalso
    omega

end LatticePathOrdersKernel
