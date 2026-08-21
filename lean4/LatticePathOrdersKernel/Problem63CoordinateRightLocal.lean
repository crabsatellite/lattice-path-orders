import LatticePathOrdersKernel.BandCoordinateQuotient
import LatticePathOrdersKernel.Problem63GraphRightTableValid

namespace LatticePathOrdersKernel

open LatticePathOrdersClassical

set_option maxRecDepth 100000
set_option maxHeartbeats 0

theorem problem63Right_coordinate_raw_vertex :
    ∀ raw : RawBandCorner 26,
      gluedRawCoordinate problem63Right raw ∈
        tableVertices problem63RightAlgorithmTable := by
  decide

theorem problem63Right_coordinate_glue_forward :
    ∀ tile : BandTile 26, ∀ endpoint : Bool,
      gluedRawCoordinate problem63Right
          ⟨tile, outgoingCorner
            (outgoingDirection (pathDirections 26 problem63Right) tile)
            endpoint⟩ =
        gluedRawCoordinate problem63Right
          ⟨tile.successor, incomingCorner
            (outgoingDirection (pathDirections 26 problem63Right) tile)
            endpoint⟩ := by
  decide

theorem problem63Right_coordinate_glue_preserves :
    ∀ left right : RawBandCorner 26,
      GlueRel (pathDirections 26 problem63Right) left right →
        gluedRawCoordinate problem63Right left =
          gluedRawCoordinate problem63Right right := by
  intro left right h
  rcases h with ⟨tile, endpoint, hdirect | hreversed⟩
  · rw [hdirect.1, hdirect.2]
    exact problem63Right_coordinate_glue_forward tile endpoint
  · rw [hreversed.1, hreversed.2]
    exact (problem63Right_coordinate_glue_forward tile endpoint).symm

end LatticePathOrdersKernel
