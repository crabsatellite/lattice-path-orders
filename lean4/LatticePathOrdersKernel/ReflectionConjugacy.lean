import LatticePathOrdersKernel.VertexReflectionCount

namespace LatticePathOrdersKernel

open LatticePathOrders

def cyclicReflection (word : Path) (axis : Nat) : Path :=
  word.reverse.rotate axis

theorem cyclicReflection_rotate
    {n : Nat} (hn : 0 < n) {word : Path} (hlength : word.length = n)
    (axis shift : Nat) (hshift : shift < n) :
    cyclicReflection (word.rotate shift) ((axis + 2 * shift) % n) =
      (cyclicReflection word axis).rotate shift := by
  unfold cyclicReflection
  rw [List.reverse_rotate, hlength, Nat.mod_eq_of_lt hshift,
    List.rotate_rotate, List.rotate_rotate]
  let leftIndex := n - shift + ((axis + 2 * shift) % n)
  let rightIndex := axis + shift
  have hcast : (leftIndex : ZMod n) = (rightIndex : ZMod n) := by
    dsimp [leftIndex, rightIndex]
    rw [Nat.cast_add, Nat.cast_sub hshift.le,
      ZMod.natCast_mod, ZMod.natCast_self]
    push_cast
    ring
  have hmod : leftIndex % n = rightIndex % n :=
    (ZMod.natCast_eq_natCast_iff' leftIndex rightIndex n).mp hcast
  calc
    word.reverse.rotate leftIndex =
        word.reverse.rotate (leftIndex % word.reverse.length) :=
      (List.rotate_mod word.reverse leftIndex).symm
    _ = word.reverse.rotate (leftIndex % n) := by rw [List.length_reverse, hlength]
    _ = word.reverse.rotate (rightIndex % n) := by rw [hmod]
    _ = word.reverse.rotate (rightIndex % word.reverse.length) := by
      rw [List.length_reverse, hlength]
    _ = word.reverse.rotate rightIndex := List.rotate_mod word.reverse rightIndex

theorem cyclicReflection_rotate_fixed_iff
    {n : Nat} (hn : 0 < n) {word : Path} (hlength : word.length = n)
    (axis shift : Nat) (hshift : shift < n) :
    cyclicReflection word axis = word ↔
      cyclicReflection (word.rotate shift) ((axis + 2 * shift) % n) =
        word.rotate shift := by
  rw [cyclicReflection_rotate hn hlength axis shift hshift]
  exact (@List.rotate_eq_rotate Step (cyclicReflection word axis) word shift).symm

end LatticePathOrdersKernel
