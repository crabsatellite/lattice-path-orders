import LatticePathOrdersKernel.PathBandTileRigidity

namespace LatticePathOrdersKernel

open LatticePathOrders
open LatticePathOrdersClassical

def directionEqualityCode (n : Nat) (word : Path) : List Bool :=
  List.ofFn fun i : Fin n =>
    decide (pathDirections n word (i.val : ZMod n) =
      pathDirections n word ((i.val : ZMod n) + 1))

theorem directionOfStep_injective : Function.Injective directionOfStep := by
  intro left right h
  cases left <;> cases right <;> simp [directionOfStep] at h ⊢

theorem closedTurnCode_eq_directionEqualityCode
    {n : Nat} [NeZero n] {word : Path} (hlength : word.length = n)
    (htwo : 2 ≤ n) :
    closedTurnCode word = directionEqualityCode n word := by
  subst n
  letI : Fact (1 < word.length) := ⟨by omega⟩
  rw [closedTurnCode_eq_cyclicZipCode (by omega)]
  apply List.ext_getElem
  · simp [cyclicZipCode, directionEqualityCode]
  · intro i hleft hright
    have hi : i < word.length := by
      simpa [cyclicZipCode] using hleft
    have hrot : i < (word.rotate 1).length := by simpa
    simp only [cyclicZipCode, List.getElem_zipWith,
      directionEqualityCode, List.getElem_ofFn]
    rw [List.getElem_rotate word 1 i hrot]
    unfold pathDirections
    simp only [ZMod.val_natCast, Nat.mod_eq_of_lt hi,
      ZMod.val_add, ZMod.val_one]
    have hnext : (i + 1) % word.length < word.length := Nat.mod_lt _ (by omega)
    simp only [List.getElem?_eq_getElem hi, List.getElem?_eq_getElem hnext,
      Option.getD_some, stepEq]
    apply Bool.eq_iff_iff.mpr
    simp [stepEq, directionOfStep_injective.eq_iff]

end LatticePathOrdersKernel
