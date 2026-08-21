import LatticePathOrdersKernel.YUnique

/-! # The complete odd-index Pell-product chain

This is the determinant-identity chain used in the initial-level clause of
manuscript Theorem `thm:nonlocal`.  The earlier half-chain lemma is reflected
through `pellF_symm`, so the statement covers the literal range through
`N - 2`.
-/

namespace LatticePathOrdersKernel

theorem pellF_odd_two_step_decreases_full
    {N k : Nat} (hNOdd : Odd N) (hkOdd : Odd k)
    (hkpos : 1 ≤ k) (hkupper : k + 2 ≤ N - 2) :
    pellF N (k + 2) < pellF N k := by
  by_cases hleft : 2 * k + 2 < N
  · exact pellF_odd_two_step_decreases hkOdd hleft
  · let reflected := N - (k + 2)
    have hk2N : k + 2 ≤ N := by omega
    have hkN : k ≤ N := by omega
    rcases hNOdd with ⟨u, hu⟩
    rcases hkOdd with ⟨v, hv⟩
    have hreflectedEven : Even reflected := by
      refine ⟨u - v - 1, ?_⟩
      dsimp [reflected]
      omega
    have hreflectedStep : reflected + 2 = N - k := by
      dsimp [reflected]
      omega
    have hright : 2 * reflected + 2 < N := by
      dsimp [reflected]
      omega
    have hinc := pellF_even_two_step_increases
      (N := N) (k := reflected) hreflectedEven hright
    have hsymRight := pellF_symm (N := N) (k := k + 2) hk2N
    have hsymLeft := pellF_symm (N := N) (k := k) hkN
    rw [hreflectedStep] at hinc
    exact hsymRight.trans_lt (hinc.trans_eq hsymLeft.symm)

theorem initialLevelPath_score_adjacent
    {n r : Nat} (hn : 4 ≤ n) (hr : r + 1 ≤ n - 3) :
    sourceMatchingNumber (initialLevelPath n (r + 1)) <
      sourceMatchingNumber (initialLevelPath n r) := by
  rw [initialLevelPath_score hn (by omega), initialLevelPath_score hn (by omega)]
  have hchain := pellF_odd_two_step_decreases_full
    (N := 2 * n - 3) (k := 2 * r + 1)
    (odd_two_n_sub_three (by omega)) ⟨r, by omega⟩ (by omega) (by omega)
  have hindex : 2 * (r + 1) + 1 = (2 * r + 1) + 2 := by omega
  rw [hindex]
  omega

end LatticePathOrdersKernel
