import LatticePathOrdersKernel.PathBand
import LatticePathOrdersKernel.TableGraphIso

/-!
# Coordinate presentation of the cyclic square-band quotient

The quotient construction and the literal coordinate construction use the
same ordered list of `2n` squares.  The definitions below expose the exact map
from every raw square corner to its glued coordinate.  A finite certificate
records the four elementary facts needed to descend that map through the
quotient; it does not state or assume any graph isomorphism.
-/

namespace LatticePathOrdersKernel

open LatticePathOrders
open LatticePathOrdersClassical

@[reducible] def indexedBandTileCenter {n : Nat}
    (word : Path) : BandTile n → Coord
  | .midpoint i => (bandTileCenters word)[2 * i.val]?.getD Coord.origin
  | .vertex i => (bandTileCenters word)[2 * i.val + 1]?.getD Coord.origin

@[reducible] def indexedCornerCoordinate (center : Coord)
    (corner : CornerIndex) : Coord :=
  if corner = cornerZero then lowerLeft center
  else if corner = cornerOne then lowerRight center
  else if corner = cornerTwo then upperRight center
  else upperLeft center

@[reducible] def ungluedRawCoordinate {n : Nat}
    (word : Path) (corner : RawBandCorner n) : Coord :=
  indexedCornerCoordinate (indexedBandTileCenter word corner.tile)
    corner.corner

@[reducible] def closeBandCoordinate (word : Path) (point : Coord) : Coord :=
  match bandTileCenters word with
  | [] => point
  | first :: rest =>
      match (first :: rest).getLast? with
      | none => point
      | some last => gluePoint first last point

@[reducible] def gluedRawCoordinate {n : Nat}
    (word : Path) (corner : RawBandCorner n) : Coord :=
  closeBandCoordinate word (ungluedRawCoordinate word corner)

def RawBandSide {n : Nat} :
    RawBandCorner n → RawBandCorner n → Prop :=
  fun left right =>
    ∃ tile corner,
      (left = ⟨tile, corner⟩ ∧
        right = ⟨tile, cornerSuccessor corner⟩) ∨
      (right = ⟨tile, corner⟩ ∧
        left = ⟨tile, cornerSuccessor corner⟩)

instance rawBandSideDecidable {n : Nat} [NeZero n]
    (left right : RawBandCorner n) : Decidable (RawBandSide left right) := by
  unfold RawBandSide
  infer_instance

/-- For a square snake, every glued corner class has a representative chain
of length at most two.  Keeping this bounded relation separate makes the
problem-specific certificate a finite Boolean computation. -/
def RawGlueConnectedTwo {n : Nat} (steps : ZMod n → Direction)
    (left right : RawBandCorner n) : Prop :=
  left = right ∨ GlueRel steps left right ∨
    ∃ middle, GlueRel steps left middle ∧ GlueRel steps middle right

instance rawGlueConnectedTwoDecidable {n : Nat} [NeZero n]
    (steps : ZMod n → Direction) (left right : RawBandCorner n) :
    Decidable (RawGlueConnectedTwo steps left right) := by
  unfold RawGlueConnectedTwo
  infer_instance

def TableCoordinateSide {n : Nat} (word : Path)
    (left right : Coord) : Prop :=
  ∃ tile : BandTile n, ∃ corner : CornerIndex,
    (gluedRawCoordinate word ⟨tile, corner⟩ = left ∧
      gluedRawCoordinate word ⟨tile, cornerSuccessor corner⟩ = right) ∨
    (gluedRawCoordinate word ⟨tile, cornerSuccessor corner⟩ = left ∧
      gluedRawCoordinate word ⟨tile, corner⟩ = right)

instance tableCoordinateSideDecidable {n : Nat} [NeZero n]
    (word : Path) (left right : Coord) :
    Decidable (TableCoordinateSide (n := n) word left right) := by
  unfold TableCoordinateSide
  infer_instance

/-- Finite, directly checkable presentation data.  These fields say exactly
that coordinates quotient the raw corners by the published edge gluings and
that square sides are exactly the adjacency-list edges. -/
structure BandCoordinateCertificate (n : Nat) [NeZero n]
    (word : Path) (table : NeighborTable) where
  raw_vertex : ∀ raw : RawBandCorner n,
    gluedRawCoordinate word raw ∈ tableVertices table
  glue_preserves : ∀ left right : RawBandCorner n,
    GlueRel (pathDirections n word) left right →
      gluedRawCoordinate word left = gluedRawCoordinate word right
  coordinate_complete : ∀ left right : RawBandCorner n,
    gluedRawCoordinate word left = gluedRawCoordinate word right →
      RawGlueConnectedTwo (pathDirections n word) left right
  raw_surjective : ∀ point : Coord, point ∈ tableVertices table →
    ∃ raw : RawBandCorner n, gluedRawCoordinate word raw = point
  side_forward : ∀ tile : BandTile n, ∀ corner : CornerIndex,
    gluedRawCoordinate word ⟨tile, cornerSuccessor corner⟩ ∈
      tableNeighbors table (gluedRawCoordinate word ⟨tile, corner⟩)
  side_reverse : ∀ tile : BandTile n, ∀ corner : CornerIndex,
    gluedRawCoordinate word ⟨tile, corner⟩ ∈
      tableNeighbors table
        (gluedRawCoordinate word ⟨tile, cornerSuccessor corner⟩)
  edge_complete : table.Forall fun row =>
    row.2.Forall fun right =>
      TableCoordinateSide (n := n) word row.1 right
  valid : ValidNeighborTable table

end LatticePathOrdersKernel
