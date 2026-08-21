import LatticePathOrdersKernel.LagrangePrefixMatrix
import Mathlib.Data.Nat.Fib.Basic
import Mathlib.Data.List.Induction

/-!
# The all-ones continuant lower bound

This is the denominator estimate used verbatim in manuscript formula
`eq:L-upper`: every positive digit word of length `m` has lower-left entry at
least `Fib m`.  The project Fibonacci function is also identified with
Mathlib's kernel-defined `Nat.fib`.
-/

namespace LatticePathOrdersKernel

open LatticePathOrders

@[simp] theorem projectFib_zero : fib 0 = 0 := rfl
@[simp] theorem projectFib_one : fib 1 = 1 := rfl

theorem projectFib_add_two (n : Nat) :
    fib (n + 2) = fib n + fib (n + 1) := by
  simp [fib, Nat.add_comm]

theorem projectFib_eq_natFib (n : Nat) : fib n = Nat.fib n := by
  induction n using Nat.twoStepInduction with
  | zero => rfl
  | one => rfl
  | more n ih0 ih1 =>
      rw [projectFib_add_two, Nat.fib_add_two, ih0, ih1]

theorem projectFib_mono : Monotone fib := by
  intro m n hmn
  rw [projectFib_eq_natFib, projectFib_eq_natFib]
  exact Nat.fib_mono hmn

theorem continuant_ge_projectFib_succ
    (digits : List Nat)
    (hpos : LatticePathOrdersClassical.PositiveDigits digits) :
    fib (digits.length + 1) ≤
      LatticePathOrdersClassical.continuant digits := by
  induction digits using List.twoStepInduction with
  | nil => decide
  | singleton digit =>
      have hdigit : 0 < digit := hpos digit (by simp)
      simp only [List.length_cons, List.length_nil, Nat.zero_add,
        LatticePathOrdersClassical.continuant_cons,
        LatticePathOrdersClassical.continuant_nil,
        LatticePathOrdersClassical.denominatorContinuant_nil]
      norm_num [fib]
      omega
  | cons_cons first second rest ihRest ihTail =>
      have hfirst : 0 < first := hpos first (by simp)
      have htail : LatticePathOrdersClassical.PositiveDigits (second :: rest) :=
        hpos.tail
      have hrest : LatticePathOrdersClassical.PositiveDigits rest := htail.tail
      have h1 := ihTail second htail
      have h0 := ihRest hrest
      change fib (rest.length + 3) ≤
        first * LatticePathOrdersClassical.continuant (second :: rest) +
          LatticePathOrdersClassical.continuant rest
      have hmul :
          LatticePathOrdersClassical.continuant (second :: rest) ≤
            first * LatticePathOrdersClassical.continuant (second :: rest) := by
        exact Nat.le_mul_of_pos_left _ hfirst
      calc
        fib (rest.length + 3) =
            fib (rest.length + 1) + fib (rest.length + 2) := by
          rw [show rest.length + 3 = (rest.length + 1) + 2 by omega,
            projectFib_add_two]
        _ ≤ LatticePathOrdersClassical.continuant rest +
            LatticePathOrdersClassical.continuant (second :: rest) :=
          Nat.add_le_add h0 h1
        _ ≤ first * LatticePathOrdersClassical.continuant (second :: rest) +
            LatticePathOrdersClassical.continuant rest := by
          omega

theorem digitProduct_a21_ge_projectFib_length
    (digits : List Nat)
    (hpos : LatticePathOrdersClassical.PositiveDigits digits) :
    fib digits.length ≤
      (LatticePathOrders.digitProduct digits).a21 := by
  cases digits with
  | nil => simp [LatticePathOrders.digitProduct, fib]
  | cons first tail =>
      have htail := hpos.tail
      have hbound := continuant_ge_projectFib_succ tail htail
      rw [lowerLeft_bridge,
        LatticePathOrdersClassical.digitProduct_a21]
      simpa using hbound

theorem qMin_ge_projectFib_length
    (digits : List Nat) (hne : digits ≠ [])
    (hpos : LatticePathOrdersClassical.PositiveDigits digits) :
    fib digits.length ≤ qMin digits := by
  let values := lowerLeftValues digits
  have hvalues : values ≠ [] := lowerLeftValues_ne_nil hne
  have hall : ∀ value ∈ values, fib digits.length ≤ value := by
    intro value hvalue
    rcases List.mem_map.mp hvalue with ⟨rotation, hrotation, rfl⟩
    rcases List.mem_map.mp hrotation with ⟨k, hk, rfl⟩
    have hrotatePos := hpos.rotate k
    have hlength : (digits.rotate k).length = digits.length := by simp
    simpa [hlength] using
      digitProduct_a21_ge_projectFib_length (digits.rotate k) hrotatePos
  unfold qMin
  rw [List.min?_eq_some_min hvalues]
  exact (List.le_min_iff hvalues).2 hall

theorem adjacencyDigits_length_eq
    (first : Step) (tail : Path) :
    (adjacencyDigits (first :: tail)).length =
      tail.length + equalAdjacencies (first :: tail) := by
  induction tail generalizing first with
  | nil => rfl
  | cons next rest ih =>
      by_cases hsame : first = next
      · subst first
        simp [adjacencyDigits, equalAdjacencies, ih] <;> omega
      · simp [adjacencyDigits, equalAdjacencies, hsame, ih next] <;> omega

theorem cyclicDigits_length_eq
    (first : Step) (tail : Path) :
    (cyclicDigits (first :: tail)).length =
      (first :: tail).length + equalAdjacencies (first :: tail) := by
  simp [cyclicDigits, adjacencyDigits_length_eq] <;> omega

theorem equalAdjacencies_append_le (pfx suffix : Path) :
    equalAdjacencies pfx ≤ equalAdjacencies (pfx ++ suffix) := by
  induction pfx using List.twoStepInduction with
  | nil => simp [equalAdjacencies]
  | singleton first => simp [equalAdjacencies]
  | cons_cons first second rest ihRest ihTail =>
      simp only [List.cons_append, equalAdjacencies]
      exact Nat.add_le_add_left (ihTail second) _

theorem cyclicDigits_completion_length_lower
    {a b : Nat} {pfx word : Path}
    (hpfx : pfx ≠ [])
    (hpref : IsPrefix pfx word)
    (hword : Carrier a b word) :
    a + b + equalAdjacencies pfx ≤ (cyclicDigits word).length := by
  rcases hpref with ⟨suffix, rfl⟩
  obtain ⟨first, tail, rfl⟩ := List.exists_cons_of_ne_nil hpfx
  change a + b + equalAdjacencies (first :: tail) ≤
    (cyclicDigits (first :: (tail ++ suffix))).length
  rw [cyclicDigits_length_eq]
  have hlen := carrier_length hword
  have heq := equalAdjacencies_append_le (first :: tail) suffix
  have hlen' : (first :: (tail ++ suffix)).length = a + b := by
    simpa only [List.cons_append] using hlen
  have heq' : equalAdjacencies (first :: tail) ≤
      equalAdjacencies (first :: (tail ++ suffix)) := by
    simpa only [List.cons_append] using heq
  rw [hlen']
  omega

theorem qMin_completion_fibonacci_lower
    {a b : Nat} {pfx word : Path}
    (hpfx : pfx ≠ [])
    (hpref : IsPrefix pfx word)
    (hword : Carrier a b word) :
    fib (a + b + equalAdjacencies pfx) ≤
      qMin (cyclicDigits word) := by
  have hlen := cyclicDigits_completion_length_lower hpfx hpref hword
  have hpos := cyclicDigits_positive word
  have hq := qMin_ge_projectFib_length (cyclicDigits word)
    (by simp [cyclicDigits]) hpos
  exact (projectFib_mono hlen).trans hq

theorem qMin_cyclic_pos (word : Path) : 0 < qMin (cyclicDigits word) := by
  have hq := qMin_ge_projectFib_length (cyclicDigits word)
    (by simp [cyclicDigits]) (cyclicDigits_positive word)
  have hfib : 0 < fib (cyclicDigits word).length := by
    rw [projectFib_eq_natFib]
    simpa using (Nat.fib_pos.mpr (by simp [cyclicDigits]))
  omega

end LatticePathOrdersKernel
