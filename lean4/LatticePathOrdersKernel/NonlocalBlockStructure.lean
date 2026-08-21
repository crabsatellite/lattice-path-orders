import LatticePathOrdersKernel.NonlocalScores

/-! # Block-word constraints at endpoint `(n,n-1)` -/

namespace LatticePathOrdersKernel

open LatticePathOrders

theorem carrier_nn1_starts_RR
    {n : Nat} (hn : 2 ≤ n) {word : Path}
    (hword : Carrier n (n - 1) word) :
    ∃ tail, word = Step.R :: Step.R :: tail := by
  rcases carrier_starts_R (by omega) hword with ⟨tail, htail⟩
  simp only [List.singleton_append] at htail
  subst word
  cases tail with
  | nil =>
      have hlen := carrier_length hword
      simp at hlen
      omega
  | cons next rest =>
      cases next with
      | R => exact ⟨rest, rfl⟩
      | U =>
          have hc := carrier_components hword
          have hineq := feasible_nextU (p := [Step.R]) (rest := rest) hc.2.2
          simp [Path.countR, Path.countU] at hineq
          omega

theorem adjacencyBlocks_length_nonempty
    (first : Step) (tail : Path) :
    (adjacencyBlocks (first :: tail)).length = tail.length := by
  rw [adjacencyBlocks_cons, edgeBlocks_length]

theorem adjacencyBlocks_countE_eq_equalAdjacencies
    (word : Path) :
    (adjacencyBlocks word).count E = equalAdjacencies word := by
  induction word with
  | nil => rfl
  | cons first tail ih =>
      cases tail with
      | nil => rfl
      | cons next rest =>
          by_cases hsame : first = next
          · subst next
            simp [adjacencyBlocks, equalAdjacencies, ih, Nat.add_comm]
          · have hDE : D ≠ E := by decide
            have hED : E ≠ D := hDE.symm
            simp [adjacencyBlocks, equalAdjacencies, hsame, hDE, hED, ih]

theorem adjacencyBlocks_mem_DE
    (word : Path) {block : Mat2} (hblock : block ∈ adjacencyBlocks word) :
    block = D ∨ block = E := by
  induction word with
  | nil => simp [adjacencyBlocks] at hblock
  | cons first tail ih =>
      cases tail with
      | nil => simp [adjacencyBlocks] at hblock
      | cons next rest =>
          simp only [adjacencyBlocks, List.mem_cons] at hblock
          rcases hblock with hfirst | hrest
          · by_cases hsame : first = next
            · exact Or.inr (by simpa [hsame] using hfirst)
            · exact Or.inl (by simpa [hsame] using hfirst)
          · exact ih hrest

theorem carrier_nn1_block_data
    {n : Nat} (hn : 4 ≤ n) {word : Path}
    (hword : Carrier n (n - 1) word) :
    let blocks := adjacencyBlocks word
    blocks.length = 2 * n - 2 ∧
      blocks.head? = some E ∧
      Odd (blocks.count E) ∧
      (∀ block ∈ blocks, block = D ∨ block = E) := by
  rcases carrier_nn1_starts_RR (by omega) hword with ⟨tail, rfl⟩
  have hlen := carrier_length hword
  have hblocksLength := adjacencyBlocks_length_nonempty
    Step.R (Step.R :: tail)
  have hcount := adjacencyBlocks_countE_eq_equalAdjacencies
    (Step.R :: Step.R :: tail)
  have heven := carrier_cyclicDigits_even (by omega) (by omega) hword
  have hcyclicLength := cyclicDigits_length_eq Step.R (Step.R :: tail)
  have hoddEqual : Odd (equalAdjacencies (Step.R :: Step.R :: tail)) := by
    have hwordLength : (Step.R :: Step.R :: tail).length = 2 * n - 1 := by
      omega
    rcases Nat.even_or_odd
        (equalAdjacencies (Step.R :: Step.R :: tail)) with hequalEven | hequalOdd
    · exfalso
      rcases heven with ⟨q, hq⟩
      rcases hequalEven with ⟨r, hr⟩
      have hparityEq : 2 * n - 1 + (r + r) = q + q := by
        rw [← hwordLength, ← hr, ← hcyclicLength]
        exact hq
      omega
    · exact hequalOdd
  have hblocksFinal :
      (adjacencyBlocks (Step.R :: Step.R :: tail)).length = 2 * n - 2 := by
    rw [hblocksLength]
    simp only [List.length_cons] at hlen ⊢
    omega
  refine ⟨hblocksFinal, ?_, ?_, ?_⟩
  · simp [adjacencyBlocks, E]
  · rw [hcount]
    exact hoddEqual
  · intro block hblock
    exact adjacencyBlocks_mem_DE _ hblock

end LatticePathOrdersKernel
