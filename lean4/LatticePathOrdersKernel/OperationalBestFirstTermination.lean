import LatticePathOrdersKernel.OperationalBestFirstUpdate
import LatticePathOrdersKernel.BalancedPathCount

/-!
# Termination and completeness of the operational traversal

The frontier potential assigns weight `3^(remaining depth)` to a prefix.
Replacing one prefix by at most two one-step children strictly decreases that
weight; emitting a leaf removes positive weight.  This supplies a kernel-
checked termination argument for the actual queue transition system.
-/

namespace LatticePathOrdersKernel

open LatticePathOrders
open scoped BigOperators

def prefixPotential (total : Nat) (pfx : Path) : Nat :=
  3 ^ (total - pfx.length)

def frontierPotential (total : Nat) (frontier : Finset Path) : Nat :=
  ∑ pfx ∈ frontier, prefixPotential total pfx

theorem feasibleChildren_potential_lt
    {a b : Nat} {pfx : Path} (hshort : pfx.length < a + b) :
    frontierPotential (a + b) (feasibleChildren a b pfx) <
      prefixPotential (a + b) pfx := by
  have hsub : a + b - pfx.length =
      (a + b - (pfx.length + 1)) + 1 := by omega
  have hpositive : 0 < 3 ^ (a + b - (pfx.length + 1)) :=
    pow_pos (by omega) _
  have hpow : 3 ^ (a + b - pfx.length) =
      3 * 3 ^ (a + b - (pfx.length + 1)) := by
    rw [hsub, pow_succ]
    omega
  by_cases hR : HasCarrierCompletion a b (pfx ++ [Step.R])
  · by_cases hU : HasCarrierCompletion a b (pfx ++ [Step.U])
    · have hchildren : feasibleChildren a b pfx =
          {pfx ++ [Step.R], pfx ++ [Step.U]} := by
        ext child
        rw [feasibleChildren_mem_iff]
        simp only [Finset.mem_insert, Finset.mem_singleton]
        constructor
        · exact fun h ↦ h.1
        · intro h
          refine ⟨h, ?_⟩
          rcases h with rfl | rfl
          · exact hR
          · exact hU
      simp [frontierPotential, hchildren, prefixPotential, hpow]
      omega
    · have hchildren : feasibleChildren a b pfx =
          {pfx ++ [Step.R]} := by
        ext child
        rw [feasibleChildren_mem_iff]
        simp only [Finset.mem_singleton]
        constructor
        · rintro ⟨h | h, hcompletion⟩
          · exact h
          · subst child
            exact False.elim (hU hcompletion)
        · intro h
          subst child
          exact ⟨Or.inl rfl, hR⟩
      simp [frontierPotential, hchildren, prefixPotential, hpow]
  · by_cases hU : HasCarrierCompletion a b (pfx ++ [Step.U])
    · have hchildren : feasibleChildren a b pfx =
          {pfx ++ [Step.U]} := by
        ext child
        rw [feasibleChildren_mem_iff]
        simp only [Finset.mem_singleton]
        constructor
        · rintro ⟨h | h, hcompletion⟩
          · subst child
            exact False.elim (hR hcompletion)
          · exact h
        · intro h
          subst child
          exact ⟨Or.inr rfl, hU⟩
      simp [frontierPotential, hchildren, prefixPotential, hpow]
    · have hchildren : feasibleChildren a b pfx = ∅ := by
        ext child
        rw [feasibleChildren_mem_iff]
        constructor
        · rintro ⟨h | h, hcompletion⟩
          · subst child
            exact False.elim (hR hcompletion)
          · subst child
            exact False.elim (hU hcompletion)
        · intro hmem
          exact False.elim (Finset.notMem_empty child hmem)
      simp [frontierPotential, hchildren, prefixPotential, hpow]

theorem feasibleChildren_disjoint_erase
    {a b : Nat} {alpha : Type*} [LinearOrder alpha]
    {score : Path → alpha} {state : OperationalBestFirstState}
    (valid : OperationalBestFirstValid a b score state)
    {selected : Path} (hselected : selected ∈ state.frontier) :
    Disjoint (state.frontier.erase selected)
      (feasibleChildren a b selected) := by
  apply Finset.disjoint_left.mpr
  intro pfx hpfxOld hpfxChild
  have hpfxData := Finset.mem_erase.mp hpfxOld
  have hold := valid.frontier_antichain hselected hpfxData.2
    hpfxData.1.symm
  exact hold.1 (feasibleChild_extends hpfxChild)

theorem expand_frontierPotential_lt
    {a b : Nat} {alpha : Type*} [LinearOrder alpha]
    {score : Path → alpha} {state : OperationalBestFirstState}
    (valid : OperationalBestFirstValid a b score state)
    {selected : Path} (hselected : selected ∈ state.frontier)
    (hshort : selected.length < a + b) :
    frontierPotential (a + b)
        (expandBestFirstState a b state selected).frontier <
      frontierPotential (a + b) state.frontier := by
  have hdisjoint := feasibleChildren_disjoint_erase valid hselected
  have hchildren := feasibleChildren_potential_lt hshort
  calc
    frontierPotential (a + b)
        (expandBestFirstState a b state selected).frontier =
        frontierPotential (a + b) (state.frontier.erase selected) +
          frontierPotential (a + b) (feasibleChildren a b selected) := by
      simp only [expandBestFirstState, frontierPotential]
      exact Finset.sum_union hdisjoint
    _ < frontierPotential (a + b) (state.frontier.erase selected) +
          prefixPotential (a + b) selected :=
      Nat.add_lt_add_left hchildren _
    _ = frontierPotential (a + b) state.frontier := by
      simpa only [frontierPotential] using
        (Finset.sum_erase_add state.frontier
          (prefixPotential (a + b)) hselected)

theorem emit_frontierPotential_lt
    {total : Nat} {state : OperationalBestFirstState} {selected : Path}
    (hselected : selected ∈ state.frontier) :
    frontierPotential total (emitBestFirstState state selected).frontier <
      frontierPotential total state.frontier := by
  have hpositive : 0 < prefixPotential total selected := by
    exact pow_pos (by omega) _
  have hsum := Finset.sum_erase_add state.frontier
    (prefixPotential total) hselected
  simp only [emitBestFirstState, frontierPotential] at hsum ⊢
  rw [← hsum]
  omega

theorem operationalBestFirst_reaches_terminal_from
    {a b : Nat} {alpha : Type*} [LinearOrder alpha]
    {score key : Path → alpha}
    (key_lower : ∀ pfx, pfx ≠ [] → ∀ word, Carrier a b word →
      IsPrefix pfx word → key pfx ≤ score word)
    (key_leaf_exact : ∀ word, Carrier a b word →
      word.length = a + b → key word = score word)
    {state : OperationalBestFirstState}
    (valid : OperationalBestFirstValid a b score state) :
    ∃ terminal,
      OperationalBestFirstReach a b key state terminal ∧
      OperationalBestFirstValid a b score terminal ∧
      TerminalBestFirstState terminal := by
  induction hpotential : frontierPotential (a + b) state.frontier using
      Nat.strong_induction_on generalizing state with
  | _ potential ih =>
      subst hpotential
      by_cases hterminal : state.frontier = ∅
      · exact ⟨state, Relation.ReflTransGen.refl, valid, hterminal⟩
      · have hnonempty : state.frontier.Nonempty :=
          Finset.nonempty_iff_ne_empty.mpr hterminal
        rcases bestFirstChoice_exists key (a + b) hnonempty with
          ⟨selected, choice⟩
        have hlength := valid.frontier_length selected choice.selected_mem
        by_cases hleaf : selected.length = a + b
        · let next := emitBestFirstState state selected
          have hstep : OperationalBestFirstStep a b key state next :=
            OperationalBestFirstStep.emit state selected choice hleaf
          have hnextValid : OperationalBestFirstValid a b score next :=
            emitBestFirstState_valid valid choice hleaf key_lower key_leaf_exact
          have hdecrease : frontierPotential (a + b) next.frontier <
              frontierPotential (a + b) state.frontier := by
            subst next
            exact emit_frontierPotential_lt choice.selected_mem
          rcases ih _ hdecrease hnextValid rfl with
            ⟨terminal, hreach, hterminalValid, hterminalState⟩
          exact ⟨terminal, Relation.ReflTransGen.head hstep hreach,
            hterminalValid, hterminalState⟩
        · have hshort : selected.length < a + b := by omega
          let next := expandBestFirstState a b state selected
          have hstep : OperationalBestFirstStep a b key state next :=
            OperationalBestFirstStep.expand state selected choice hshort
          have hnextValid : OperationalBestFirstValid a b score next :=
            expandBestFirstState_valid valid choice.selected_mem hshort
          have hdecrease : frontierPotential (a + b) next.frontier <
              frontierPotential (a + b) state.frontier := by
            subst next
            exact expand_frontierPotential_lt valid choice.selected_mem hshort
          rcases ih _ hdecrease hnextValid rfl with
            ⟨terminal, hreach, hterminalValid, hterminalState⟩
          exact ⟨terminal, Relation.ReflTransGen.head hstep hreach,
            hterminalValid, hterminalState⟩

theorem carrierPaths_nodup (a b : Nat) : (carrierPaths a b).Nodup := by
  exact (allWords_nodup (a + b)).filter _

theorem terminal_output_mem_iff
    {a b : Nat} {alpha : Type*} [LinearOrder alpha]
    {score : Path → alpha} {terminal : OperationalBestFirstState}
    (valid : OperationalBestFirstValid a b score terminal)
    (hterminal : TerminalBestFirstState terminal) (word : Path) :
    word ∈ terminal.output ↔ Carrier a b word := by
  constructor
  · exact valid.output_sound word
  · intro hword
    apply (valid.carrier_partition word hword).mpr
    rw [hterminal]
    rintro ⟨pfx, hpfx, _⟩
    exact Finset.notMem_empty pfx hpfx

theorem terminal_output_perm_carrierPaths
    {a b : Nat} {alpha : Type*} [LinearOrder alpha]
    {score : Path → alpha} {terminal : OperationalBestFirstState}
    (valid : OperationalBestFirstValid a b score terminal)
    (hterminal : TerminalBestFirstState terminal) :
    terminal.output.Perm (carrierPaths a b) := by
  apply (List.perm_ext_iff_of_nodup valid.output_nodup
    (carrierPaths_nodup a b)).mpr
  intro word
  rw [terminal_output_mem_iff valid hterminal, mem_carrierPaths]

def CompleteOperationalBestFirstRun
    (a b : Nat) {alpha : Type*} [LinearOrder alpha]
    (score key : Path → alpha) (output : List Path) : Prop :=
  ∃ terminal,
    OperationalBestFirstReach a b key initialBestFirstState terminal ∧
    OperationalBestFirstValid a b score terminal ∧
    TerminalBestFirstState terminal ∧
    terminal.output = output

theorem completeOperationalBestFirstRun_sorted_complete
    {a b : Nat} {alpha : Type*} [LinearOrder alpha]
    {score key : Path → alpha} {output : List Path}
    (run : CompleteOperationalBestFirstRun a b score key output) :
    output.Pairwise (fun left right => score left ≤ score right) ∧
      output.Perm (carrierPaths a b) := by
  rcases run with ⟨terminal, _hreach, valid, hterminal, rfl⟩
  exact ⟨valid.output_pairwise,
    terminal_output_perm_carrierPaths valid hterminal⟩

theorem exists_completeOperationalBestFirstRun
    {a b : Nat} (ha : 0 < a) (hb : 0 < b)
    {alpha : Type*} [LinearOrder alpha] (score key : Path → alpha)
    (key_lower : ∀ pfx, pfx ≠ [] → ∀ word, Carrier a b word →
      IsPrefix pfx word → key pfx ≤ score word)
    (key_leaf_exact : ∀ word, Carrier a b word →
      word.length = a + b → key word = score word) :
    ∃ output, CompleteOperationalBestFirstRun a b score key output := by
  have hinitial := initialBestFirstState_valid ha hb score
  rcases operationalBestFirst_reaches_terminal_from key_lower key_leaf_exact
      hinitial with ⟨terminal, hreach, hvalid, hterminal⟩
  exact ⟨terminal.output, terminal, hreach, hvalid, hterminal, rfl⟩

theorem exists_matching_completeOperationalBestFirstRun
    {a b : Nat} (ha : 0 < a) (hb : 0 < b) :
    ∃ output, CompleteOperationalBestFirstRun a b matchingScore
      (matchingBestFirstKey (a + b)) output := by
  apply exists_completeOperationalBestFirstRun ha hb
  · intro pfx hpfx word hword hpref
    exact matchingBestFirstKey_lower hpfx hpref hword
  · intro word _hword hlength
    simp [matchingBestFirstKey, hlength]

theorem exists_lagrange_completeOperationalBestFirstRun
    {a b : Nat} (ha : 0 < a) (hb : 0 < b) :
    ∃ output, CompleteOperationalBestFirstRun a b lagrangeSq
      (lagrangeBestFirstKey (a + b)) output := by
  apply exists_completeOperationalBestFirstRun ha hb
  · intro pfx hpfx word hword hpref
    exact lagrangeBestFirstKey_lower ha hb hpfx hpref hword
  · intro word _hword hlength
    simp [lagrangeBestFirstKey, hlength]

end LatticePathOrdersKernel
