import LatticePathOrdersKernel.MatchingParity

/-!
# Literal signed exponent in the parity normal form

The manuscript writes the exponent as the integer `b-a`.  The underlying
matrix has order three, so this file defines its signed power through the
residue in `ZMod 3` and proves that the previously derived natural exponent
`b+2a` is exactly the same matrix.
-/

namespace LatticePathOrdersKernel

open LatticePathOrders
open LatticePathOrdersClassical
open LatticePathOrdersClassical.F2Matrix

def fSignedPow (exponent : Int) : F2Matrix :=
  fPow ((exponent : ZMod 3).val)

theorem fSignedPow_difference_eq_natural_form (a b : Nat) :
    fSignedPow ((b : Int) - (a : Int)) = fPow (b + 2 * a) := by
  have hcast :
      (((b : Int) - (a : Int) : Int) : ZMod 3) =
        ((b + 2 * a : Nat) : ZMod 3) := by
    push_cast
    have hminusOne : (-1 : ZMod 3) = 2 := by decide
    calc
      (b : ZMod 3) - (a : ZMod 3) =
          (b : ZMod 3) + (-1 : ZMod 3) * (a : ZMod 3) := by ring
      _ = (b : ZMod 3) + 2 * (a : ZMod 3) := by rw [hminusOne]
  have hval := congrArg ZMod.val hcast
  unfold fSignedPow
  rw [hval]
  exact fPow_mod (b + 2 * a)

theorem matching_parity_signed_normal_form
    {a b : Nat} (ha : 0 < a) (hb : 0 < b)
    {word : Path} (hword : Carrier a b word) :
    ofNatMatrix (matrixProduct (adjacencyBlocks word)) =
      fSignedPow ((b : Int) - (a : Int)) * S := by
  rw [fSignedPow_difference_eq_natural_form]
  exact matching_parity_normal_form ha hb hword

end LatticePathOrdersKernel
