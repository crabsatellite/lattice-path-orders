import LatticePathOrdersKernel.BandCoordinateQuotient
import LatticePathOrdersKernel.Problem63GraphLeftTableValid

namespace LatticePathOrdersKernel

open LatticePathOrdersClassical

set_option maxRecDepth 100000
set_option maxHeartbeats 0

theorem problem63Left_coordinate_raw_vertex :
    ∀ raw : RawBandCorner 26,
      gluedRawCoordinate problem63Left raw ∈
        tableVertices problem63LeftAlgorithmTable := by
  decide

theorem problem63Left_coordinate_glue_forward :
    ∀ tile : BandTile 26, ∀ endpoint : Bool,
      gluedRawCoordinate problem63Left
          ⟨tile, outgoingCorner
            (outgoingDirection (pathDirections 26 problem63Left) tile)
            endpoint⟩ =
        gluedRawCoordinate problem63Left
          ⟨tile.successor, incomingCorner
            (outgoingDirection (pathDirections 26 problem63Left) tile)
            endpoint⟩ := by
  decide

theorem problem63Left_coordinate_glue_preserves :
    ∀ left right : RawBandCorner 26,
      GlueRel (pathDirections 26 problem63Left) left right →
        gluedRawCoordinate problem63Left left =
          gluedRawCoordinate problem63Left right := by
  intro left right h
  rcases h with ⟨tile, endpoint, hdirect | hreversed⟩
  · rw [hdirect.1, hdirect.2]
    exact problem63Left_coordinate_glue_forward tile endpoint
  · rw [hreversed.1, hreversed.2]
    exact (problem63Left_coordinate_glue_forward tile endpoint).symm

end LatticePathOrdersKernel
