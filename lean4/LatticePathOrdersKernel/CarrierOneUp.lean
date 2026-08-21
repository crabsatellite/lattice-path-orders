import LatticePathOrdersKernel.IntrinsicTileCycle

namespace LatticePathOrdersKernel

open LatticePathOrders

theorem path_eq_replicate_R_of_countU_zero {word : Path}
    (hcount : Path.countU word = 0) :
    word = List.replicate word.length Step.R := by
  induction word with
  | nil => rfl
  | cons step rest ih =>
      cases step with
      | R =>
          simp only [Path.countU, Bool.false_eq_true, ↓reduceIte,
            Nat.zero_add] at hcount
          rw [List.length_cons, List.replicate_succ, ih hcount]
          simp only [List.length_replicate]
      | U => simp [Path.countU] at hcount

theorem carrier_one_up_normal_form
    {a : Nat} (ha : 0 < a) {word : Path} (hword : Carrier a 1 word) :
    word = List.replicate a Step.R ++ [Step.U] := by
  rcases carrier_ends_U ha (by decide) hword with ⟨pfx, rfl⟩
  have hcomponents := carrier_components hword
  have hcountU : Path.countU pfx = 0 := by
    simpa [Path.countU] using hcomponents.2.1
  have hpfx := path_eq_replicate_R_of_countU_zero hcountU
  have hlength : pfx.length = a := by
    have hcountR := hcomponents.1
    rw [hpfx] at hcountR
    simpa [Path.countR] using hcountR
  rw [hpfx, hlength]

theorem carrier_one_up_unique
    {a : Nat} (ha : 0 < a) {left right : Path}
    (hleft : Carrier a 1 left) (hright : Carrier a 1 right) :
    left = right := by
  rw [carrier_one_up_normal_form ha hleft,
    carrier_one_up_normal_form ha hright]

end LatticePathOrdersKernel
