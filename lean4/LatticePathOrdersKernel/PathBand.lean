import LatticePathOrdersKernel.TurnCodeDihedral
import LatticePathOrdersClassical.CyclicSquareBandRotation
import LatticePathOrdersClassical.CyclicSquareBandReversal
import LatticePathOrdersClassical.CyclicSquareBandComplement

/-!
# From literal step words to cyclic square bands
-/

namespace LatticePathOrdersKernel

open LatticePathOrders
open LatticePathOrdersClassical

def directionOfStep : Step → Direction
  | .R => .right
  | .U => .up

def pathDirections (n : Nat) (word : Path) : ZMod n → Direction :=
  fun i => directionOfStep (word[i.val]?.getD Step.R)

abbrev PathBandVertex (n : Nat) (word : Path) :=
  BandVertex (pathDirections n word)

abbrev PathBandAdj (n : Nat) (word : Path) :=
  BandAdj (pathDirections n word)

def PathBandIso (n : Nat) (left right : Path) : Prop :=
  Nonempty (BandGraphIso (pathDirections n left) (pathDirections n right))

theorem PathBandIso.refl (n : Nat) (word : Path) :
    PathBandIso n word word :=
  ⟨BandGraphIso.refl (pathDirections n word)⟩

theorem PathBandIso.symm {n : Nat} {left right : Path}
    (h : PathBandIso n left right) : PathBandIso n right left := by
  rcases h with ⟨iso⟩
  exact ⟨iso.symm⟩

theorem PathBandIso.trans {n : Nat} {left middle right : Path}
    (hleft : PathBandIso n left middle)
    (hright : PathBandIso n middle right) : PathBandIso n left right := by
  rcases hleft with ⟨leftIso⟩
  rcases hright with ⟨rightIso⟩
  exact ⟨leftIso.trans rightIso⟩

theorem pathDirections_congr {n : Nat} {left right : Path}
    (h : left = right) : pathDirections n left = pathDirections n right := by
  subst right
  rfl

theorem pathDirections_rotate {n : Nat} [NeZero n]
    (word : Path) (hlength : word.length = n) (rotation : Nat) :
    pathDirections n (word.rotate rotation) =
      rotateSteps (pathDirections n word) (rotation : ZMod n) := by
  funext i
  unfold pathDirections rotateSteps
  have hi : i.val < word.length := by
    rw [hlength]
    exact ZMod.val_lt i
  rw [List.getElem?_rotate hi]
  congr 2
  rw [ZMod.val_add, ZMod.val_natCast, hlength]
  simp [Nat.add_mod]

theorem pathBandIso_rotate {n : Nat} [NeZero n]
    (word : Path) (hlength : word.length = n) (rotation : Nat) :
    PathBandIso n word (word.rotate rotation) := by
  unfold PathBandIso
  rw [pathDirections_rotate word hlength rotation]
  exact ⟨rotateBandGraphIso (pathDirections n word) (rotation : ZMod n)⟩

theorem directionOfStep_flip (step : Step) :
    directionOfStep (flipStep step) = flipDirection (directionOfStep step) := by
  cases step <;> rfl

theorem pathDirections_map_flip {n : Nat} [NeZero n]
    (word : Path) (hlength : word.length = n) :
    pathDirections n (word.map flipStep) =
      complementSteps (pathDirections n word) := by
  funext i
  unfold pathDirections complementSteps
  have hi : i.val < word.length := by
    rw [hlength]
    exact ZMod.val_lt i
  rw [List.getElem?_map]
  simp only [List.getElem?_eq_getElem hi, Option.map_some, Option.getD_some]
  exact directionOfStep_flip word[i.val]

theorem pathBandIso_map_flip {n : Nat} [NeZero n]
    (word : Path) (hlength : word.length = n) :
    PathBandIso n word (word.map flipStep) := by
  unfold PathBandIso
  rw [pathDirections_map_flip word hlength]
  exact ⟨complementBandGraphIso (pathDirections n word)⟩

theorem val_neg_sub_one {n : Nat} [NeZero n] [Fact (1 < n)]
    (i : ZMod n) :
    (-i - 1).val = n - 1 - i.val := by
  have hi := ZMod.val_lt i
  have hrewrite : -i - 1 = -(i + 1) := by ring
  rw [hrewrite, ZMod.neg_val', ZMod.val_add, ZMod.val_one n]
  by_cases hlt : i.val + 1 < n
  · rw [Nat.mod_eq_of_lt hlt]
    have hsub : n - (i.val + 1) < n := by omega
    rw [Nat.mod_eq_of_lt hsub]
    omega
  · have heq : i.val + 1 = n := by omega
    rw [heq, Nat.mod_self]
    simp
    omega

theorem pathDirections_reverse {n : Nat} [NeZero n] [Fact (1 < n)]
    (word : Path) (hlength : word.length = n) :
    pathDirections n word.reverse = reverseSteps (pathDirections n word) := by
  funext i
  unfold pathDirections reverseSteps
  have hi : i.val < word.length := by
    rw [hlength]
    exact ZMod.val_lt i
  rw [List.getElem?_reverse hi]
  change directionOfStep (word[word.length - 1 - i.val]?.getD Step.R) =
    directionOfStep (word[(-i - 1).val]?.getD Step.R)
  rw [val_neg_sub_one]
  rw [hlength]

theorem pathBandIso_reverse {n : Nat} [NeZero n] [Fact (1 < n)]
    (word : Path) (hlength : word.length = n) :
    PathBandIso n word word.reverse := by
  unfold PathBandIso
  rw [pathDirections_reverse word hlength]
  exact ⟨reverseBandGraphIso (pathDirections n word)⟩

theorem path_dihedral_implies_bandIso {n : Nat} [NeZero n] [Fact (1 < n)]
    {left right : Path} (hleftLength : left.length = n)
    (hrightLength : right.length = n) (h : Dihedral left right) :
    PathBandIso n left right := by
  rcases h with hdirect | hreversed
  · rcases hdirect with ⟨rotation, hrotation⟩
    rw [← hrotation]
    exact pathBandIso_rotate left hleftLength rotation
  · rcases hreversed with ⟨rotation, hrotation⟩
    rw [← hrotation]
    apply (pathBandIso_reverse left hleftLength).trans
    exact pathBandIso_rotate left.reverse (by simpa using hleftLength) rotation

theorem carrier_turnCode_dihedral_implies_bandIso
    {a b : Nat} (hb : 0 < b) (hab : b < a)
    {left right : Path} (hleft : Carrier a b left)
    (hright : Carrier a b right)
    (hcode : Dihedral (closedTurnCode left) (closedTurnCode right)) :
    PathBandIso (a + b) left right := by
  letI : NeZero (a + b) := ⟨by omega⟩
  letI : Fact (1 < a + b) := ⟨by omega⟩
  apply path_dihedral_implies_bandIso
    (carrier_length hleft) (carrier_length hright)
  exact carrier_turnCode_dihedral_implies_path_dihedral hb hab hleft hright hcode

end LatticePathOrdersKernel
