import LatticePathOrdersKernel.TurnCodeDihedral

/-!
# The coefficient word and the cyclic equality/difference code

An equal edge is encoded by `[1, 1]` and an unequal edge by `[2]`, exactly as
in the manuscript.  The decoder below proves inside the kernel that this
coefficient encoding loses no turn-code information.  We also retain the
canonical block parsing, which is the representation on which cyclic rotation
and reversal act.
-/

namespace LatticePathOrdersKernel

open LatticePathOrders

def coefficientDigits : Bool → List Nat
  | true => [1, 1]
  | false => [2]

def encodeCoefficientCode (code : List Bool) : List Nat :=
  code.flatMap coefficientDigits

@[simp] theorem encodeCoefficientCode_nil : encodeCoefficientCode [] = [] := rfl

@[simp] theorem encodeCoefficientCode_cons (bit : Bool) (tail : List Bool) :
    encodeCoefficientCode (bit :: tail) =
      coefficientDigits bit ++ encodeCoefficientCode tail := rfl

def decodeCoefficientCode : List Nat → List Bool
  | [] => []
  | 1 :: 1 :: tail => true :: decodeCoefficientCode tail
  | 2 :: tail => false :: decodeCoefficientCode tail
  | _ :: tail => decodeCoefficientCode tail
termination_by digits => digits.length

@[simp] theorem decodeCoefficientCode_encode (code : List Bool) :
    decodeCoefficientCode (encodeCoefficientCode code) = code := by
  induction code with
  | nil => simp [decodeCoefficientCode]
  | cons bit tail ih =>
      cases bit <;> simp [coefficientDigits, decodeCoefficientCode, ih]

theorem encodeCoefficientCode_injective :
    Function.Injective encodeCoefficientCode := by
  intro left right heq
  have := congrArg decodeCoefficientCode heq
  simpa using this

def cyclicCoefficientWord (word : Path) : List Nat :=
  encodeCoefficientCode (closedTurnCode word)

def cyclicCoefficientBlocks (word : Path) : List (List Nat) :=
  (closedTurnCode word).map coefficientDigits

theorem cyclicCoefficientBlocks_flatten (word : Path) :
    (cyclicCoefficientBlocks word).flatten = cyclicCoefficientWord word := by
  simp [cyclicCoefficientBlocks, cyclicCoefficientWord,
    encodeCoefficientCode, List.flatMap]

theorem cyclicCoefficientWord_eq_iff_turnCode_eq
    {left right : Path} :
    cyclicCoefficientWord left = cyclicCoefficientWord right ↔
      closedTurnCode left = closedTurnCode right := by
  constructor
  · intro h
    apply encodeCoefficientCode_injective
    simpa [cyclicCoefficientWord] using h
  · intro h
    exact congrArg encodeCoefficientCode h

theorem cyclicCoefficientWord_recovers_up_to_flip
    {left right : Path} (hleft : 2 ≤ left.length)
    (hright : 2 ≤ right.length) (hlength : left.length = right.length)
    (hcoefficient : cyclicCoefficientWord left =
      cyclicCoefficientWord right) :
    left = right ∨ left.map flipStep = right := by
  apply closedTurnCode_recovers_up_to_flip hleft hright hlength
  exact cyclicCoefficientWord_eq_iff_turnCode_eq.mp hcoefficient

theorem coefficientDigits_injective : Function.Injective coefficientDigits := by
  intro left right heq
  cases left <;> cases right <;> simp [coefficientDigits] at heq ⊢

theorem dihedral_coefficientBlocks_implies_turnCode
    {left right : Path}
    (hblocks : Dihedral (cyclicCoefficientBlocks left)
      (cyclicCoefficientBlocks right)) :
    Dihedral (closedTurnCode left) (closedTurnCode right) := by
  have hmapInjective : Function.Injective (List.map coefficientDigits) :=
    List.map_injective_iff.mpr coefficientDigits_injective
  rcases hblocks with hdirect | hreversed
  · left
    rcases hdirect with ⟨rotation, hrotation⟩
    refine ⟨rotation, ?_⟩
    apply hmapInjective
    rw [List.map_rotate]
    exact hrotation
  · right
    rcases hreversed with ⟨rotation, hrotation⟩
    refine ⟨rotation, ?_⟩
    apply hmapInjective
    simp only [List.map_reverse, List.map_rotate]
    exact hrotation

theorem carrier_coefficientBlocks_dihedral_implies_path_dihedral
    {a b : Nat} (hb : 0 < b) (hab : b < a)
    {left right : Path} (hleft : Carrier a b left)
    (hright : Carrier a b right)
    (hblocks : Dihedral (cyclicCoefficientBlocks left)
      (cyclicCoefficientBlocks right)) :
    Dihedral left right := by
  apply carrier_turnCode_dihedral_implies_path_dihedral hb hab hleft hright
  exact dihedral_coefficientBlocks_implies_turnCode hblocks

end LatticePathOrdersKernel
