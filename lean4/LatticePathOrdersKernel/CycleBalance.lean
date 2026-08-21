import LatticePathOrdersKernel.PellMatrixExpansion
import Mathlib.Data.Finset.Max

/-!
# Balance formulation of rational-Dyck feasibility

This file prepares the coprime cycle lemma using the manuscript weights
`R ↦ b`, `U ↦ -a`.
-/

namespace LatticePathOrdersKernel

open LatticePathOrders

def stepBalance (a b : Nat) : Step → Int
  | .R => b
  | .U => -(a : Int)

def wordBalance (a b : Nat) (word : Path) : Int :=
  (word.map (stepBalance a b)).sum

def prefixBalance (a b : Nat) (word : Path) (k : Nat) : Int :=
  wordBalance a b (word.take k)

theorem wordBalance_eq_counts (a b : Nat) (word : Path) :
    wordBalance a b word =
      (b : Int) * Path.countR word - (a : Int) * Path.countU word := by
  unfold Path.countR Path.countU
  induction word with
  | nil => simp [wordBalance, Path.countR, Path.countU]
  | cons step tail ih =>
      unfold wordBalance at ih
      cases step <;>
        simp [wordBalance, stepBalance, Path.countR, Path.countU] <;>
          rw [ih] <;> ring

theorem prefixFeasible_iff_balance
    {a b : Nat} {word : Path} :
    prefixFeasible a b word = true ↔
      ∀ k, k ≤ word.length → 0 ≤ prefixBalance a b word k := by
  constructor
  · intro hfeasible k hk
    have hall := List.all_eq_true.mp hfeasible
    have hkRange : k ∈ List.range (word.length + 1) :=
      List.mem_range.mpr (by omega)
    have hbool := hall k hkRange
    have hnat : a * Path.countU (word.take k) ≤
        b * Path.countR (word.take k) := by
      simpa using hbool
    unfold prefixBalance
    rw [wordBalance_eq_counts]
    have hcast : (a : Int) * Path.countU (word.take k) ≤
        (b : Int) * Path.countR (word.take k) := by
      exact_mod_cast hnat
    omega
  · intro hbalance
    apply List.all_eq_true.mpr
    intro k hk
    have hkLe : k ≤ word.length := by
      have := List.mem_range.mp hk
      omega
    have hint := hbalance k hkLe
    unfold prefixBalance at hint
    rw [wordBalance_eq_counts] at hint
    have hcast : (a : Int) * Path.countU (word.take k) ≤
        (b : Int) * Path.countR (word.take k) := by
      omega
    have hnat : a * Path.countU (word.take k) ≤
        b * Path.countR (word.take k) := by
      exact_mod_cast hcast
    simpa using hnat

theorem carrier_iff_balance
    {a b : Nat} {word : Path} :
    Carrier a b word ↔
      Path.countR word = a ∧ Path.countU word = b ∧
        ∀ k, k ≤ word.length → 0 ≤ prefixBalance a b word k := by
  constructor
  · intro hword
    have hc := carrier_components hword
    exact ⟨hc.1, hc.2.1, prefixFeasible_iff_balance.mp hc.2.2⟩
  · rintro ⟨hr, hu, hprefix⟩
    simpa [Carrier, inCarrier, Bool.and_eq_true] using
      (⟨⟨hr, hu⟩, prefixFeasible_iff_balance.mpr hprefix⟩ :
        (Path.countR word = a ∧ Path.countU word = b) ∧
          prefixFeasible a b word = true)

theorem wordBalance_zero_of_counts
    {a b : Nat} {word : Path}
    (hr : Path.countR word = a) (hu : Path.countU word = b) :
    wordBalance a b word = 0 := by
  rw [wordBalance_eq_counts, hr, hu]
  ring

theorem wordBalance_append (a b : Nat) (left right : Path) :
    wordBalance a b (left ++ right) =
      wordBalance a b left + wordBalance a b right := by
  simp [wordBalance, List.map_append, List.sum_append]

theorem prefixBalance_subsegment
    (a b : Nat) (word : Path) {i j : Nat}
    (hij : i ≤ j) (hj : j ≤ word.length) :
    prefixBalance a b word j - prefixBalance a b word i =
      wordBalance a b ((word.take j).drop i) := by
  have hsplit : word.take j = word.take i ++ (word.take j).drop i := by
    calc
      word.take j = (word.take j).take i ++ (word.take j).drop i :=
        (List.take_append_drop i (word.take j)).symm
      _ = word.take i ++ (word.take j).drop i := by
        rw [List.take_take, Nat.min_eq_left hij]
  have hbalanceSplit := congrArg (wordBalance a b) hsplit
  rw [wordBalance_append] at hbalanceSplit
  unfold prefixBalance
  linarith

theorem segment_counts_le_total
    {word segment : Path} (hsegment : List.Sublist segment word) :
    Path.countR segment ≤ Path.countR word ∧
      Path.countU segment ≤ Path.countU word := by
  constructor
  · simpa [Path.countR] using List.Sublist.count_le Step.R hsegment
  · simpa [Path.countU] using List.Sublist.count_le Step.U hsegment

theorem coprime_balance_segment_extreme
    {a b r u : Nat} (ha : 0 < a) (hb : 0 < b)
    (hcoprime : Nat.Coprime a b) (hr : r ≤ a) (hu : u ≤ b)
    (hbalance : b * r = a * u) :
    (r = 0 ∧ u = 0) ∨ (r = a ∧ u = b) := by
  have haDiv : a ∣ r := by
    apply hcoprime.dvd_of_dvd_mul_left
    exact ⟨u, hbalance⟩
  rcases haDiv with ⟨q, rfl⟩
  have hq : q = 0 ∨ q = 1 := by
    have : a * q ≤ a * 1 := by simpa using hr
    have hqle : q ≤ 1 := Nat.le_of_mul_le_mul_left this ha
    omega
  rcases hq with rfl | rfl
  · left
    simp at hbalance
    exact ⟨rfl, by omega⟩
  · right
    constructor
    · simp
    · have : a * u = a * b := by
        simpa [Nat.mul_comm] using hbalance.symm
      exact Nat.eq_of_mul_eq_mul_left ha this

end LatticePathOrdersKernel
