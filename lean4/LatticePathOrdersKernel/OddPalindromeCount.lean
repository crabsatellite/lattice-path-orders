import LatticePathOrdersKernel.PalindromeDecomposition

namespace LatticePathOrdersKernel

open LatticePathOrders

noncomputable def palindromePathFinset (n r : Nat) : Finset Path :=
  (balancedPathFinset n r).filter fun word => word.reverse = word

theorem mem_palindromePathFinset {n r : Nat} {word : Path} :
    word ∈ palindromePathFinset n r ↔
      word.length = n ∧ Path.countR word = r ∧ word.reverse = word := by
  simp only [palindromePathFinset, Finset.mem_filter,
    mem_balancedPathFinset]
  tauto

def parityCenter (r : Nat) : Step :=
  if r % 2 = 1 then Step.R else Step.U

noncomputable def oddPalindromeImageFinset (m r : Nat) : Finset Path :=
  (balancedPathFinset m (r / 2)).image
    (fun pfx => oddPalindrome pfx (parityCenter r))

theorem oddPalindromeImageFinset_card (m r : Nat) :
    (oddPalindromeImageFinset m r).card = m.choose (r / 2) := by
  rw [oddPalindromeImageFinset, Finset.card_image_of_injective _
    (oddPalindrome_injective (parityCenter r)), balancedPathFinset_card]

theorem palindromePathFinset_odd_eq_image (m r : Nat) :
    palindromePathFinset (2 * m + 1) r = oddPalindromeImageFinset m r := by
  apply Finset.ext
  intro word
  constructor
  · intro hword
    have hdata := mem_palindromePathFinset.mp hword
    rcases palindrome_odd_decomposition hdata.2.2 hdata.1 with
      ⟨pfx, center, hpfxLength, rfl⟩
    have hcount : 2 * Path.countR pfx +
        (if center = Step.R then 1 else 0) = r := by
      simpa using hdata.2.1
    have hpfxCount : Path.countR pfx = r / 2 := by
      cases center <;> simp at hcount <;> omega
    have hcenter : center = parityCenter r := by
      cases center <;> simp [parityCenter] at hcount ⊢ <;> omega
    apply Finset.mem_image.mpr
    refine ⟨pfx, mem_balancedPathFinset.mpr ⟨hpfxLength, hpfxCount⟩, ?_⟩
    rw [hcenter]
  · intro hword
    rcases Finset.mem_image.mp hword with ⟨pfx, hpfx, rfl⟩
    have hpfxData := mem_balancedPathFinset.mp hpfx
    apply mem_palindromePathFinset.mpr
    refine ⟨by simp [hpfxData.1], ?_, oddPalindrome_reverse _ _⟩
    have hmod : r % 2 = 0 ∨ r % 2 = 1 := by omega
    rcases hmod with hmod | hmod <;>
      simp [parityCenter, hpfxData.2, hmod] <;> omega

theorem palindromePathFinset_odd_card (m r : Nat) :
    (palindromePathFinset (2 * m + 1) r).card = m.choose (r / 2) := by
  rw [palindromePathFinset_odd_eq_image, oddPalindromeImageFinset_card]

theorem palindromePathFinset_even_card_of_odd
    (m r : Nat) (hr : Odd r) :
    (palindromePathFinset (2 * m) r).card = 0 := by
  rcases hr with ⟨q, hq⟩
  have hempty : palindromePathFinset (2 * m) r = ∅ := by
    apply Finset.eq_empty_of_forall_notMem
    intro word hword
    have hdata := mem_palindromePathFinset.mp hword
    rcases palindrome_even_decomposition hdata.2.2 hdata.1 with
      ⟨pfx, _, rfl⟩
    have hcount := hdata.2.1
    simp at hcount
    omega
  rw [hempty]
  rfl

end LatticePathOrdersKernel
