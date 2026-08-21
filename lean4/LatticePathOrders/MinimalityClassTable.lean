import LatticePathOrders.Basic
import Mathlib.Data.List.Sort

namespace LatticePathOrders

/-!
# Cached score-class tables for bounded minimality certificates

This module contains only the score-class representation and its order proof.
It is intentionally independent of path-assignment checkers so improvements to
leaf witnesses do not invalidate large, already checked class-table chunks.
-/

structure EqualityClass where
  anchor : Path
  numerator : Nat
  qMin : Nat
deriving DecidableEq, Repr

def EqualityClass.value (entry : EqualityClass) : Rat :=
  (entry.numerator : Rat) / ((entry.qMin ^ 2 : Nat) : Rat)

def EqualityClass.rawLess (left right : EqualityClass) : Prop :=
  left.numerator * right.qMin ^ 2 < right.numerator * left.qMin ^ 2

instance equalityClassRawLessDecidable (left right : EqualityClass) :
    Decidable (EqualityClass.rawLess left right) := by
  unfold EqualityClass.rawLess
  infer_instance

def EqualityClass.orderedStep (left right : EqualityClass) : Prop :=
  0 < left.qMin ∧ 0 < right.qMin ∧ left.rawLess right

instance equalityClassOrderedStepDecidable (left right : EqualityClass) :
    Decidable (EqualityClass.orderedStep left right) := by
  unfold EqualityClass.orderedStep
  infer_instance

/-- A balanced table keeps both source files and reduction work bounded.  A
lookup visits one leaf rather than materializing a monolithic array. -/
inductive ClassTable where
  | leaf (entries : Array EqualityClass)
  | node (left right : ClassTable)
deriving Repr

namespace ClassTable

def size : ClassTable → Nat
  | .leaf entries => entries.size
  | .node left right => left.size + right.size

def toList : ClassTable → List EqualityClass
  | .leaf entries => entries.toList
  | .node left right => left.toList ++ right.toList

def first? : ClassTable → Option EqualityClass
  | .leaf entries => entries[0]?
  | .node left right => left.first?.or right.first?

def last? : ClassTable → Option EqualityClass
  | .leaf entries => entries.back?
  | .node left right => right.last?.or left.last?

def get? : ClassTable → Nat → Option EqualityClass
  | .leaf entries, index => entries[index]?
  | .node left right, index =>
      if index < left.size then left.get? index
      else right.get? (index - left.size)

theorem get?_mem {classes : ClassTable} {index : Nat}
    {entry : EqualityClass} (h : classes.get? index = some entry) :
    entry ∈ classes.toList := by
  induction classes generalizing index with
  | leaf entries =>
      apply List.mem_of_getElem?
      simpa [get?, toList] using h
  | node left right ihLeft ihRight =>
      simp only [get?] at h
      split at h
      · exact List.mem_append_left _ (ihLeft h)
      · exact List.mem_append_right _ (ihRight h)

theorem first?_eq_head? (classes : ClassTable) :
    classes.first? = classes.toList.head? := by
  induction classes with
  | leaf entries =>
      rw [first?, toList, List.head?_eq_getElem?, Array.getElem?_toList]
  | node left right ihLeft ihRight =>
      simp [first?, toList, ihLeft, ihRight, List.head?_append]

theorem last?_eq_getLast? (classes : ClassTable) :
    classes.last? = classes.toList.getLast? := by
  induction classes with
  | leaf entries =>
      simp [last?, toList, Array.back?_eq_getElem?,
        List.getLast?_eq_getElem?]
  | node left right ihLeft ihRight =>
      simp [last?, toList, ihLeft, ihRight, List.getLast?_append]

end ClassTable

def classAt (classes : ClassTable) (index : Nat) :
    Option EqualityClass := classes.get? index

/-- Strict score order, assembled recursively from independently cached
chunks, is the only global condition on a class table. -/
def ClassTableValid : ClassTable → Prop
  | .leaf entries => List.IsChain EqualityClass.orderedStep entries.toList
  | .node left right =>
      ClassTableValid left ∧ ClassTableValid right ∧
        ∀ x ∈ left.last?, ∀ y ∈ right.first?,
          EqualityClass.orderedStep x y

instance classTableValidDecidable :
    (classes : ClassTable) → Decidable (ClassTableValid classes)
  | .leaf entries => by simp only [ClassTableValid]; infer_instance
  | .node left right => by
      letI := classTableValidDecidable left
      letI := classTableValidDecidable right
      simp only [ClassTableValid]
      infer_instance

theorem ClassTableValid.toList_isChain {classes : ClassTable}
    (hvalid : ClassTableValid classes) :
    List.IsChain EqualityClass.orderedStep classes.toList := by
  induction classes with
  | leaf entries => exact hvalid
  | node left right ihLeft ihRight =>
      rcases hvalid with ⟨hleft, hright, hboundary⟩
      apply List.IsChain.append (ihLeft hleft) (ihRight hright)
      simpa [← left.last?_eq_getLast?, ← right.first?_eq_head?] using hboundary

theorem classAt_mem {classes : ClassTable} {index : Nat}
    {entry : EqualityClass} (h : classAt classes index = some entry) :
    entry ∈ classes.toList :=
  ClassTable.get?_mem h

theorem ClassTableValid.entry_eq_of_value_eq
    {classes : ClassTable} (hvalid : ClassTableValid classes)
    {left right : EqualityClass}
    (hleft : left ∈ classes.toList) (hright : right ∈ classes.toList)
    (hvalue : left.value = right.value) : left = right := by
  have rawLess_value_lt : ∀ left right : EqualityClass,
      left.orderedStep right → left.value < right.value := by
    intro first second hstep
    have hqFirstNat : 0 < first.qMin ^ 2 := pow_pos hstep.1 2
    have hqSecondNat : 0 < second.qMin ^ 2 := pow_pos hstep.2.1 2
    have hqFirstRat : (0 : Rat) < (first.qMin ^ 2 : Nat) := by
      exact_mod_cast hqFirstNat
    have hqSecondRat : (0 : Rat) < (second.qMin ^ 2 : Nat) := by
      exact_mod_cast hqSecondNat
    rw [EqualityClass.value, EqualityClass.value,
      div_lt_div_iff₀ hqFirstRat hqSecondRat]
    exact_mod_cast hstep.2.2
  have hchain : List.IsChain (fun x y : Rat => x < y)
      (classes.toList.map EqualityClass.value) :=
    List.isChain_map_of_isChain EqualityClass.value rawLess_value_lt
      hvalid.toList_isChain
  have hsorted : (classes.toList.map EqualityClass.value).SortedLT :=
    hchain.sortedLT
  exact List.inj_on_of_nodup_map hsorted.nodup hleft hright hvalue

end LatticePathOrders
