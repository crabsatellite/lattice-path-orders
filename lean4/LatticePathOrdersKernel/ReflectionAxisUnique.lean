import LatticePathOrdersKernel.ReflectionAxisCount

namespace LatticePathOrdersKernel

open LatticePathOrders

theorem balanced_rotation_injective
    {a b : Nat} (ha : 0 < a) (hb : 0 < b)
    (hcoprime : Nat.Coprime a b) {word : Path}
    (hlength : word.length = a + b)
    (hcountR : Path.countR word = a)
    (hcountU : Path.countU word = b) :
    Function.Injective (fun k : Fin (a + b) => word.rotate k.val) := by
  rcases unique_admissible_rotation ha hb hcoprime hcountR hcountU with
    ⟨carrierRotation, hcarrier, _⟩
  let carrierWord := word.rotate carrierRotation.val
  have hcarrierInjective := carrier_rotation_injective ha hb hcoprime hcarrier
  intro left right heq
  apply hcarrierInjective
  dsimp [carrierWord]
  rw [List.rotate_rotate, List.rotate_rotate,
    Nat.add_comm carrierRotation.val left.val,
    Nat.add_comm carrierRotation.val right.val,
    ← List.rotate_rotate, ← List.rotate_rotate]
  exact congrArg (fun w => w.rotate carrierRotation.val) heq

theorem reflection_axis_unique
    {a b : Nat} (ha : 0 < a) (hb : 0 < b)
    (hcoprime : Nat.Coprime a b) {word : Path}
    (hlength : word.length = a + b)
    (hcountR : Path.countR word = a)
    (hcountU : Path.countU word = b)
    {left right : Fin (a + b)}
    (hleft : cyclicReflection word left.val = word)
    (hright : cyclicReflection word right.val = word) : left = right := by
  have hreverseLength : word.reverse.length = a + b := by simpa
  have hreverseR : Path.countR word.reverse = a := by
    have h := word.reverse_perm.count Step.R
    change Path.countR word.reverse = Path.countR word at h
    exact h.trans hcountR
  have hreverseU : Path.countU word.reverse = b := by
    have h := word.reverse_perm.count Step.U
    change Path.countU word.reverse = Path.countU word at h
    exact h.trans hcountU
  apply balanced_rotation_injective ha hb hcoprime
    hreverseLength hreverseR hreverseU
  exact hleft.trans hright.symm

end LatticePathOrdersKernel
