import LatticePathOrders.MatrixBounds
import LatticePathOrders.CoverCertificate

namespace LatticePathOrders

def fib : Nat → Nat
  | 0 => 0
  | 1 => 1
  | n + 2 => fib (n + 1) + fib n

def equalAdjacencies : Path → Nat
  | [] | [_] => 0
  | x :: y :: rest => (if x = y then 1 else 0) + equalAdjacencies (y :: rest)

def lagrangeLower (total : Nat) (pfx : Path) : Rat :=
  if pfx.length = total then lagrangeSq pfx
  else
    let remaining := total - pfx.length
    let cyclicPrefix := D * matrixProduct (adjacencyBlocks pfx)
    let lowerMatrix := cyclicPrefix * Mat2.pow D remaining
    let upperMatrix := cyclicPrefix * Mat2.pow E remaining
    ((lowerMatrix.trace ^ 2 - 4 : Nat) : Rat) /
      ((upperMatrix.a21 ^ 2 : Nat) : Rat)

def lagrangeUpper (total : Nat) (pfx : Path) : Rat :=
  if pfx.length = total then lagrangeSq pfx
  else
    let remaining := total - pfx.length
    let cyclicPrefix := D * matrixProduct (adjacencyBlocks pfx)
    let upperMatrix := cyclicPrefix * Mat2.pow E remaining
    ((upperMatrix.trace ^ 2 - 4 : Nat) : Rat) /
      ((fib (total + equalAdjacencies pfx) ^ 2 : Nat) : Rat)

def lagrangeBound (total : Nat) (pfx : Path) : PrefixBound Rat where
  pathPrefix := pfx
  lower := lagrangeLower total pfx
  upper := lagrangeUpper total pfx

def lagrangeCertificate (total : Nat) (frontier : List Path) :
    List (PrefixBound Rat) := frontier.map (lagrangeBound total)

end LatticePathOrders
