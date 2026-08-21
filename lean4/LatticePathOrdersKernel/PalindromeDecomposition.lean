import LatticePathOrdersKernel.CarrierTauBurnside
import Mathlib.Data.List.Palindrome

namespace LatticePathOrdersKernel

open LatticePathOrders

def evenPalindrome (pfx : Path) : Path := pfx ++ pfx.reverse

def oddPalindrome (pfx : Path) (center : Step) : Path :=
  pfx ++ [center] ++ pfx.reverse

@[simp] theorem evenPalindrome_length (pfx : Path) :
    (evenPalindrome pfx).length = 2 * pfx.length := by
  simp [evenPalindrome]
  omega

@[simp] theorem oddPalindrome_length (pfx : Path) (center : Step) :
    (oddPalindrome pfx center).length = 2 * pfx.length + 1 := by
  simp [oddPalindrome]
  omega

@[simp] theorem evenPalindrome_reverse (pfx : Path) :
    (evenPalindrome pfx).reverse = evenPalindrome pfx := by
  simp [evenPalindrome]

@[simp] theorem oddPalindrome_reverse (pfx : Path) (center : Step) :
    (oddPalindrome pfx center).reverse = oddPalindrome pfx center := by
  simp [oddPalindrome, List.reverse_append]

@[simp] theorem evenPalindrome_countR (pfx : Path) :
    Path.countR (evenPalindrome pfx) = 2 * Path.countR pfx := by
  have hreverse := pfx.reverse_perm.count Step.R
  change Path.countR pfx.reverse = Path.countR pfx at hreverse
  simp [evenPalindrome, Path.countR, hreverse]
  omega

@[simp] theorem oddPalindrome_countR (pfx : Path) (center : Step) :
    Path.countR (oddPalindrome pfx center) =
      2 * Path.countR pfx + if center = Step.R then 1 else 0 := by
  have hreverse := pfx.reverse_perm.count Step.R
  change Path.countR pfx.reverse = Path.countR pfx at hreverse
  cases center <;> simp [oddPalindrome, Path.countR, hreverse] <;> omega

theorem evenPalindrome_injective : Function.Injective evenPalindrome := by
  intro left right heq
  have hlength : left.length = right.length := by
    have := congrArg List.length heq
    simp at this
    omega
  have htake := congrArg (List.take left.length) heq
  simpa [evenPalindrome, hlength] using htake

theorem oddPalindrome_injective (center : Step) :
    Function.Injective (fun pfx => oddPalindrome pfx center) := by
  intro left right heq
  have hlength : left.length = right.length := by
    have := congrArg List.length heq
    simp at this
    omega
  have htake := congrArg (List.take left.length) heq
  simpa [oddPalindrome, hlength] using htake

theorem palindrome_even_decomposition {word : Path}
    (hpal : word.reverse = word) {m : Nat}
    (hlength : word.length = 2 * m) :
    ∃ pfx : Path, pfx.length = m ∧ word = evenPalindrome pfx := by
  have hp : word.Palindrome := List.Palindrome.of_reverse_eq hpal
  clear hpal
  induction hp generalizing m with
  | nil =>
      have hm : m = 0 := by simp at hlength; omega
      subst m
      exact ⟨[], rfl, rfl⟩
  | singleton x =>
      simp at hlength
      omega
  | @cons_concat x inner hp ih =>
      have hm : 0 < m := by simp at hlength; omega
      have hinnerLength : inner.length = 2 * (m - 1) := by
        simp at hlength
        omega
      rcases ih hinnerLength with ⟨pfx, hpfxLength, hinner⟩
      refine ⟨x :: pfx, by simp [hpfxLength]; omega, ?_⟩
      subst inner
      simp [evenPalindrome, List.append_assoc]

theorem palindrome_odd_decomposition {word : Path}
    (hpal : word.reverse = word) {m : Nat}
    (hlength : word.length = 2 * m + 1) :
    ∃ pfx : Path, ∃ center : Step,
      pfx.length = m ∧ word = oddPalindrome pfx center := by
  have hp : word.Palindrome := List.Palindrome.of_reverse_eq hpal
  clear hpal
  induction hp generalizing m with
  | nil => simp at hlength
  | singleton x =>
      have hm : m = 0 := by simp at hlength; omega
      subst m
      exact ⟨[], x, rfl, by simp [oddPalindrome]⟩
  | @cons_concat x inner hp ih =>
      have hm : 0 < m := by simp at hlength; omega
      have hinnerLength : inner.length = 2 * (m - 1) + 1 := by
        simp at hlength
        omega
      rcases ih hinnerLength with ⟨pfx, center, hpfxLength, hinner⟩
      refine ⟨x :: pfx, center, by simp [hpfxLength]; omega, ?_⟩
      subst inner
      simp [oddPalindrome, List.append_assoc]

end LatticePathOrdersKernel
