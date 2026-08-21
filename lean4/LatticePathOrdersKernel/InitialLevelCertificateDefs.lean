import LatticePathOrdersKernel.InitialSingletons

/-! # Literal statement of the initial-level clause of `thm:nonlocal` -/

namespace LatticePathOrdersKernel
open LatticePathOrders

/-- A field-by-field formal rendering of “the first `n` distinct matching
levels are the displayed singletons” in manuscript Theorem `thm:nonlocal`.
The exhaustion field makes “first” semantic rather than merely a list of
candidates; the count and strict-order fields make the number and order of
the levels explicit. -/
structure InitialMatchingLevelsCertificate (n : Nat) : Prop where
  minimum_carrier : Carrier n (n - 1) (minimumLevelPath n)
  minimum_block_word : adjacencyBlocks (minimumLevelPath n) =
    [E] ++ List.replicate (2 * n - 3) D
  candidate_carrier : ∀ r, r ≤ n - 3 →
    Carrier n (n - 1) (initialLevelPath n r)
  candidate_block_word : ∀ r, r ≤ n - 3 →
    adjacencyBlocks (initialLevelPath n r) =
      [E] ++ List.replicate (2 * r) D ++ [E] ++
        List.replicate (2 * n - 5 - 2 * r) D ++ [E]
  candidate_index_count : (Finset.Icc 0 (n - 3)).card = n - 2
  minimum_below_candidates : ∀ r, r ≤ n - 3 →
    sourceMatchingNumber (minimumLevelPath n) <
      sourceMatchingNumber (initialLevelPath n r)
  candidates_strictly_listed : ∀ r s, r ≤ n - 3 → s ≤ n - 3 →
    r < s → sourceMatchingNumber (initialLevelPath n s) <
      sourceMatchingNumber (initialLevelPath n r)
  candidates_below_Y : ∀ r, r ≤ n - 3 →
    sourceMatchingNumber (initialLevelPath n r) <
      sourceMatchingNumber (nonlocalY n)
  below_Y_exhaustive : ∀ word, Carrier n (n - 1) word →
    sourceMatchingNumber word < sourceMatchingNumber (nonlocalY n) →
    word = minimumLevelPath n ∨
      ∃ r ≤ n - 3, word = initialLevelPath n r
  minimum_singleton : ∀ word, Carrier n (n - 1) word →
    sourceMatchingNumber word = sourceMatchingNumber (minimumLevelPath n) →
    word = minimumLevelPath n
  candidate_singleton : ∀ r, r ≤ n - 3 → ∀ word,
    Carrier n (n - 1) word →
    sourceMatchingNumber word = sourceMatchingNumber (initialLevelPath n r) →
    word = initialLevelPath n r
  Y_carrier : Carrier n (n - 1) (nonlocalY n)
  Y_singleton : ∀ word, Carrier n (n - 1) word →
    sourceMatchingNumber word = sourceMatchingNumber (nonlocalY n) →
    word = nonlocalY n
  X_is_top_candidate : initialLevelPath n 0 = nonlocalX n

end LatticePathOrdersKernel
