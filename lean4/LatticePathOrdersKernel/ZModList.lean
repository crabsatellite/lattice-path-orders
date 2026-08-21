import LatticePathOrdersKernel.DirectionEqualityCode

namespace LatticePathOrdersKernel

def zmodList {α : Type} (n : Nat) (values : ZMod n → α) : List α :=
  List.ofFn fun i : Fin n => values (i.val : ZMod n)

@[simp] theorem zmodList_length {α : Type} (n : Nat) (values : ZMod n → α) :
    (zmodList n values).length = n := by
  simp [zmodList]

@[simp] theorem zmodList_getElem {α : Type} {n : Nat}
    (values : ZMod n → α) (i : Nat) (hi : i < (zmodList n values).length) :
    (zmodList n values)[i] = values (i : ZMod n) := by
  simp [zmodList]

theorem zmodList_rotate {α : Type} {n : Nat} [NeZero n]
    (values : ZMod n → α) (rotation : Nat) :
    (zmodList n values).rotate rotation =
      zmodList n (fun i => values (i + rotation)) := by
  apply List.ext_getElem
  · simp
  · intro i hleft hright
    simp [List.getElem_rotate]

theorem zmodList_reverse {α : Type} {n : Nat} [NeZero n] [Fact (1 < n)]
    (values : ZMod n → α) :
    (zmodList n values).reverse =
      zmodList n (fun i => values (-i - 1)) := by
  apply List.ext_getElem
  · simp
  · intro i hleft hright
    have hi : i < n := by simpa using hleft
    rw [List.getElem_reverse]
    simp only [zmodList_getElem]
    apply congrArg values
    apply ZMod.val_injective
    rw [val_neg_sub_one]
    have hreverseIndex : n - 1 - i < n := by omega
    simp [ZMod.val_natCast, Nat.mod_eq_of_lt hi,
      Nat.mod_eq_of_lt hreverseIndex]

theorem directionEqualityCode_eq_zmodList
    (n : Nat) (word : LatticePathOrders.Path) :
    directionEqualityCode n word =
      zmodList n (fun i => decide (pathDirections n word i =
        pathDirections n word (i + 1))) := by
  rfl

theorem zmodList_dihedral_of_forward {α : Type} {n : Nat}
    [NeZero n] [Fact (1 < n)]
    (left right : ZMod n → α) (i j : ZMod n)
    (hvalues : ∀ k : Nat, left (i + k) = right (j + k)) :
    LatticePathOrders.Dihedral (zmodList n left) (zmodList n right) := by
  have heq : (zmodList n left).rotate i.val =
      (zmodList n right).rotate j.val := by
    rw [zmodList_rotate, zmodList_rotate]
    apply congrArg (zmodList n)
    funext x
    calc
      left (x + (i.val : ZMod n)) = left (i + (x.val : ZMod n)) := by
        rw [ZMod.natCast_zmod_val, ZMod.natCast_zmod_val]
        ring
      _ = right (j + (x.val : ZMod n)) := hvalues x.val
      _ = right (x + (j.val : ZMod n)) := by
        rw [ZMod.natCast_zmod_val, ZMod.natCast_zmod_val]
        ring
  left
  have hleft : zmodList n left ~r (zmodList n left).rotate i.val :=
    ⟨i.val, rfl⟩
  have hright : zmodList n right ~r (zmodList n right).rotate j.val :=
    ⟨j.val, rfl⟩
  have hmiddle : (zmodList n left).rotate i.val ~r
      (zmodList n right).rotate j.val := by
    rw [heq]
  exact hleft.trans (hmiddle.trans hright.symm)

theorem zmodList_dihedral_of_backward {α : Type} {n : Nat}
    [NeZero n] [Fact (1 < n)]
    (left right : ZMod n → α) (i j : ZMod n)
    (hvalues : ∀ k : Nat, left (i + k) = right (j - k)) :
    LatticePathOrders.Dihedral (zmodList n left) (zmodList n right) := by
  let rotation : Nat := (-j - 1).val
  have heq : (zmodList n left).rotate i.val =
      (zmodList n right).reverse.rotate rotation := by
    rw [zmodList_reverse, zmodList_rotate, zmodList_rotate]
    apply congrArg (zmodList n)
    funext x
    calc
      left (x + (i.val : ZMod n)) = left (i + (x.val : ZMod n)) := by
        rw [ZMod.natCast_zmod_val, ZMod.natCast_zmod_val]
        ring
      _ = right (j - (x.val : ZMod n)) := hvalues x.val
      _ = right (-(x + (rotation : ZMod n)) - 1) := by
        apply congrArg right
        change j - (x.val : ZMod n) =
          -(x + ((-j - 1).val : ZMod n)) - 1
        rw [ZMod.natCast_zmod_val, ZMod.natCast_zmod_val]
        ring
  have hleft : zmodList n left ~r (zmodList n left).rotate i.val :=
    ⟨i.val, rfl⟩
  have hright : (zmodList n right).reverse ~r
      (zmodList n right).reverse.rotate rotation := ⟨rotation, rfl⟩
  have hmiddle : (zmodList n left).rotate i.val ~r
      (zmodList n right).reverse.rotate rotation := by
    rw [heq]
  have hdirect : zmodList n left ~r (zmodList n right).reverse :=
    hleft.trans (hmiddle.trans hright.symm)
  right
  simpa using hdirect.reverse

end LatticePathOrdersKernel
