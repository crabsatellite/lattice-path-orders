import LatticePathOrders.MinimalityCertificate

set_option maxRecDepth 100000

namespace LatticePathOrders

/-!
# A lightweight partition tree for the bounded minimality certificates

The large assignment trees are already checked independently in the generated
part modules.  This file supplies a separate compact trie whose leaves are the
region prefixes.  Its checker verifies that every feasible branch occurs
exactly once, and the theorem below turns a successful Boolean check into
semantic carrier coverage.  Endpoint modules therefore never reduce a linear
membership search through their entire frontier.
-/

inductive PrefixPartitionTree where
  | leaf
  | node (right up : Option PrefixPartitionTree)
deriving Repr

namespace PrefixPartitionTree

def branchCheck (enabled : Bool) (subtree : Option PrefixPartitionTree)
    (checkSubtree : PrefixPartitionTree → Bool) : Bool :=
  if enabled then
    match subtree with
    | some tree => checkSubtree tree
    | none => false
  else
    subtree.isNone

/-- Check that the tree has precisely the feasible branches below `pfx`.
A leaf may occur before the fixed path length and represents one compressed
region cylinder. -/
def check (a b : Nat) : Nat → Path → PrefixPartitionTree → Bool
  | _, _, .leaf => true
  | 0, _, .node _ _ => false
  | fuel + 1, pfx, .node right up =>
      branchCheck (Path.countR pfx < a) right
          (fun tree => check a b fuel (pfx ++ [Step.R]) tree) &&
        branchCheck
          (Path.countU pfx < b ∧
            a * (Path.countU pfx + 1) ≤ b * Path.countR pfx)
          up (fun tree => check a b fuel (pfx ++ [Step.U]) tree)

/-- The literal leaf prefixes represented by a checked tree, in right-first
depth-first order. -/
def frontier : Path → PrefixPartitionTree → List Path
  | pfx, .leaf => [pfx]
  | pfx, .node right up =>
      (match right with
       | none => []
       | some tree => frontier (pfx ++ [Step.R]) tree) ++
      (match up with
       | none => []
       | some tree => frontier (pfx ++ [Step.U]) tree)

/-- A checked prefix tree covers every fixed-endpoint carrier completion of
its root prefix. -/
theorem covers_of_check {a b : Nat} :
    ∀ {fuel : Nat} {pfx w : Path} {tree : PrefixPartitionTree},
      check a b fuel pfx tree = true →
      Carrier a b w →
      IsPrefix pfx w →
      pfx.length + fuel = w.length →
      ∃ q ∈ frontier pfx tree, IsPrefix q w := by
  intro fuel
  induction fuel with
  | zero =>
      intro pfx w tree hcheck _ hpref _
      cases tree with
      | leaf => exact ⟨pfx, by simp [frontier], hpref⟩
      | node right up => simp [check] at hcheck
  | succ fuel ih =>
      intro pfx w tree hcheck hw hpref hlength
      cases tree with
      | leaf => exact ⟨pfx, by simp [frontier], hpref⟩
      | node right up =>
          simp only [check, Bool.and_eq_true] at hcheck
          rcases hpref with ⟨suffix, rfl⟩
          have hsuffixLength : suffix.length = fuel + 1 := by
            simp only [List.length_append] at hlength
            omega
          cases suffix with
          | nil => simp at hsuffixLength
          | cons next rest =>
              have hrestLength : rest.length = fuel := by
                simp at hsuffixLength
                omega
              have hc := carrier_components hw
              cases next with
              | R =>
                  have hr : Path.countR pfx < a := by
                    have hrCount :
                        Path.countR pfx + (Path.countR rest + 1) = a := by
                      simpa [Path.countR, List.count_append, Nat.add_assoc] using hc.1
                    omega
                  simp only [branchCheck, decide_eq_true_eq, hr, if_true] at hcheck
                  rcases right with _ | rightTree
                  · simp at hcheck
                  · obtain ⟨q, hq, hqPrefix⟩ := ih hcheck.1 hw
                      (by exact ⟨rest, by simp [List.append_assoc]⟩)
                      (by simp [List.length_append, hrestLength]; omega)
                    refine ⟨q, ?_, hqPrefix⟩
                    cases up with
                    | none => simpa [frontier] using hq
                    | some upTree =>
                        simpa [frontier] using List.mem_append_left
                          (PrefixPartitionTree.frontier
                            (pfx ++ [Step.U]) upTree) hq
              | U =>
                  have huCount : Path.countU pfx < b := by
                    have hu :
                        Path.countU pfx + (Path.countU rest + 1) = b := by
                      simpa [Path.countU, List.count_append, Nat.add_assoc] using hc.2.1
                    omega
                  have huIneq :
                      a * (Path.countU pfx + 1) ≤ b * Path.countR pfx :=
                    feasible_nextU hc.2.2
                  simp only [branchCheck, decide_eq_true_eq, huCount, huIneq,
                    and_self, if_true] at hcheck
                  rcases up with _ | upTree
                  · simp at hcheck
                  · obtain ⟨q, hq, hqPrefix⟩ := ih hcheck.2 hw
                      (by exact ⟨rest, by simp [List.append_assoc]⟩)
                      (by simp [List.length_append, hrestLength]; omega)
                    refine ⟨q, ?_, hqPrefix⟩
                    cases right with
                    | none => simpa [frontier] using hq
                    | some rightTree =>
                        simpa [frontier] using List.mem_append_right
                          (PrefixPartitionTree.frontier
                            (pfx ++ [Step.R]) rightTree) hq

end PrefixPartitionTree

/-- The full endpoint obligations with a compact prefix-partition tree. -/
def TreeRegionsCover (a b : Nat) (classes : ClassTable)
    (regions : List (Path × Nat × AssignmentTree))
    (tree : PrefixPartitionTree) : Prop :=
  ClassTableValid classes ∧
  PrefixPartitionTree.check a b (a + b - 1) [Step.R] tree = true ∧
  PrefixPartitionTree.frontier [Step.R] tree = regions.map Prod.fst ∧
  ∀ region ∈ regions,
    region.1.length + region.2.1 = a + b ∧
      region.2.2.check a b classes region.2.1 region.1 = true

/-- A checked compact partition tree plus the independently checked assignment
regions implies the bounded no-collision statement. -/
theorem problem63HoldsAt_of_treeRegionsCover {a b : Nat}
    (ha : 0 < a) (hb : 0 < b)
    {classes : ClassTable}
    {regions : List (Path × Nat × AssignmentTree)}
    {tree : PrefixPartitionTree}
    (hcover : TreeRegionsCover a b classes regions tree) :
    Problem63HoldsAt a b := by
  intro x y hx hy hscore
  have assign : ∀ w, Carrier a b w →
      ∃ entry ∈ classes.toList,
        lagrangeSq w = entry.value ∧
        Dihedral (closedTurnCode w) (closedTurnCode entry.anchor) := by
    intro w hw
    obtain ⟨pfx, hpfxFrontier, hpfx⟩ :=
      PrefixPartitionTree.covers_of_check hcover.2.1 hw
        (carrier_starts_R ha hw) (by
          have hwlen := carrier_length hw
          simp only [List.length_cons, List.length_nil]
          omega)
    have hpfxMem : pfx ∈ regions.map Prod.fst := by
      rw [← hcover.2.2.1]
      exact hpfxFrontier
    have hregion : ∃ fuel tree, (pfx, fuel, tree) ∈ regions := by
      simpa using hpfxMem
    obtain ⟨fuel, assignmentTree, hregion⟩ := hregion
    have hregionValid := hcover.2.2.2 (pfx, fuel, assignmentTree) hregion
    have hpfxLength : pfx.length + fuel = w.length := by
      rw [carrier_length hw]
      exact hregionValid.1
    obtain ⟨index, entry, hlookup, hvalue, horbit⟩ :=
      AssignmentTree.assignment_of_check hregionValid.2 hw hpfx hpfxLength
    exact ⟨entry, classAt_mem hlookup, hvalue, horbit⟩
  obtain ⟨left, hleftMem, hleftValue, hleftOrbit⟩ := assign x hx
  obtain ⟨right, hrightMem, hrightValue, hrightOrbit⟩ := assign y hy
  have hvalue : left.value = right.value := by
    rw [← hleftValue, ← hrightValue]
    exact hscore
  have hentry : left = right :=
    hcover.1.entry_eq_of_value_eq hleftMem hrightMem hvalue
  subst right
  have horbit := hleftOrbit.trans hrightOrbit.symm
  apply (dihedralEq_eq_true_iff (closedTurnCode_ne_nil ?_)).mpr horbit
  rw [carrier_length hx]
  omega

end LatticePathOrders
