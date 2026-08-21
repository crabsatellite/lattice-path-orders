import LatticePathOrdersKernel.NonlocalBlockStructure

/-! # Exact decomposition of `D/E` block words by their `E` positions -/

namespace LatticePathOrdersKernel

open LatticePathOrders

def DEWord (blocks : List Mat2) : Prop :=
  ∀ block ∈ blocks, block = D ∨ block = E

theorem DEWord.append {left right : List Mat2}
    (hleft : DEWord left) (hright : DEWord right) :
    DEWord (left ++ right) := by
  intro block hblock
  rcases List.mem_append.mp hblock with h | h
  · exact hleft block h
  · exact hright block h

theorem DEWord.replicateD (n : Nat) : DEWord (List.replicate n D) := by
  intro block hblock
  exact Or.inl (List.eq_of_mem_replicate hblock)

theorem DEWord.singletonE : DEWord [E] := by
  intro block hblock
  exact Or.inr (by simpa using hblock)

theorem DEWord.tail {block : Mat2} {tail : List Mat2}
    (h : DEWord (block :: tail)) : DEWord tail := by
  intro item hitem
  exact h item (by simp [hitem])

theorem eq_replicate_D_of_countE_zero
    {blocks : List Mat2} (hDE : DEWord blocks)
    (hcount : blocks.count E = 0) :
    blocks = List.replicate blocks.length D := by
  induction blocks with
  | nil => rfl
  | cons block tail ih =>
      have hblock := hDE block (by simp)
      rcases hblock with rfl | rfl
      · have hDETail := hDE.tail
        have htailCount : tail.count E = 0 := by
          have hDEneq : D ≠ E := by decide
          simpa [hDEneq] using hcount
        rw [ih hDETail htailCount]
        simp [List.replicate_succ]
      · simp at hcount

theorem split_first_E
    {blocks : List Mat2} (hDE : DEWord blocks)
    (hpos : 0 < blocks.count E) :
    ∃ before after,
      blocks = List.replicate before D ++ E :: after ∧
      after.count E + 1 = blocks.count E ∧ DEWord after := by
  induction blocks with
  | nil => simp at hpos
  | cons block tail ih =>
      have hblock := hDE block (by simp)
      rcases hblock with rfl | rfl
      · have hDEneq : D ≠ E := by decide
        have htailPos : 0 < tail.count E := by
          simpa [hDEneq] using hpos
        rcases ih hDE.tail htailPos with ⟨before, after, hsplit, hcount, hafter⟩
        refine ⟨before + 1, after, ?_, ?_, hafter⟩
        · rw [hsplit]
          simp [List.replicate_succ, List.replicate_add]
        · simpa [hDEneq] using hcount
      · exact ⟨0, tail, by simp, by simp, hDE.tail⟩

theorem decompose_two_E
    {blocks : List Mat2} (hDE : DEWord blocks)
    (hcount : 2 ≤ blocks.count E) :
    ∃ before middle after,
      blocks = List.replicate before D ++ [E] ++
        List.replicate middle D ++ [E] ++ after ∧
      after.count E + 2 = blocks.count E ∧ DEWord after := by
  rcases split_first_E hDE (by omega) with
    ⟨before, rest, hfirst, hrestCount, hrestDE⟩
  have hrestPos : 0 < rest.count E := by omega
  rcases split_first_E hrestDE hrestPos with
    ⟨middle, after, hsecond, hafterCount, hafterDE⟩
  refine ⟨before, middle, after, ?_, by omega, hafterDE⟩
  rw [hfirst, hsecond]
  simp [List.append_assoc]

theorem decompose_exact_two_E
    {blocks : List Mat2} (hDE : DEWord blocks)
    (hcount : blocks.count E = 2) :
    ∃ before middle after,
      blocks = List.replicate before D ++ [E] ++
        List.replicate middle D ++ [E] ++ List.replicate after D := by
  rcases decompose_two_E hDE (by omega) with
    ⟨before, middle, rest, hsplit, hrestCount, hrestDE⟩
  have hzero : rest.count E = 0 := by omega
  have hrestEq := eq_replicate_D_of_countE_zero hrestDE hzero
  refine ⟨before, middle, rest.length, ?_⟩
  rw [hsplit]
  conv_lhs => rw [hrestEq]

theorem initial_three_E_decomposition
    {blocks : List Mat2} (hhead : blocks.head? = some E)
    (hDE : DEWord blocks) (hcount : blocks.count E = 3) :
    ∃ before middle after,
      blocks = [E] ++ List.replicate before D ++ [E] ++
        List.replicate middle D ++ [E] ++ List.replicate after D := by
  cases blocks with
  | nil => simp at hhead
  | cons block tail =>
      simp only [List.head?_cons, Option.some.injEq] at hhead
      subst block
      have htailCount : tail.count E = 2 := by simpa using hcount
      rcases decompose_exact_two_E hDE.tail htailCount with
        ⟨before, middle, after, htail⟩
      exact ⟨before, middle, after, by simp [htail]⟩

theorem initial_one_E_decomposition
    {blocks : List Mat2} (hhead : blocks.head? = some E)
    (hDE : DEWord blocks) (hcount : blocks.count E = 1) :
    blocks = [E] ++ List.replicate (blocks.length - 1) D := by
  cases blocks with
  | nil => simp at hhead
  | cons block tail =>
      simp only [List.head?_cons, Option.some.injEq] at hhead
      subst block
      have htailCount : tail.count E = 0 := by simpa using hcount
      rw [eq_replicate_D_of_countE_zero hDE.tail htailCount]
      simp

end LatticePathOrdersKernel
