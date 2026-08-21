import Mathlib.Data.List.Rotate
import Mathlib.Data.Rat.Defs
import Mathlib.Tactic

namespace LatticePathOrders

/-- The two literal steps used in Schiffler's rational-Dyck paths. -/
inductive Step where
  | R
  | U
deriving DecidableEq, Repr, Inhabited

abbrev Path := List Step

def Step.toChar : Step → Char
  | .R => 'R'
  | .U => 'U'

def Path.countR (w : Path) : Nat := w.count Step.R

def Path.countU (w : Path) : Nat := w.count Step.U

/-- The literal rational-Dyck prefix inequality. -/
def prefixFeasible (a b : Nat) (w : Path) : Bool :=
  (List.range (w.length + 1)).all fun k =>
    a * Path.countU (w.take k) ≤ b * Path.countR (w.take k)

/-- Executable membership in the finite carrier `D(a,b)`. -/
def inCarrier (a b : Nat) (w : Path) : Bool :=
  Path.countR w = a && Path.countU w = b && prefixFeasible a b w

def parsePath : List Char → Option Path
  | [] => some []
  | 'R' :: cs => (Step.R :: ·) <$> parsePath cs
  | 'U' :: cs => (Step.U :: ·) <$> parsePath cs
  | _ => none

def mustParsePath (s : String) : Path :=
  (parsePath s.toList).getD []

@[simp] theorem countR_nil : Path.countR [] = 0 := rfl
@[simp] theorem countU_nil : Path.countU [] = 0 := rfl

end LatticePathOrders
