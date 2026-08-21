import LatticePathOrdersKernel.OperationalBestFirstChoice

/-!
# Preservation of the operational best-first invariant

This file proves that the two concrete queue operations--expanding a prefix
and emitting a leaf--preserve the complete frontier/output invariant.  The
only score assumptions are the lower-bound and leaf-exactness properties
stated in the manuscript.
-/

namespace LatticePathOrdersKernel

open LatticePathOrders

theorem frontier_leaf_carrier
    {a b : Nat} {alpha : Type*} [LinearOrder alpha]
    {score : Path → alpha} {state : OperationalBestFirstState}
    (valid : OperationalBestFirstValid a b score state)
    {selected : Path} (hselected : selected ∈ state.frontier)
    (hleaf : selected.length = a + b) :
    Carrier a b selected := by
  rcases valid.frontier_completion selected hselected with
    ⟨word, hword, hpref⟩
  have heq : selected = word :=
    eq_of_prefix_of_eq_length hpref
      (hleaf.trans (carrier_length hword).symm)
  rw [heq]
  exact hword

theorem expand_frontier_antichain
    {a b : Nat} {alpha : Type*} [LinearOrder alpha]
    {score : Path → alpha} {state : OperationalBestFirstState}
    (valid : OperationalBestFirstValid a b score state)
    {selected : Path} (hselected : selected ∈ state.frontier) :
    PrefixFinsetAntichain
      ((state.frontier.erase selected) ∪ feasibleChildren a b selected) := by
  intro left hleft right hright hne
  rcases Finset.mem_union.mp hleft with hleftOld | hleftChild
  · rcases Finset.mem_union.mp hright with hrightOld | hrightChild
    · exact valid.frontier_antichain
        (Finset.mem_of_mem_erase hleftOld)
        (Finset.mem_of_mem_erase hrightOld) hne
    · have hleftData := Finset.mem_erase.mp hleftOld
      have hselectedRight := feasibleChild_extends hrightChild
      have hold := valid.frontier_antichain hleftData.2 hselected
        hleftData.1
      constructor
      · intro hleftRight
        rcases pathPrefix_comparable_of_common_extension hleftRight
            hselectedRight with hleftSelected | hselectedLeft
        · exact hold.1 hleftSelected
        · exact hold.2 hselectedLeft
      · intro hrightLeft
        exact hold.2 (pathPrefix_trans hselectedRight hrightLeft)
  · rcases Finset.mem_union.mp hright with hrightOld | hrightChild
    · have hrightData := Finset.mem_erase.mp hrightOld
      have hselectedLeft := feasibleChild_extends hleftChild
      have hold := valid.frontier_antichain hselected hrightData.2
        hrightData.1.symm
      constructor
      · intro hleftRight
        exact hold.1 (pathPrefix_trans hselectedLeft hleftRight)
      · intro hrightLeft
        rcases pathPrefix_comparable_of_common_extension hrightLeft
            hselectedLeft with hrightSelected | hselectedRight
        · exact hold.2 hrightSelected
        · exact hold.1 hselectedRight
    · exact feasibleChildren_antichain selected hleftChild hrightChild hne

theorem expand_prefixCovered_iff
    {a b : Nat} {state : OperationalBestFirstState} {selected word : Path}
    (hselected : selected ∈ state.frontier)
    (hword : Carrier a b word) (hshort : selected.length < a + b) :
    PrefixCovered
        ((state.frontier.erase selected) ∪ feasibleChildren a b selected) word ↔
      PrefixCovered state.frontier word := by
  constructor
  · rintro ⟨pfx, hpfx, hpref⟩
    rcases Finset.mem_union.mp hpfx with hpfxOld | hpfxChild
    · exact ⟨pfx, Finset.mem_of_mem_erase hpfxOld, hpref⟩
    · exact ⟨selected, hselected,
        pathPrefix_trans (feasibleChild_extends hpfxChild) hpref⟩
  · rintro ⟨pfx, hpfx, hpref⟩
    by_cases heq : pfx = selected
    · subst pfx
      rcases (feasibleChildren_partition hword hshort).mp hpref with
        ⟨child, hchild, hchildPrefix⟩
      exact ⟨child, Finset.mem_union_right _ hchild, hchildPrefix⟩
    · exact ⟨pfx, Finset.mem_union_left _
        (Finset.mem_erase.mpr ⟨heq, hpfx⟩), hpref⟩

theorem emit_prefixCovered_iff
    {a b : Nat} {alpha : Type*} [LinearOrder alpha]
    {score : Path → alpha} {state : OperationalBestFirstState}
    (valid : OperationalBestFirstValid a b score state)
    {selected word : Path} (hselected : selected ∈ state.frontier)
    (hleaf : selected.length = a + b) (hword : Carrier a b word) :
    PrefixCovered (state.frontier.erase selected) word ↔
      PrefixCovered state.frontier word ∧ word ≠ selected := by
  constructor
  · rintro ⟨pfx, hpfxErase, hpref⟩
    have hpfxData := Finset.mem_erase.mp hpfxErase
    refine ⟨⟨pfx, hpfxData.2, hpref⟩, ?_⟩
    intro hwordEq
    subst word
    have hcomparable := valid.frontier_antichain hpfxData.2 hselected
      hpfxData.1
    exact hcomparable.1 hpref
  · rintro ⟨⟨pfx, hpfx, hpref⟩, hwordNe⟩
    have hpfxNe : pfx ≠ selected := by
      intro hpfxEq
      subst pfx
      have hpfxWord : selected = word :=
        eq_of_prefix_of_eq_length hpref
          (hleaf.trans (carrier_length hword).symm)
      exact hwordNe hpfxWord.symm
    exact ⟨pfx, Finset.mem_erase.mpr ⟨hpfxNe, hpfx⟩, hpref⟩

theorem selected_not_in_output
    {a b : Nat} {alpha : Type*} [LinearOrder alpha]
    {score : Path → alpha} {state : OperationalBestFirstState}
    (valid : OperationalBestFirstValid a b score state)
    {selected : Path} (hselected : selected ∈ state.frontier)
    (hcarrier : Carrier a b selected) :
    selected ∉ state.output := by
  intro houtput
  have hnotCovered := (valid.carrier_partition selected hcarrier).mp houtput
  exact hnotCovered ⟨selected, hselected, pathPrefix_refl selected⟩

theorem selected_score_le_unemitted
    {a b : Nat} {alpha : Type*} [LinearOrder alpha]
    {score key : Path → alpha} {state : OperationalBestFirstState}
    (valid : OperationalBestFirstValid a b score state)
    {selected : Path} (choice : BestFirstChoice key (a + b)
      state.frontier selected)
    (hleaf : selected.length = a + b)
    (key_lower : ∀ pfx, pfx ≠ [] → ∀ word, Carrier a b word →
      IsPrefix pfx word → key pfx ≤ score word)
    (key_leaf_exact : ∀ word, Carrier a b word →
      word.length = a + b → key word = score word)
    {word : Path} (hword : Carrier a b word) (hnotOutput : word ∉ state.output) :
    score selected ≤ score word := by
  have hselectedCarrier := frontier_leaf_carrier valid choice.selected_mem hleaf
  have hcovered : PrefixCovered state.frontier word := by
    by_contra hnotCovered
    exact hnotOutput ((valid.carrier_partition word hword).mpr hnotCovered)
  rcases hcovered with ⟨pfx, hpfx, hpref⟩
  have hminimum := choice.minimum_key pfx hpfx
  have hlower := key_lower pfx (valid.frontier_nonempty pfx hpfx)
    word hword hpref
  rw [key_leaf_exact selected hselectedCarrier hleaf] at hminimum
  exact hminimum.trans hlower

theorem expandBestFirstState_valid
    {a b : Nat} {alpha : Type*} [LinearOrder alpha]
    {score : Path → alpha} {state : OperationalBestFirstState}
    (valid : OperationalBestFirstValid a b score state)
    {selected : Path} (hselected : selected ∈ state.frontier)
    (hshort : selected.length < a + b) :
    OperationalBestFirstValid a b score
      (expandBestFirstState a b state selected) := by
  refine {
    frontier_antichain := ?_
    frontier_nonempty := ?_
    frontier_length := ?_
    frontier_completion := ?_
    output_nodup := valid.output_nodup
    output_sound := valid.output_sound
    output_length := valid.output_length
    carrier_partition := ?_
    output_pairwise := valid.output_pairwise
    output_le_unemitted := valid.output_le_unemitted }
  · simpa [expandBestFirstState] using
      expand_frontier_antichain valid hselected
  · intro pfx hpfx
    rcases Finset.mem_union.mp hpfx with hpfxOld | hpfxChild
    · exact valid.frontier_nonempty pfx (Finset.mem_of_mem_erase hpfxOld)
    · intro hpfxNil
      have hlength := feasibleChild_length hpfxChild
      simp [hpfxNil] at hlength
  · intro pfx hpfx
    rcases Finset.mem_union.mp hpfx with hpfxOld | hpfxChild
    · exact valid.frontier_length pfx (Finset.mem_of_mem_erase hpfxOld)
    · rcases feasibleChild_completion hpfxChild with ⟨word, hword, hpref⟩
      exact (prefix_length_le hpref).trans_eq (carrier_length hword)
  · intro pfx hpfx
    rcases Finset.mem_union.mp hpfx with hpfxOld | hpfxChild
    · exact valid.frontier_completion pfx (Finset.mem_of_mem_erase hpfxOld)
    · exact feasibleChild_completion hpfxChild
  · intro word hword
    simpa [expandBestFirstState] using
      (valid.carrier_partition word hword).trans
        (not_congr (expand_prefixCovered_iff hselected hword hshort).symm)

theorem emitBestFirstState_valid
    {a b : Nat} {alpha : Type*} [LinearOrder alpha]
    {score key : Path → alpha} {state : OperationalBestFirstState}
    (valid : OperationalBestFirstValid a b score state)
    {selected : Path} (choice : BestFirstChoice key (a + b)
      state.frontier selected)
    (hleaf : selected.length = a + b)
    (key_lower : ∀ pfx, pfx ≠ [] → ∀ word, Carrier a b word →
      IsPrefix pfx word → key pfx ≤ score word)
    (key_leaf_exact : ∀ word, Carrier a b word →
      word.length = a + b → key word = score word) :
    OperationalBestFirstValid a b score
      (emitBestFirstState state selected) := by
  have hselectedCarrier := frontier_leaf_carrier valid choice.selected_mem hleaf
  have hselectedNotOutput :=
    selected_not_in_output valid choice.selected_mem hselectedCarrier
  refine {
    frontier_antichain := ?_
    frontier_nonempty := ?_
    frontier_length := ?_
    frontier_completion := ?_
    output_nodup := ?_
    output_sound := ?_
    output_length := ?_
    carrier_partition := ?_
    output_pairwise := ?_
    output_le_unemitted := ?_ }
  · intro left hleft right hright hne
    exact valid.frontier_antichain
      (Finset.mem_of_mem_erase hleft)
      (Finset.mem_of_mem_erase hright) hne
  · intro pfx hpfx
    exact valid.frontier_nonempty pfx (Finset.mem_of_mem_erase hpfx)
  · intro pfx hpfx
    exact valid.frontier_length pfx (Finset.mem_of_mem_erase hpfx)
  · intro pfx hpfx
    exact valid.frontier_completion pfx (Finset.mem_of_mem_erase hpfx)
  · simpa [emitBestFirstState] using
      valid.output_nodup.append (by simp) (by simpa [List.disjoint_singleton])
  · intro word hword
    simp only [emitBestFirstState, List.mem_append, List.mem_singleton] at hword
    rcases hword with hword | rfl
    · exact valid.output_sound word hword
    · exact hselectedCarrier
  · intro word hword
    simp only [emitBestFirstState, List.mem_append, List.mem_singleton] at hword
    rcases hword with hword | rfl
    · exact valid.output_length word hword
    · exact hleaf
  · intro word hword
    have hcovered := emit_prefixCovered_iff valid choice.selected_mem hleaf hword
    have hpartition := valid.carrier_partition word hword
    simp only [emitBestFirstState, List.mem_append, List.mem_singleton]
    rw [hpartition, hcovered]
    tauto
  · rw [emitBestFirstState, List.pairwise_append]
    refine ⟨valid.output_pairwise, by simp, ?_⟩
    intro emitted hemitted word hword
    simp only [List.mem_singleton] at hword
    subst word
    exact valid.output_le_unemitted emitted hemitted selected
      hselectedCarrier hselectedNotOutput
  · intro emitted hemitted word hword hwordNotOutput
    simp only [emitBestFirstState, List.mem_append, List.mem_singleton] at hemitted hwordNotOutput
    rcases hemitted with hemitted | rfl
    · exact valid.output_le_unemitted emitted hemitted word hword
        (fun hmem => hwordNotOutput (Or.inl hmem))
    · exact selected_score_le_unemitted valid choice hleaf key_lower
        key_leaf_exact hword (fun hmem => hwordNotOutput (Or.inl hmem))

theorem operationalBestFirstStep_valid
    {a b : Nat} {alpha : Type*} [LinearOrder alpha]
    {score key : Path → alpha}
    (key_lower : ∀ pfx, pfx ≠ [] → ∀ word, Carrier a b word →
      IsPrefix pfx word → key pfx ≤ score word)
    (key_leaf_exact : ∀ word, Carrier a b word →
      word.length = a + b → key word = score word)
    {state next : OperationalBestFirstState}
    (valid : OperationalBestFirstValid a b score state)
    (step : OperationalBestFirstStep a b key state next) :
    OperationalBestFirstValid a b score next := by
  cases step with
  | expand selected choice hnonleaf =>
      exact expandBestFirstState_valid valid choice.selected_mem hnonleaf
  | emit selected choice hleaf =>
      exact emitBestFirstState_valid valid choice hleaf key_lower key_leaf_exact

end LatticePathOrdersKernel
