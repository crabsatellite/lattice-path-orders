import LatticePathOrders.PartitionCertificate
import LatticePathOrders.FastCyclicProducts
import LatticePathOrders.MinimalityClassTable

set_option maxRecDepth 100000

namespace LatticePathOrders

/-!
# Kernel certificates for the bounded Problem 6.3 minimality range

The external search emits two pieces of ordinary data for each endpoint:

* a strictly score-ordered array containing one anchor for every equality
  class; and
* a collection of finite binary assignment trees.  A leaf stores the index of
  its equality-class anchor.

The checker recomputes the literal Lagrange square and the literal dihedral
turn-code relation at every rational-Dyck leaf.  The theorems in this file turn
successful local checks into the quantified no-collision statement.  Thus the
search program chooses the certificate, but contributes no theorem-valued
premise.
-/

/-- The mathematical dihedral relation underlying the executable orbit test. -/
def Dihedral {α : Type} (xs ys : List α) : Prop :=
  xs ~r ys ∨ xs.reverse ~r ys

theorem Dihedral.refl {α : Type} (xs : List α) : Dihedral xs xs :=
  Or.inl (List.IsRotated.refl xs)

theorem Dihedral.symm {α : Type} {xs ys : List α}
    (h : Dihedral xs ys) : Dihedral ys xs := by
  rcases h with h | h
  · exact Or.inl h.symm
  · right
    have hr := h.symm.reverse
    simpa using hr

theorem Dihedral.trans {α : Type} {xs ys zs : List α}
    (hxy : Dihedral xs ys) (hyz : Dihedral ys zs) : Dihedral xs zs := by
  rcases hxy with hxy | hxy <;> rcases hyz with hyz | hyz
  · exact Or.inl (hxy.trans hyz)
  · exact Or.inr (hxy.reverse.trans hyz)
  · exact Or.inr (hxy.trans hyz)
  · left
    have hr := hxy.reverse
    simpa using hr.trans hyz

theorem mem_rotations_iff_isRotated {α : Type} {xs ys : List α}
    (hxs : xs ≠ []) : ys ∈ rotations xs ↔ xs ~r ys := by
  constructor
  · intro h
    rcases List.mem_map.mp h with ⟨k, hk, rfl⟩
    exact ⟨k, rfl⟩
  · rintro ⟨k, rfl⟩
    apply List.mem_map.mpr
    let n := k % xs.length
    have hlen : 0 < xs.length := List.length_pos_of_ne_nil hxs
    refine ⟨n, List.mem_range.mpr (Nat.mod_lt k hlen), ?_⟩
    exact List.rotate_mod xs k

theorem dihedralEq_eq_true_iff {α : Type} [DecidableEq α]
    {xs ys : List α} (hxs : xs ≠ []) :
    dihedralEq xs ys = true ↔ Dihedral xs ys := by
  simp only [dihedralEq, dihedralOrbit, List.mem_append]
  rw [decide_eq_true_eq]
  constructor
  · rintro (h | h)
    · exact Or.inl ((mem_rotations_iff_isRotated hxs).mp h)
    · exact Or.inr ((mem_rotations_iff_isRotated
        (by simpa using hxs : xs.reverse ≠ [])).mp h)
  · rintro (h | h)
    · exact Or.inl ((mem_rotations_iff_isRotated hxs).mpr h)
    · exact Or.inr ((mem_rotations_iff_isRotated
        (by simpa using hxs : xs.reverse ≠ [])).mpr h)

theorem closedTurnCode_ne_nil {w : Path} (hw : 2 ≤ w.length) :
    closedTurnCode w ≠ [] := by
  rcases w with _ | ⟨x, _ | ⟨y, rest⟩⟩
  · simp at hw
  · simp at hw
  · simp [closedTurnCode]

/-- A binary proof tree for all feasible continuations of one prefix.  Missing
branches are represented by `none`; a checked node must contain exactly every
branch that a rational-Dyck continuation can use. -/
inductive AssignmentTree where
  | leaf (classIndex : Nat) (reversed : Bool) (rotation : Nat)
  | node (right up : Option AssignmentTree)
deriving Repr

namespace AssignmentTree

/-- A certificate supplies the exact orientation and rotation taking a path's
turn code to its class anchor.  Checking one witness avoids searching the
entire dihedral orbit inside the kernel. -/
def orbitWitnessCheck (xs ys : List Bool) (reversed : Bool)
    (rotation : Nat) : Bool :=
  decide ((if reversed then xs.reverse else xs).rotate rotation = ys)

theorem dihedral_of_orbitWitnessCheck {xs ys : List Bool}
    {reversed : Bool} {rotation : Nat}
    (h : orbitWitnessCheck xs ys reversed rotation = true) :
    Dihedral xs ys := by
  unfold orbitWitnessCheck at h
  have heq := of_decide_eq_true h
  cases reversed with
  | false => exact Or.inl ⟨rotation, heq⟩
  | true => exact Or.inr ⟨rotation, heq⟩

def branchCheck (enabled : Bool) (subtree : Option AssignmentTree)
    (checkSubtree : AssignmentTree → Bool) : Bool :=
  if enabled then
    match subtree with
    | some tree => checkSubtree tree
    | none => false
  else
    subtree.isNone

def check (a b : Nat) (classes : ClassTable) :
    Nat → Path → AssignmentTree → Bool
  | 0, pfx, .leaf index reversed rotation =>
      match classAt classes index with
      | some entry =>
          decide (closedTurnCode pfx ≠ []) &&
            (decide (lagrangeNumerator pfx = entry.numerator) &&
              (decide (qMinFast (cyclicDigits pfx) = entry.qMin) &&
                orbitWitnessCheck (closedTurnCode pfx)
                  (closedTurnCode entry.anchor) reversed rotation))
      | none => false
  | fuel + 1, pfx, .node right up =>
      branchCheck (Path.countR pfx < a) right
          (fun tree => check a b classes fuel (pfx ++ [Step.R]) tree) &&
        branchCheck
          (Path.countU pfx < b ∧
            a * (Path.countU pfx + 1) ≤ b * Path.countR pfx)
          up (fun tree => check a b classes fuel (pfx ++ [Step.U]) tree)
  | _, _, _ => false

/-- A checked local tree assigns every carrier completion of its prefix to a
literal recomputed score class. -/
theorem assignment_of_check {a b : Nat} {classes : ClassTable} :
    ∀ {fuel : Nat} {pfx w : Path} {tree : AssignmentTree},
      check a b classes fuel pfx tree = true →
      Carrier a b w →
      IsPrefix pfx w →
      pfx.length + fuel = w.length →
      ∃ index entry,
        classAt classes index = some entry ∧
        lagrangeSq w = entry.value ∧
        Dihedral (closedTurnCode w) (closedTurnCode entry.anchor) := by
  intro fuel
  induction fuel with
  | zero =>
      intro pfx w tree hcheck hw hpref hlength
      rcases tree with ⟨index, reversed, rotation⟩ | ⟨right, up⟩
      · rcases hpref with ⟨suffix, rfl⟩
        have hsuffix : suffix = [] := by simp at hlength; simpa using hlength
        subst suffix
        simp only [List.append_nil]
        simp only [check] at hcheck
        split at hcheck
        next entry hentry =>
          have hand := Bool.and_eq_true_iff.mp hcheck
          have hrest := Bool.and_eq_true_iff.mp hand.2
          have htail := Bool.and_eq_true_iff.mp hrest.2
          refine ⟨index, entry, hentry, ?_, ?_⟩
          · unfold lagrangeSq EqualityClass.value
            rw [of_decide_eq_true hrest.1, ← qMinFast_eq,
              of_decide_eq_true htail.1]
          · exact dihedral_of_orbitWitnessCheck htail.2
        next hnone => simp at hcheck
      · simp [check] at hcheck
  | succ fuel ih =>
      intro pfx w tree hcheck hw hpref hlength
      rcases tree with ⟨index, reversed, rotation⟩ | ⟨right, up⟩
      · simp [check] at hcheck
      · simp only [check, Bool.and_eq_true] at hcheck
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
                · apply ih hcheck.1 hw
                  · exact ⟨rest, by simp [List.append_assoc]⟩
                  · simp [List.length_append, hrestLength]
                    omega
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
                · apply ih hcheck.2 hw
                  · exact ⟨rest, by simp [List.append_assoc]⟩
                  · simp [List.length_append, hrestLength]
                    omega

end AssignmentTree

/-- The semantic no-collision statement needed for the bounded minimality
claim. -/
def Problem63HoldsAt (a b : Nat) : Prop :=
  ∀ x y, Carrier a b x → Carrier a b y →
    lagrangeSq x = lagrangeSq y →
    dihedralEq (closedTurnCode x) (closedTurnCode y) = true

/-- A family of checked regions covers one endpoint. -/
def RegionsCover (a b : Nat) (classes : ClassTable)
    (regions : List (Path × Nat × AssignmentTree)) : Prop :=
  ClassTableValid classes ∧
  partitionCheck a b (regions.map Prod.fst) (a + b - 1) [Step.R] = true ∧
  ∀ region ∈ regions,
    region.1.length + region.2.1 = a + b ∧
      region.2.2.check a b classes region.2.1 region.1 = true

theorem problem63HoldsAt_of_regionsCover {a b : Nat}
    (ha : 0 < a) (hb : 0 < b)
    {classes : ClassTable}
    {regions : List (Path × Nat × AssignmentTree)}
    (hcover : RegionsCover a b classes regions) : Problem63HoldsAt a b := by
  intro x y hx hy hscore
  have assign : ∀ w, Carrier a b w →
      ∃ entry ∈ classes.toList,
        lagrangeSq w = entry.value ∧
        Dihedral (closedTurnCode w) (closedTurnCode entry.anchor) := by
    intro w hw
    obtain ⟨pfx, hpfxMem, hpfx⟩ :=
      coversCarrier_of_partitionCheck ha hcover.2.1 w hw
    have hregion : ∃ fuel tree,
        (pfx, fuel, tree) ∈ regions := by
      simpa using hpfxMem
    obtain ⟨fuel, tree, hregion⟩ := hregion
    have hregionValid := hcover.2.2 (pfx, fuel, tree) hregion
    have htree := hregionValid.2
    have hpfxLength : pfx.length + fuel = w.length := by
      rw [carrier_length hw]
      exact hregionValid.1
    obtain ⟨index, entry, hlookup, hvalue, horbit⟩ :=
      AssignmentTree.assignment_of_check htree hw hpfx hpfxLength
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
