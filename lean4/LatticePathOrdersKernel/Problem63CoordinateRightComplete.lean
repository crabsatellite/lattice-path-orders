import LatticePathOrdersKernel.Problem63CoordinateRightLocal

namespace LatticePathOrdersKernel

open LatticePathOrdersClassical

set_option maxRecDepth 100000
set_option maxHeartbeats 0

theorem problem63Right_coordinate_complete :
    ∀ left right : RawBandCorner 26,
      gluedRawCoordinate problem63Right left =
          gluedRawCoordinate problem63Right right →
        RawGlueConnectedTwo (pathDirections 26 problem63Right) left right := by
  decide

end LatticePathOrdersKernel
