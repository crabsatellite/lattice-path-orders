import LatticePathOrders.Basic
import LatticePathOrdersKernel.Coordinate

/-!
# Literal band graphs

The construction below is Definition 4.1 in coordinates scaled by four.  A
half-unit square is placed at each edge midpoint and each internal vertex of
the lattice path.  One final square is placed above the last square, and its
right vertical edge is identified with the left vertical edge of the first
square.
-/

namespace LatticePathOrdersKernel

open LatticePathOrders

namespace Coord

@[reducible] def origin : Coord := ⟨0, 0⟩

@[reducible] def translate (p : Coord) (dx dy : Int) : Coord :=
  ⟨p.x + dx, p.y + dy⟩

end Coord

@[reducible] def stepEnd (p : Coord) : Step → Coord
  | .R => p.translate 4 0
  | .U => p.translate 0 4

@[reducible] def stepCenter (p : Coord) : Step → Coord
  | .R => p.translate 2 0
  | .U => p.translate 0 2

/-- Centers of the snake tiles before its two endpoint tiles are removed. -/
@[reducible] def pathTileCentersFrom : Coord → Path → List Coord
  | _, [] => []
  | p, step :: rest =>
      stepCenter p step ::
        if rest.isEmpty then []
        else stepEnd p step :: pathTileCentersFrom (stepEnd p step) rest
termination_by _ path => path.length

@[reducible] def pathTileCenters (w : Path) : List Coord :=
  pathTileCentersFrom Coord.origin w

/-- The snake centers together with the additional top tile of the band. -/
@[reducible] def bandTileCenters (w : Path) : List Coord :=
  let centers := pathTileCenters w
  match centers.getLast? with
  | none => []
  | some last => centers ++ [last.translate 0 2]

@[reducible] def lowerLeft (c : Coord) : Coord := c.translate (-1) (-1)
@[reducible] def lowerRight (c : Coord) : Coord := c.translate 1 (-1)
@[reducible] def upperRight (c : Coord) : Coord := c.translate 1 1
@[reducible] def upperLeft (c : Coord) : Coord := c.translate (-1) 1

@[reducible] def squareEdges (c : Coord) : List (Coord × Coord) :=
  [(lowerLeft c, lowerRight c),
   (lowerRight c, upperRight c),
   (upperRight c, upperLeft c),
   (upperLeft c, lowerLeft c)]

/-- Collapse the two right endpoints of the final tile onto the corresponding
left endpoints of the first tile. -/
@[reducible] def gluePoint (first last p : Coord) : Coord :=
  if p = lowerRight last then lowerLeft first
  else if p = upperRight last then upperLeft first
  else p

@[reducible] def gluedBandEdges (w : Path) : List (Coord × Coord) :=
  match bandTileCenters w with
  | [] => []
  | first :: rest =>
      let centers := first :: rest
      let last := centers.getLast (by simp)
      (centers.flatMap squareEdges).map fun edge =>
        (gluePoint first last edge.1, gluePoint first last edge.2)

end LatticePathOrdersKernel
