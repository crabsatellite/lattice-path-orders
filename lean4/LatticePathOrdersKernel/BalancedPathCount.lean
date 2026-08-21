import LatticePathOrdersKernel.BandClassesTheorem
import LatticePathOrders.CarrierEnumeration
import Mathlib.Data.Fintype.Powerset

namespace LatticePathOrdersKernel

open LatticePathOrders

def balancedPaths (n r : Nat) : List Path :=
  (allWords n).filter fun word => Path.countR word = r

theorem mem_balancedPaths {n r : Nat} {word : Path} :
    word ∈ balancedPaths n r ↔ word.length = n ∧ Path.countR word = r := by
  simp [balancedPaths, mem_allWords]

theorem allWords_nodup (n : Nat) : (allWords n).Nodup := by
  induction n with
  | zero => simp [allWords]
  | succ n ih =>
      rw [allWords, List.nodup_append]
      refine ⟨ih.map (by intro x y h; exact List.cons.inj h |>.2),
        ih.map (by intro x y h; exact List.cons.inj h |>.2), ?_⟩
      intro right hright left hleft heq
      rcases List.mem_map.mp hright with ⟨rightTail, _, rfl⟩
      rcases List.mem_map.mp hleft with ⟨leftTail, _, rfl⟩
      cases heq

theorem balancedPaths_nodup (n r : Nat) : (balancedPaths n r).Nodup :=
  (allWords_nodup n).filter _

@[simp] theorem countR_cons_R (word : Path) :
    Path.countR (Step.R :: word) = Path.countR word + 1 := by
  simp [Path.countR]

@[simp] theorem countR_cons_U (word : Path) :
    Path.countR (Step.U :: word) = Path.countR word := by
  simp [Path.countR]

theorem filter_map_cons_R_zero (words : List Path) :
    (words.map (Step.R :: ·)).filter (fun word => Path.countR word = 0) = [] := by
  induction words with
  | nil => rfl
  | cons word rest ih => simp [ih]

theorem filter_map_cons_R_succ (words : List Path) (r : Nat) :
    (words.map (Step.R :: ·)).filter
        (fun word => Path.countR word = r + 1) =
      (words.filter (fun word => Path.countR word = r)).map (Step.R :: ·) := by
  induction words with
  | nil => rfl
  | cons word rest ih =>
      by_cases h : Path.countR word = r
      · have hsucc : Path.countR (Step.R :: word) = r + 1 := by
          simp [h]
        simp [List.filter_cons, h, hsucc, ih]
      · have hsucc : Path.countR (Step.R :: word) ≠ r + 1 := by
          simpa using h
        simp [List.filter_cons, h, hsucc, ih]

theorem filter_map_cons_U (words : List Path) (r : Nat) :
    (words.map (Step.U :: ·)).filter (fun word => Path.countR word = r) =
      (words.filter (fun word => Path.countR word = r)).map (Step.U :: ·) := by
  induction words with
  | nil => rfl
  | cons word rest ih =>
      by_cases h : Path.countR word = r <;>
        simp [List.filter_cons, h, ih]

theorem balancedPaths_card (n r : Nat) :
    (balancedPaths n r).length = n.choose r := by
  induction n generalizing r with
  | zero =>
      cases r <;> simp [balancedPaths, allWords]
  | succ n ih =>
      cases r with
      | zero =>
          rw [balancedPaths, allWords, List.filter_append,
            filter_map_cons_R_zero, filter_map_cons_U]
          simp only [List.nil_append, List.length_map, Nat.choose_zero_right]
          change (balancedPaths n 0).length = 1
          rw [ih]
          simp
      | succ r =>
          rw [balancedPaths, allWords, List.filter_append,
            filter_map_cons_R_succ, filter_map_cons_U]
          rw [List.length_append, List.length_map, List.length_map, Nat.choose]
          change (balancedPaths n r).length +
            (balancedPaths n (r + 1)).length = _
          rw [ih, ih]

def balancedPathFinset (n r : Nat) : Finset Path :=
  (balancedPaths n r).toFinset

theorem mem_balancedPathFinset {n r : Nat} {word : Path} :
    word ∈ balancedPathFinset n r ↔
      word.length = n ∧ Path.countR word = r := by
  simp [balancedPathFinset, mem_balancedPaths]

theorem balancedPathFinset_card (n r : Nat) :
    (balancedPathFinset n r).card = n.choose r := by
  rw [balancedPathFinset, List.toFinset_card_of_nodup (balancedPaths_nodup n r),
    balancedPaths_card]

end LatticePathOrdersKernel
