import LatticePathOrdersKernel.ReflectionFiber

namespace LatticePathOrdersKernel

open LatticePathOrders

theorem odd_axis_shift_exists (m : Nat) (axis : Fin (2 * m + 1)) :
    ∃ shift : Fin (2 * m + 1),
      (2 * shift.val) % (2 * m + 1) = axis.val := by
  rcases Nat.even_or_odd axis.val with heven | hodd
  · rcases heven with ⟨shift, hshift⟩
    have hshiftLt : shift < 2 * m + 1 := by omega
    have htwoShiftLt : 2 * shift < 2 * m + 1 := by
      have htwo : 2 * shift = axis.val := by omega
      omega
    refine ⟨⟨shift, hshiftLt⟩, ?_⟩
    change (2 * shift) % (2 * m + 1) = axis.val
    rw [Nat.mod_eq_of_lt htwoShiftLt]
    omega
  · rcases hodd with ⟨shift, hshift⟩
    have hnewLt : shift + m + 1 < 2 * m + 1 := by omega
    refine ⟨⟨shift + m + 1, hnewLt⟩, ?_⟩
    have heq : 2 * (shift + m + 1) = axis.val + (2 * m + 1) := by omega
    rw [heq, Nat.add_mod, Nat.mod_eq_of_lt axis.isLt]
    simp
    omega

theorem odd_reflectionFiber_card (m r : Nat) (axis : Fin (2 * m + 1)) :
    (reflectionFiberFinset (2 * m + 1) r axis.val).card =
      m.choose (r / 2) := by
  rcases odd_axis_shift_exists m axis with ⟨shift, hshift⟩
  have hconj := reflectionFiber_card_conjugate
    (n := 2 * m + 1) (r := r) (axis := 0)
    (shift := shift.val) (by omega) shift.isLt
  simp only [Nat.zero_add, hshift] at hconj
  rw [hconj, reflectionFiber_zero_eq_palindrome,
    palindromePathFinset_odd_card]

theorem even_reflectionFiber_card_of_even_axis
    (m r : Nat) (hr : Odd r) (axis : Fin (2 * m + 2))
    (haxis : Even axis.val) :
    (reflectionFiberFinset (2 * m + 2) r axis.val).card = 0 := by
  rcases haxis with ⟨shift, hshift⟩
  have hshiftLt : shift < 2 * m + 2 := by omega
  have htwoShiftLt : 2 * shift < 2 * m + 2 := by omega
  have haxisMod : (2 * shift) % (2 * m + 2) = axis.val := by
    rw [Nat.mod_eq_of_lt htwoShiftLt]
    omega
  have hconj := reflectionFiber_card_conjugate
    (n := 2 * m + 2) (r := r) (axis := 0)
    (shift := shift) (by omega) hshiftLt
  simp only [Nat.zero_add, haxisMod] at hconj
  rw [hconj, reflectionFiber_zero_eq_palindrome]
  convert palindromePathFinset_even_card_of_odd (m + 1) r hr using 1 <;> omega

theorem even_reflectionFiber_card_of_odd_axis
    (m r : Nat) (hr : Odd r) (axis : Fin (2 * m + 2))
    (haxis : Odd axis.val) :
    (reflectionFiberFinset (2 * m + 2) r axis.val).card =
      2 * m.choose ((r - 1) / 2) := by
  rcases haxis with ⟨shift, hshift⟩
  have hshiftLt : shift < 2 * m + 2 := by omega
  have honeShiftLt : 1 + 2 * shift < 2 * m + 2 := by omega
  have haxisMod : (1 + 2 * shift) % (2 * m + 2) = axis.val := by
    rw [Nat.mod_eq_of_lt honeShiftLt]
    omega
  have hconj := reflectionFiber_card_conjugate
    (n := 2 * m + 2) (r := r) (axis := 1)
    (shift := shift) (by omega) hshiftLt
  rw [haxisMod] at hconj
  rw [hconj, reflectionFiber_one_eq_vertex,
    vertexReflectionPathFinset_card m r hr]

noncomputable def reflectionPairCount (n r : Nat) : Nat :=
  ∑ axis : Fin n, (reflectionFiberFinset n r axis.val).card

theorem reflectionPairCount_odd (m r : Nat) :
    reflectionPairCount (2 * m + 1) r =
      (2 * m + 1) * m.choose (r / 2) := by
  unfold reflectionPairCount
  simp_rw [odd_reflectionFiber_card]
  simp

theorem reflectionPairCount_even_of_odd
    (m r : Nat) (hr : Odd r) :
    reflectionPairCount (2 * m + 2) r =
      (2 * m + 2) * m.choose ((r - 1) / 2) := by
  let t := m + 1
  have htotal : t * 2 = 2 * m + 2 := by dsimp [t]; omega
  let equiv : Fin t × Fin 2 ≃ Fin (2 * m + 2) :=
    finProdFinEquiv.trans (finCongr htotal)
  unfold reflectionPairCount
  rw [← equiv.sum_comp, Fintype.sum_prod_type]
  simp only [Fin.sum_univ_two]
  have heven (i : Fin t) : Even (equiv (i, 0)).val := by
    refine ⟨i.val, ?_⟩
    simp [equiv, finProdFinEquiv, t]
    omega
  have hodd (i : Fin t) : Odd (equiv (i, 1)).val := by
    refine ⟨i.val, ?_⟩
    simp [equiv, finProdFinEquiv, t]
    omega
  calc
    (∑ i : Fin t,
        ((reflectionFiberFinset (2 * m + 2) r (equiv (i, 0)).val).card +
         (reflectionFiberFinset (2 * m + 2) r (equiv (i, 1)).val).card)) =
        ∑ _i : Fin t, (0 + 2 * m.choose ((r - 1) / 2)) := by
      apply Fintype.sum_congr
      intro i
      rw [even_reflectionFiber_card_of_even_axis m r hr _ (heven i),
        even_reflectionFiber_card_of_odd_axis m r hr _ (hodd i)]
    _ = (2 * m + 2) * m.choose ((r - 1) / 2) := by
      simp [t]
      ring

end LatticePathOrdersKernel
