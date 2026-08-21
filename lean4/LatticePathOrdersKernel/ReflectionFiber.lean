import LatticePathOrdersKernel.ReflectionConjugacy

namespace LatticePathOrdersKernel

open LatticePathOrders

noncomputable def reflectionFiberFinset (n r axis : Nat) : Finset Path :=
  (balancedPathFinset n r).filter fun word => cyclicReflection word axis = word

theorem mem_reflectionFiberFinset {n r axis : Nat} {word : Path} :
    word ∈ reflectionFiberFinset n r axis ↔
      word.length = n ∧ Path.countR word = r ∧
        cyclicReflection word axis = word := by
  simp only [reflectionFiberFinset, Finset.mem_filter,
    mem_balancedPathFinset]
  tauto

theorem reflectionFiber_zero_eq_palindrome (n r : Nat) :
    reflectionFiberFinset n r 0 = palindromePathFinset n r := by
  apply Finset.ext
  intro word
  rw [mem_reflectionFiberFinset, mem_palindromePathFinset]
  simp [cyclicReflection]

theorem reflectionFiber_one_eq_vertex (n r : Nat) :
    reflectionFiberFinset n r 1 = vertexReflectionPathFinset n r := by
  apply Finset.ext
  intro word
  rw [mem_reflectionFiberFinset, mem_vertexReflectionPathFinset]
  rfl

theorem rotate_then_back {n : Nat} {word : Path}
    (hlength : word.length = n) {shift : Nat} (hshift : shift < n) :
    (word.rotate shift).rotate (n - shift) = word := by
  rw [List.rotate_rotate]
  have hsum : shift + (n - shift) = n := by omega
  rw [hsum, ← hlength, List.rotate_length]

theorem rotate_back_then {n : Nat} {word : Path}
    (hlength : word.length = n) {shift : Nat} (hshift : shift < n) :
    (word.rotate (n - shift)).rotate shift = word := by
  rw [List.rotate_rotate]
  have hsum : n - shift + shift = n := by omega
  rw [hsum, ← hlength, List.rotate_length]

theorem reflectionFiber_card_conjugate
    {n r axis shift : Nat} (hn : 0 < n) (hshift : shift < n) :
    (reflectionFiberFinset n r ((axis + 2 * shift) % n)).card =
      (reflectionFiberFinset n r axis).card := by
  let forward : ↥(reflectionFiberFinset n r axis) →
      ↥(reflectionFiberFinset n r ((axis + 2 * shift) % n)) :=
    fun word => ⟨word.1.rotate shift, by
      have hdata := mem_reflectionFiberFinset.mp word.2
      apply mem_reflectionFiberFinset.mpr
      refine ⟨by simpa using hdata.1, ?_, ?_⟩
      · have hperm := List.rotate_perm word.1 shift
        have hcount := hperm.count Step.R
        change Path.countR (word.1.rotate shift) = Path.countR word.1 at hcount
        exact hcount.trans hdata.2.1
      · exact (cyclicReflection_rotate_fixed_iff hn hdata.1
          axis shift hshift).mp hdata.2.2⟩
  let backward : ↥(reflectionFiberFinset n r ((axis + 2 * shift) % n)) →
      ↥(reflectionFiberFinset n r axis) :=
    fun word => ⟨word.1.rotate (n - shift), by
      have hdata := mem_reflectionFiberFinset.mp word.2
      have hbackLength : (word.1.rotate (n - shift)).length = n := by
        simpa using hdata.1
      have hbackRotate : (word.1.rotate (n - shift)).rotate shift = word.1 :=
        rotate_back_then hdata.1 hshift
      apply mem_reflectionFiberFinset.mpr
      refine ⟨hbackLength, ?_, ?_⟩
      · have hperm := List.rotate_perm word.1 (n - shift)
        have hcount := hperm.count Step.R
        change Path.countR (word.1.rotate (n - shift)) = Path.countR word.1 at hcount
        exact hcount.trans hdata.2.1
      · apply (cyclicReflection_rotate_fixed_iff hn hbackLength
          axis shift hshift).mpr
        rw [hbackRotate]
        exact hdata.2.2⟩
  let equiv : ↥(reflectionFiberFinset n r axis) ≃
      ↥(reflectionFiberFinset n r ((axis + 2 * shift) % n)) := {
    toFun := forward
    invFun := backward
    left_inv := fun word => by
      apply Subtype.ext
      exact rotate_then_back
        (mem_reflectionFiberFinset.mp word.2).1 hshift
    right_inv := fun word => by
      apply Subtype.ext
      exact rotate_back_then
        (mem_reflectionFiberFinset.mp word.2).1 hshift }
  rw [← Fintype.card_coe, ← Fintype.card_coe, Fintype.card_congr equiv.symm]

end LatticePathOrdersKernel
