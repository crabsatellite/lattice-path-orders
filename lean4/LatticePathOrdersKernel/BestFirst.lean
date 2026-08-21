import LatticePathOrdersKernel.GlobalCoverCriterion

/-!
# Best-first emission theorem

This is the kernel form of manuscript Lemma `lem:best-first`.  A ready state
records exactly the frontier invariant and the two priority-queue rules:
minimum lower key, with a nonleaf taking precedence over a leaf at an equal
key.  The theorem proves both score ordering and completeness of the current
equality batch.
-/

namespace LatticePathOrdersKernel

open LatticePathOrders

structure BestFirstReady {alpha : Type*} [LinearOrder alpha]
    (carrier : Path → Prop) (score key : Path → alpha)
    (total : Nat) (selected : Path) (remaining : List Path) where
  frontier : List Path
  selected_mem : selected ∈ frontier
  selected_leaf : selected.length = total
  selected_exact : key selected = score selected
  remaining_sound : ∀ word ∈ remaining, carrier word
  remaining_length : ∀ word ∈ remaining, word.length = total
  covers_remaining : ∀ word ∈ remaining,
    ∃ p ∈ frontier, IsPrefix p word
  key_lower : ∀ p ∈ frontier, ∀ word ∈ remaining,
    IsPrefix p word → key p ≤ score word
  minimum_key : ∀ p ∈ frontier, key selected ≤ key p
  nonleaf_first : ∀ p ∈ frontier, p.length < total →
    key selected < key p

theorem prefix_length_le {p word : Path} (hp : IsPrefix p word) :
    p.length ≤ word.length := by
  rcases hp with ⟨suffix, rfl⟩
  simp [List.length_append]

/-- Manuscript Lemma `lem:best-first`, at one emission state. -/
theorem bestFirst_emission_order_and_batch
    {alpha : Type*} [LinearOrder alpha]
    {carrier : Path → Prop} {score key : Path → alpha}
    {total : Nat} {selected : Path} {remaining : List Path}
    (ready : BestFirstReady carrier score key total selected remaining) :
    (∀ word ∈ remaining, score selected ≤ score word) ∧
      (∀ word ∈ remaining, score word = score selected →
        word ∈ ready.frontier ∧ word.length = total) := by
  constructor
  · intro word hword
    rcases ready.covers_remaining word hword with ⟨p, hp, hpref⟩
    have hlower := ready.key_lower p hp word hword hpref
    have hminimum := ready.minimum_key p hp
    rw [ready.selected_exact] at hminimum
    exact hminimum.trans hlower
  · intro word hword heq
    rcases ready.covers_remaining word hword with ⟨p, hp, hpref⟩
    have hlower := ready.key_lower p hp word hword hpref
    have hminimum := ready.minimum_key p hp
    have hupper : key p ≤ key selected := by
      rw [ready.selected_exact, ← heq]
      exact hlower
    have hkeyEq : key p = key selected := by
      exact le_antisymm hupper hminimum
    have hple : p.length ≤ total := by
      rw [← ready.remaining_length word hword]
      exact prefix_length_le hpref
    have hplen : p.length = total := by
      by_contra hne
      have hplt : p.length < total := lt_of_le_of_ne hple hne
      have hstrict := ready.nonleaf_first p hp hplt
      rw [hkeyEq] at hstrict
      exact (lt_irrefl _ hstrict)
    have hpword : p = word := eq_of_prefix_of_eq_length hpref
      (hplen.trans (ready.remaining_length word hword).symm)
    subst p
    exact ⟨hp, ready.remaining_length word hword⟩

inductive BestFirstRun {alpha : Type*} [LinearOrder alpha]
    (carrier : Path → Prop) (score key : Path → alpha)
    (total : Nat) : List Path → Prop
  | nil : BestFirstRun carrier score key total []
  | cons {selected : Path} {remaining : List Path} :
      BestFirstReady carrier score key total selected remaining →
      BestFirstRun carrier score key total remaining →
      BestFirstRun carrier score key total (selected :: remaining)

/-- Repeated ready emissions give a globally nondecreasing output list. -/
theorem BestFirstRun.pairwise_score
    {alpha : Type*} [LinearOrder alpha]
    {carrier : Path → Prop} {score key : Path → alpha}
    {total : Nat} {output : List Path}
    (run : BestFirstRun carrier score key total output) :
    output.Pairwise (fun left right => score left ≤ score right) := by
  induction run with
  | nil => exact List.Pairwise.nil
  | @cons selected remaining ready _ ih =>
      apply List.Pairwise.cons
      · intro word hword
        exact (bestFirst_emission_order_and_batch ready).1 word hword
      · exact ih

def CompleteBestFirstRun {alpha : Type*} [LinearOrder alpha]
    (carrier : Path → Prop) (score key : Path → alpha)
    (total : Nat) (leaves output : List Path) : Prop :=
  BestFirstRun carrier score key total output ∧ output.Perm leaves

theorem completeBestFirstRun_sorted_complete
    {alpha : Type*} [LinearOrder alpha]
    {carrier : Path → Prop} {score key : Path → alpha}
    {total : Nat} {leaves output : List Path}
    (run : CompleteBestFirstRun carrier score key total leaves output) :
    output.Pairwise (fun left right => score left ≤ score right) ∧
      output.Perm leaves :=
  ⟨run.1.pairwise_score, run.2⟩

def matchingBestFirstKey (total : Nat) (pfx : Path) : Nat :=
  if pfx.length = total then matchingScore pfx
  else matchingLower pfx (total - pfx.length)

def lagrangeBestFirstKey (total : Nat) (pfx : Path) : Rat :=
  if pfx.length = total then lagrangeSq pfx
  else lagrangeLower total pfx

theorem matchingBestFirstKey_lower
    {a b : Nat} {pfx word : Path} (hpfx : pfx ≠ [])
    (hpref : IsPrefix pfx word) (hword : Carrier a b word) :
    matchingBestFirstKey (a + b) pfx ≤ matchingScore word := by
  by_cases hleaf : pfx.length = a + b
  · have hpfxWord := eq_of_prefix_of_eq_length hpref
      (hleaf.trans (carrier_length hword).symm)
    subst word
    simp [matchingBestFirstKey, hleaf]
  · simp only [matchingBestFirstKey, if_neg hleaf]
    exact (matching_prefix_bound_sound hpfx hpref (carrier_length hword)).1

theorem lagrangeBestFirstKey_lower
    {a b : Nat} (ha : 0 < a) (hb : 0 < b)
    {pfx word : Path} (hpfx : pfx ≠ [])
    (hpref : IsPrefix pfx word) (hword : Carrier a b word) :
    lagrangeBestFirstKey (a + b) pfx ≤ lagrangeSq word := by
  by_cases hleaf : pfx.length = a + b
  · have hpfxWord := eq_of_prefix_of_eq_length hpref
      (hleaf.trans (carrier_length hword).symm)
    subst word
    simp [lagrangeBestFirstKey, hleaf]
  · simp only [lagrangeBestFirstKey, if_neg hleaf]
    exact (lagrange_prefix_bounds_sound ha hb hpfx hpref hword).1

end LatticePathOrdersKernel
