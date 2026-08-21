import Mathlib.Data.List.Basic

namespace LatticePathOrdersKernel

@[ext]
structure Coord where
  x : Int
  y : Int
deriving DecidableEq, Repr

end LatticePathOrdersKernel
