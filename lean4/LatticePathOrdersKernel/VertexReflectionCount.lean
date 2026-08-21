import LatticePathOrdersKernel.OddPalindromeCount

namespace LatticePathOrdersKernel

open LatticePathOrders

def vertexReflectionA (pfx : Path) : Path :=
  oddPalindrome pfx Step.R ++ [Step.U]

def vertexReflectionB (pfx : Path) : Path :=
  oddPalindrome pfx Step.U ++ [Step.R]

theorem vertexReflectionA_injective : Function.Injective vertexReflectionA := by
  intro left right heq
  have hdrop := congrArg List.dropLast heq
  simp [vertexReflectionA] at hdrop
  exact oddPalindrome_injective Step.R hdrop

theorem vertexReflectionB_injective : Function.Injective vertexReflectionB := by
  intro left right heq
  have hdrop := congrArg List.dropLast heq
  simp [vertexReflectionB] at hdrop
  exact oddPalindrome_injective Step.U hdrop

theorem reverse_concat_rotate_one (word : Path) (last : Step) :
    (word ++ [last]).reverse.rotate 1 = word.reverse ++ [last] := by
  simp [List.reverse_append]

@[simp] theorem vertexReflectionA_fixed (pfx : Path) :
    (vertexReflectionA pfx).reverse.rotate 1 = vertexReflectionA pfx := by
  rw [vertexReflectionA, reverse_concat_rotate_one,
    oddPalindrome_reverse]

@[simp] theorem vertexReflectionB_fixed (pfx : Path) :
    (vertexReflectionB pfx).reverse.rotate 1 = vertexReflectionB pfx := by
  rw [vertexReflectionB, reverse_concat_rotate_one,
    oddPalindrome_reverse]

@[simp] theorem vertexReflectionA_length (pfx : Path) :
    (vertexReflectionA pfx).length = 2 * pfx.length + 2 := by
  simp [vertexReflectionA]

@[simp] theorem vertexReflectionB_length (pfx : Path) :
    (vertexReflectionB pfx).length = 2 * pfx.length + 2 := by
  simp [vertexReflectionB]

@[simp] theorem vertexReflectionA_countR (pfx : Path) :
    Path.countR (vertexReflectionA pfx) = 2 * Path.countR pfx + 1 := by
  simpa [vertexReflectionA, Path.countR] using
    (oddPalindrome_countR pfx Step.R)

@[simp] theorem vertexReflectionB_countR (pfx : Path) :
    Path.countR (vertexReflectionB pfx) = 2 * Path.countR pfx + 1 := by
  simpa [vertexReflectionB, Path.countR] using
    (oddPalindrome_countR pfx Step.U)

noncomputable def vertexReflectionPathFinset (n r : Nat) : Finset Path :=
  (balancedPathFinset n r).filter fun word => word.reverse.rotate 1 = word

theorem mem_vertexReflectionPathFinset {n r : Nat} {word : Path} :
    word ∈ vertexReflectionPathFinset n r ↔
      word.length = n ∧ Path.countR word = r ∧
        word.reverse.rotate 1 = word := by
  simp only [vertexReflectionPathFinset, Finset.mem_filter,
    mem_balancedPathFinset]
  tauto

noncomputable def vertexReflectionImageA (m r : Nat) : Finset Path :=
  (balancedPathFinset m ((r - 1) / 2)).image vertexReflectionA

noncomputable def vertexReflectionImageB (m r : Nat) : Finset Path :=
  (balancedPathFinset m ((r - 1) / 2)).image vertexReflectionB

theorem vertexReflectionImageA_card (m r : Nat) :
    (vertexReflectionImageA m r).card = m.choose ((r - 1) / 2) := by
  rw [vertexReflectionImageA, Finset.card_image_of_injective _
    vertexReflectionA_injective, balancedPathFinset_card]

theorem vertexReflectionImageB_card (m r : Nat) :
    (vertexReflectionImageB m r).card = m.choose ((r - 1) / 2) := by
  rw [vertexReflectionImageB, Finset.card_image_of_injective _
    vertexReflectionB_injective, balancedPathFinset_card]

theorem vertexReflectionImages_disjoint (m r : Nat) :
    Disjoint (vertexReflectionImageA m r) (vertexReflectionImageB m r) := by
  rw [Finset.disjoint_left]
  intro word hA hB
  rcases Finset.mem_image.mp hA with ⟨left, _, hleft⟩
  rcases Finset.mem_image.mp hB with ⟨right, _, hright⟩
  have hlast := congrArg List.getLast? (hleft.trans hright.symm)
  simp [vertexReflectionA, vertexReflectionB] at hlast

theorem vertexReflectionPathFinset_eq_images
    (m r : Nat) (hr : Odd r) :
    vertexReflectionPathFinset (2 * m + 2) r =
      vertexReflectionImageA m r ∪ vertexReflectionImageB m r := by
  rcases hr with ⟨q, hq⟩
  have hhalf : (r - 1) / 2 = q := by rw [hq]; omega
  have hcountFormula : 2 * ((r - 1) / 2) + 1 = r := by
    rw [hhalf, hq]
  apply Finset.ext
  intro word
  constructor
  · intro hword
    have hdata := mem_vertexReflectionPathFinset.mp hword
    have hne : word ≠ [] := by intro h; simp [h] at hdata
    let last := word.getLast hne
    let middle := word.dropLast
    have hdecomp : middle ++ [last] = word :=
      List.dropLast_append_getLast hne
    have hmiddlePal : middle.reverse = middle := by
      have hfixed := hdata.2.2
      rw [← hdecomp, reverse_concat_rotate_one] at hfixed
      have hdrop := congrArg List.dropLast hfixed
      simpa using hdrop
    have hmiddleLength : middle.length = 2 * m + 1 := by
      have := congrArg List.length hdecomp
      simp at this
      omega
    rcases palindrome_odd_decomposition hmiddlePal hmiddleLength with
      ⟨pfx, center, hpfxLength, hmiddle⟩
    have hwordCount := hdata.2.1
    rw [← hdecomp, hmiddle] at hwordCount
    have hcountBase : Path.countR (oddPalindrome pfx center) +
        Path.countR [last] = r := by
      simpa [Path.countR] using hwordCount
    rw [oddPalindrome_countR] at hcountBase
    unfold Path.countR at hcountBase
    cases center with
    | R =>
        cases hlast : last with
        | R =>
            simp [Path.countR, hlast] at hcountBase
            omega
        | U =>
            have hpfxCount : Path.countR pfx = (r - 1) / 2 := by
              change List.count Step.R pfx = (r - 1) / 2
              rw [hhalf]
              simp [Path.countR, hlast] at hcountBase
              omega
            have hpfxMem : pfx ∈ balancedPathFinset m ((r - 1) / 2) :=
              mem_balancedPathFinset.mpr ⟨hpfxLength, hpfxCount⟩
            apply Finset.mem_union_left
            apply Finset.mem_image.mpr
            refine ⟨pfx, hpfxMem, ?_⟩
            rw [← hdecomp, hmiddle, hlast]
            rfl
    | U =>
        cases hlast : last with
        | R =>
            have hpfxCount : Path.countR pfx = (r - 1) / 2 := by
              change List.count Step.R pfx = (r - 1) / 2
              rw [hhalf]
              simp [Path.countR, hlast] at hcountBase
              omega
            have hpfxMem : pfx ∈ balancedPathFinset m ((r - 1) / 2) :=
              mem_balancedPathFinset.mpr ⟨hpfxLength, hpfxCount⟩
            apply Finset.mem_union_right
            apply Finset.mem_image.mpr
            refine ⟨pfx, hpfxMem, ?_⟩
            rw [← hdecomp, hmiddle, hlast]
            rfl
        | U =>
            simp [Path.countR, hlast] at hcountBase
            omega
  · intro hword
    rcases Finset.mem_union.mp hword with hA | hB
    · rcases Finset.mem_image.mp hA with ⟨pfx, hpfx, rfl⟩
      have hpfxData := mem_balancedPathFinset.mp hpfx
      apply mem_vertexReflectionPathFinset.mpr
      refine ⟨by simp [hpfxData.1], ?_, vertexReflectionA_fixed pfx⟩
      simpa [hpfxData.2] using hcountFormula
    · rcases Finset.mem_image.mp hB with ⟨pfx, hpfx, rfl⟩
      have hpfxData := mem_balancedPathFinset.mp hpfx
      apply mem_vertexReflectionPathFinset.mpr
      refine ⟨by simp [hpfxData.1], ?_, vertexReflectionB_fixed pfx⟩
      simpa [hpfxData.2] using hcountFormula

theorem vertexReflectionPathFinset_card
    (m r : Nat) (hr : Odd r) :
    (vertexReflectionPathFinset (2 * m + 2) r).card =
      2 * m.choose ((r - 1) / 2) := by
  rw [vertexReflectionPathFinset_eq_images m r hr,
    Finset.card_union_of_disjoint (vertexReflectionImages_disjoint m r),
    vertexReflectionImageA_card, vertexReflectionImageB_card]
  omega

end LatticePathOrdersKernel
