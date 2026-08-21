import LatticePathOrdersKernel.Problem63CoordinateLeftLocal

namespace LatticePathOrdersKernel

open LatticePathOrdersClassical

set_option maxRecDepth 100000
set_option maxHeartbeats 0

theorem problem63Left_coordinate_complete :
    ∀ left right : RawBandCorner 26,
      gluedRawCoordinate problem63Left left =
          gluedRawCoordinate problem63Left right →
        RawGlueConnectedTwo (pathDirections 26 problem63Left) left right := by
  decide

end LatticePathOrdersKernel
