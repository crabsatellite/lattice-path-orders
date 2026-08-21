import LatticePathOrdersClassical.FixedPointGap

/-!
# Positivity and determinant parity for positive digit words
-/

namespace LatticePathOrdersClassical

open NatMatrix2

def PositiveDigits (digits : List Nat) : Prop := ∀ a ∈ digits, 0 < a

theorem PositiveDigits.tail {a : Nat} {tail : List Nat}
    (h : PositiveDigits (a :: tail)) : PositiveDigits tail := by
  intro x hx
  exact h x (List.mem_cons_of_mem a hx)

theorem continuant_pos {digits : List Nat} (h : PositiveDigits digits) :
    0 < continuant digits := by
  induction digits with
  | nil => simp
  | cons a tail ih =>
      have ha : 0 < a := h a (by simp)
      have ht := ih h.tail
      simp only [continuant_cons]
      positivity

theorem digitProduct_a21_pos {digits : List Nat}
    (hne : digits ≠ []) (hpos : PositiveDigits digits) :
    0 < (digitProduct digits).a21 := by
  cases digits with
  | nil => contradiction
  | cons a tail =>
      rw [digitProduct_a21]
      simp only [denominatorContinuant_cons]
      exact continuant_pos hpos.tail

theorem digitProduct_a12_pos {digits : List Nat}
    (hne : digits ≠ []) (hpos : PositiveDigits digits) :
    0 < (digitProduct digits).a12 := by
  induction digits with
  | nil => contradiction
  | cons a tail ih =>
      have ha : 0 < a := hpos a (by simp)
      cases tail with
      | nil => simp [digitProduct, digitMatrix]
      | cons b rest =>
          have htailNe : b :: rest ≠ [] := by simp
          have htailPos := hpos.tail
          have ihpos := ih htailNe htailPos
          simp only [digitProduct, NatMatrix2.mul_a12, digitMatrix]
          positivity

theorem PositiveDigits.rotate {digits : List Nat}
    (h : PositiveDigits digits) (k : Nat) : PositiveDigits (digits.rotate k) := by
  intro a ha
  exact h a (List.mem_rotate.mp ha)

theorem rotate_ne_nil {digits : List Nat} (hne : digits ≠ []) (k : Nat) :
    digits.rotate k ≠ [] := by
  intro hnil
  have := congrArg List.length hnil
  simp [hne] at this

theorem determinant_digitProduct_of_even {digits : List Nat}
    (heven : Even digits.length) : determinant (digitProduct digits) = 1 := by
  rw [determinant_digitProduct]
  rcases heven with ⟨k, hk⟩
  rw [hk, ← two_mul k, pow_mul]
  norm_num

theorem determinant_rotate_of_even {digits : List Nat}
    (heven : Even digits.length) (k : Nat) :
    determinant (digitProduct (digits.rotate k)) = 1 := by
  apply determinant_digitProduct_of_even
  simpa using heven

end LatticePathOrdersClassical
