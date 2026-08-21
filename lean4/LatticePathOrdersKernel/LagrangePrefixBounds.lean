import LatticePathOrdersKernel.FibonacciContinuant

/-!
# Soundness of the manuscript Lagrange prefix interval

This file proves the two rational inequalities labelled `eq:L-lower` and
`eq:L-upper` for every rational-Dyck completion of every nonempty prefix.
All divisions are in `Rat`; positivity of both denominator bounds is proved
inside the kernel.
-/

namespace LatticePathOrdersKernel

open LatticePathOrders

set_option maxHeartbeats 1000000

theorem lagrangeNumerator_lower_of_trace_le
    {lowerTrace : Nat} {word : Path}
    (htrace : lowerTrace ≤
      (LatticePathOrders.digitProduct (cyclicDigits word)).trace) :
    lowerTrace ^ 2 - 4 ≤ lagrangeNumerator word := by
  unfold lagrangeNumerator
  exact Nat.sub_le_sub_right (Nat.pow_le_pow_left htrace 2) 4

theorem lagrangeNumerator_upper_of_trace_le
    {upperTrace : Nat} {word : Path}
    (htrace :
      (LatticePathOrders.digitProduct (cyclicDigits word)).trace ≤ upperTrace) :
    lagrangeNumerator word ≤ upperTrace ^ 2 - 4 := by
  unfold lagrangeNumerator
  exact Nat.sub_le_sub_right (Nat.pow_le_pow_left htrace 2) 4

theorem lagrangeSq_lower_of_trace_q_bounds
    {word : Path} {lowerTrace upperQ : Nat}
    (htrace : lowerTrace ≤
      (LatticePathOrders.digitProduct (cyclicDigits word)).trace)
    (hq : qMin (cyclicDigits word) ≤ upperQ) :
    ((lowerTrace ^ 2 - 4 : Nat) : Rat) /
        ((upperQ ^ 2 : Nat) : Rat) ≤ lagrangeSq word := by
  have hnumNat := lagrangeNumerator_lower_of_trace_le htrace
  have hnum : ((lowerTrace ^ 2 - 4 : Nat) : Rat) ≤
      (lagrangeNumerator word : Rat) := by exact_mod_cast hnumNat
  have hdenNat : qMin (cyclicDigits word) ^ 2 ≤ upperQ ^ 2 :=
    Nat.pow_le_pow_left hq 2
  have hden : ((qMin (cyclicDigits word) ^ 2 : Nat) : Rat) ≤
      ((upperQ ^ 2 : Nat) : Rat) := by exact_mod_cast hdenNat
  have hqpos : 0 < ((qMin (cyclicDigits word) ^ 2 : Nat) : Rat) := by
    exact_mod_cast (Nat.pow_pos (qMin_cyclic_pos word))
  unfold lagrangeSq
  exact div_le_div₀ (by positivity) hnum hqpos hden

theorem lagrangeSq_upper_of_trace_fib_bounds
    {word : Path} {upperTrace fibLower : Nat}
    (htrace :
      (LatticePathOrders.digitProduct (cyclicDigits word)).trace ≤ upperTrace)
    (hq : fibLower ≤ qMin (cyclicDigits word))
    (hfib : 0 < fibLower) :
    lagrangeSq word ≤
      ((upperTrace ^ 2 - 4 : Nat) : Rat) /
        ((fibLower ^ 2 : Nat) : Rat) := by
  have hnumNat := lagrangeNumerator_upper_of_trace_le htrace
  have hnum : (lagrangeNumerator word : Rat) ≤
      ((upperTrace ^ 2 - 4 : Nat) : Rat) := by exact_mod_cast hnumNat
  have hdenNat : fibLower ^ 2 ≤ qMin (cyclicDigits word) ^ 2 :=
    Nat.pow_le_pow_left hq 2
  have hden : ((fibLower ^ 2 : Nat) : Rat) ≤
      ((qMin (cyclicDigits word) ^ 2 : Nat) : Rat) := by exact_mod_cast hdenNat
  have hfibSq : 0 < ((fibLower ^ 2 : Nat) : Rat) := by
    exact_mod_cast (Nat.pow_pos hfib)
  unfold lagrangeSq
  exact div_le_div₀ (by positivity) hnum hfibSq hden

/-- Manuscript formulas `eq:L-lower` and `eq:L-upper`, including the exact
leaf convention, for every carrier completion of a nonempty prefix. -/
theorem lagrange_prefix_bounds_sound
    {a b : Nat} (ha : 0 < a) (hb : 0 < b)
    {pfx word : Path} (hpfx : pfx ≠ [])
    (hpref : IsPrefix pfx word) (hword : Carrier a b word) :
    lagrangeLower (a + b) pfx ≤ lagrangeSq word ∧
      lagrangeSq word ≤ lagrangeUpper (a + b) pfx := by
  by_cases hleaf : pfx.length = a + b
  · have hpfxWord : pfx = word :=
      eq_of_prefix_of_eq_length hpref
        (hleaf.trans (carrier_length hword).symm)
    subst word
    simp [lagrangeLower, lagrangeUpper, hleaf]
  · rcases hpref with ⟨suffix, rfl⟩
    obtain ⟨first, tail, rfl⟩ := List.exists_cons_of_ne_nil hpfx
    have hwordLength := carrier_length hword
    have hremaining :
        a + b - (first :: tail).length = suffix.length := by
      simp only [List.length_append] at hwordLength
      omega
    have hmatrix := cyclic_completion_trace_denominator_bounds first tail suffix
    have hqFib := qMin_completion_fibonacci_lower
      (a := a) (b := b) (pfx := first :: tail)
      (by simp) ⟨suffix, rfl⟩ hword
    have hfib : 0 < fib (a + b + equalAdjacencies (first :: tail)) := by
      rw [projectFib_eq_natFib]
      exact Nat.fib_pos.mpr (by omega)
    unfold lagrangeLower lagrangeUpper
    simp only [if_neg hleaf]
    rw [hremaining]
    constructor
    · exact lagrangeSq_lower_of_trace_q_bounds hmatrix.1 hmatrix.2.2
    · exact lagrangeSq_upper_of_trace_fib_bounds
        hmatrix.2.1 hqFib hfib

/-- `PrefixBound.Sound` form consumed directly by cover certificates and the
best-first traversal. -/
theorem lagrangeBound_sound
    {a b : Nat} (ha : 0 < a) (hb : 0 < b)
    {pfx : Path} (hpfx : pfx ≠ []) :
    (lagrangeBound (a + b) pfx).Sound (Carrier a b) lagrangeSq := by
  intro word hword hpref
  exact lagrange_prefix_bounds_sound ha hb hpfx hpref hword

end LatticePathOrdersKernel
