import LatticePathOrdersKernel.BestFirst
import Mathlib.Data.List.MinMax

/-!
# Operational best-first traversal of the rational-Dyck prefix tree

Unlike `BestFirstRun`, this model records the actual frontier before and after
every step.  An expansion erases the selected prefix and inserts precisely its
feasible one-step children; an emission erases a selected leaf and appends it
to the chronological output.
-/

namespace LatticePathOrdersKernel

open LatticePathOrders

def HasCarrierCompletion (a b : Nat) (pfx : Path) : Prop :=
  ∃ word, Carrier a b word ∧ IsPrefix pfx word

noncomputable instance hasCarrierCompletionDecidable (a b : Nat) (pfx : Path) :
    Decidable (HasCarrierCompletion a b pfx) := by
  unfold HasCarrierCompletion
  let candidates := carrierPaths a b
  by_cases h : ∃ word ∈ candidates, IsPrefix pfx word
  · exact isTrue (by
      rcases h with ⟨word, hword, hpref⟩
      exact ⟨word, carrierPaths_sound a b word hword, hpref⟩)
  · exact isFalse (by
      rintro ⟨word, hword, hpref⟩
      exact h ⟨word, carrierPaths_complete a b word hword, hpref⟩)

noncomputable def feasibleChildren (a b : Nat) (pfx : Path) : Finset Path :=
  ({pfx ++ [Step.R], pfx ++ [Step.U]} : Finset Path).filter
    (HasCarrierCompletion a b)

def PrefixFinsetAntichain (frontier : Finset Path) : Prop :=
  ∀ ⦃left⦄, left ∈ frontier → ∀ ⦃right⦄, right ∈ frontier → left ≠ right →
    (¬ IsPrefix left right) ∧ (¬ IsPrefix right left)

def PrefixCovered (frontier : Finset Path) (word : Path) : Prop :=
  ∃ pfx ∈ frontier, IsPrefix pfx word

structure OperationalBestFirstState where
  frontier : Finset Path
  output : List Path

structure OperationalBestFirstValid
    (a b : Nat) {alpha : Type*} [LinearOrder alpha]
    (score : Path → alpha) (state : OperationalBestFirstState) : Prop where
  frontier_antichain : PrefixFinsetAntichain state.frontier
  frontier_nonempty : ∀ pfx ∈ state.frontier, pfx ≠ []
  frontier_length : ∀ pfx ∈ state.frontier, pfx.length ≤ a + b
  frontier_completion : ∀ pfx ∈ state.frontier, HasCarrierCompletion a b pfx
  output_nodup : state.output.Nodup
  output_sound : ∀ word ∈ state.output, Carrier a b word
  output_length : ∀ word ∈ state.output, word.length = a + b
  carrier_partition : ∀ word, Carrier a b word →
    (word ∈ state.output ↔ ¬ PrefixCovered state.frontier word)
  output_pairwise : state.output.Pairwise
    (fun left right => score left ≤ score right)
  output_le_unemitted : ∀ emitted ∈ state.output, ∀ word,
    Carrier a b word → word ∉ state.output → score emitted ≤ score word

structure BestFirstChoice
    {alpha : Type*} [LinearOrder alpha]
    (key : Path → alpha) (total : Nat) (frontier : Finset Path)
    (selected : Path) : Prop where
  selected_mem : selected ∈ frontier
  minimum_key : ∀ pfx ∈ frontier, key selected ≤ key pfx
  nonleaf_first : selected.length = total →
    ∀ pfx ∈ frontier, pfx.length < total → key selected < key pfx

noncomputable def expandBestFirstState
    (a b : Nat) (state : OperationalBestFirstState) (selected : Path) :
    OperationalBestFirstState :=
  ⟨(state.frontier.erase selected) ∪ feasibleChildren a b selected,
    state.output⟩

def emitBestFirstState
    (state : OperationalBestFirstState) (selected : Path) :
    OperationalBestFirstState :=
  ⟨state.frontier.erase selected, state.output ++ [selected]⟩

inductive OperationalBestFirstStep
    (a b : Nat) {alpha : Type*} [LinearOrder alpha]
    (key : Path → alpha) :
    OperationalBestFirstState → OperationalBestFirstState → Prop
  | expand (state : OperationalBestFirstState) (selected : Path)
      (choice : BestFirstChoice key (a + b) state.frontier selected)
      (hnonleaf : selected.length < a + b) :
      OperationalBestFirstStep a b key state
        (expandBestFirstState a b state selected)
  | emit (state : OperationalBestFirstState) (selected : Path)
      (choice : BestFirstChoice key (a + b) state.frontier selected)
      (hleaf : selected.length = a + b) :
      OperationalBestFirstStep a b key state
        (emitBestFirstState state selected)

def OperationalBestFirstReach
    (a b : Nat) {alpha : Type*} [LinearOrder alpha]
    (key : Path → alpha) :=
  Relation.ReflTransGen (OperationalBestFirstStep a b key)

def initialBestFirstState : OperationalBestFirstState :=
  ⟨{[Step.R]}, []⟩

def TerminalBestFirstState (state : OperationalBestFirstState) : Prop :=
  state.frontier = ∅

end LatticePathOrdersKernel
