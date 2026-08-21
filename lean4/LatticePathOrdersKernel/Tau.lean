import LatticePathOrdersKernel.UniqueRotation
import LatticePathOrdersKernel.PathBand

/-!
# The reversal involution on the rational-Dyck carrier
-/

namespace LatticePathOrdersKernel

open LatticePathOrders

noncomputable def canonicalRotate (a b : Nat) (word : Path) : Path :=
  if hlength : 0 < word.length then
    word.rotate (minimumPrefixIndex a b word hlength).val
  else word

theorem canonicalRotate_isRotated (a b : Nat) (word : Path) :
    word ~r canonicalRotate a b word := by
  unfold canonicalRotate
  split
  · exact ⟨_, rfl⟩
  · exact List.IsRotated.refl word

theorem canonicalRotate_carrier
    {a b : Nat} (ha : 0 < a) (hb : 0 < b)
    {word : Path} (hr : Path.countR word = a)
    (hu : Path.countU word = b) :
    Carrier a b (canonicalRotate a b word) := by
  have hlength : 0 < word.length := by
    rw [← countR_add_countU word, hr, hu]
    omega
  simp only [canonicalRotate, dif_pos hlength]
  exact minimum_rotation_carrier ha hb hr hu

noncomputable def tau (a b : Nat) (word : Path) : Path :=
  canonicalRotate a b word.reverse

theorem tau_carrier
    {a b : Nat} (ha : 0 < a) (hb : 0 < b)
    {word : Path} (hword : Carrier a b word) :
    Carrier a b (tau a b word) := by
  have hc := carrier_components hword
  unfold tau
  apply canonicalRotate_carrier ha hb
  · have hcount := word.reverse_perm.count Step.R
    change Path.countR word.reverse = Path.countR word at hcount
    exact hcount.trans hc.1
  · have hcount := word.reverse_perm.count Step.U
    change Path.countU word.reverse = Path.countU word at hcount
    exact hcount.trans hc.2.1

theorem reverse_isRotated_tau (a b : Nat) (word : Path) :
    word.reverse ~r tau a b word :=
  canonicalRotate_isRotated a b word.reverse

theorem rotation_fin_of_isRotated
    {word rotated : Path} (hlength : 0 < word.length)
    (h : word ~r rotated) :
    ∃ k : Fin word.length, word.rotate k.val = rotated := by
  rcases h with ⟨rotation, hrotation⟩
  let k : Fin word.length :=
    ⟨rotation % word.length, Nat.mod_lt _ hlength⟩
  refine ⟨k, ?_⟩
  dsimp [k]
  exact (List.rotate_mod word rotation).trans hrotation

theorem tau_involution
    {a b : Nat} (ha : 0 < a) (hb : 0 < b)
    (hcoprime : Nat.Coprime a b)
    {word : Path} (hword : Carrier a b word) :
    tau a b (tau a b word) = word := by
  have htau := tau_carrier ha hb hword
  have htau2 := tau_carrier ha hb htau
  have hreverse := (reverse_isRotated_tau a b word).reverse
  have hwordReverseTau : word ~r (tau a b word).reverse := by
    simpa using hreverse
  have htauReverse := reverse_isRotated_tau a b (tau a b word)
  have hrot : word ~r tau a b (tau a b word) :=
    hwordReverseTau.trans htauReverse
  have hc := carrier_components hword
  have hlength : 0 < word.length := by
    rw [carrier_length hword]
    omega
  rcases rotation_fin_of_isRotated hlength hrot with ⟨rotation, hrotation⟩
  have hunique := unique_admissible_rotation ha hb hcoprime hc.1 hc.2.1
  let zero : Fin word.length := ⟨0, hlength⟩
  have hzeroCarrier : Carrier a b (word.rotate zero.val) := by
    simpa [zero] using hword
  have hrotationCarrier : Carrier a b (word.rotate rotation.val) := by
    rw [hrotation]
    exact htau2
  have heq := hunique.unique hzeroCarrier hrotationCarrier
  have hrotationZero : rotation.val = 0 := congrArg Fin.val heq.symm
  rw [← hrotation]
  simpa [hrotationZero]

theorem carrier_isRotated_unique
    {a b : Nat} (ha : 0 < a) (hb : 0 < b)
    (hcoprime : Nat.Coprime a b)
    {left right : Path} (hleft : Carrier a b left)
    (hright : Carrier a b right) (hrot : left ~r right) :
    right = left := by
  have hc := carrier_components hleft
  have hlength : 0 < left.length := by rw [carrier_length hleft]; omega
  rcases rotation_fin_of_isRotated hlength hrot with ⟨rotation, hrotation⟩
  have hunique := unique_admissible_rotation ha hb hcoprime hc.1 hc.2.1
  let zero : Fin left.length := ⟨0, hlength⟩
  have hzero : Carrier a b (left.rotate zero.val) := by simpa [zero] using hleft
  have hrotationCarrier : Carrier a b (left.rotate rotation.val) := by
    rw [hrotation]
    exact hright
  have heq := hunique.unique hzero hrotationCarrier
  have hval : rotation.val = 0 := congrArg Fin.val heq.symm
  rw [← hrotation]
  simp [hval]

theorem carrier_dihedral_iff_eq_or_tau
    {a b : Nat} (ha : 0 < a) (hb : 0 < b)
    (hcoprime : Nat.Coprime a b)
    {left right : Path} (hleft : Carrier a b left)
    (hright : Carrier a b right) :
    Dihedral left right ↔ right = left ∨ right = tau a b left := by
  constructor
  · intro hdihedral
    rcases hdihedral with hdirect | hreversed
    · exact Or.inl (carrier_isRotated_unique ha hb hcoprime
        hleft hright hdirect)
    · right
      have htau := tau_carrier ha hb hleft
      have hrevTau := reverse_isRotated_tau a b left
      have htauRight : tau a b left ~r right := hrevTau.symm.trans hreversed
      exact carrier_isRotated_unique ha hb hcoprime htau hright htauRight
  · intro hcases
    rcases hcases with heq | heq
    · subst right
      exact Or.inl (List.IsRotated.refl left)
    · subst right
      exact Or.inr (reverse_isRotated_tau a b left)

end LatticePathOrdersKernel
