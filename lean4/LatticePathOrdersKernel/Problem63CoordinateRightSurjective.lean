import LatticePathOrdersKernel.Problem63CoordinateRightComplete

namespace LatticePathOrdersKernel

open LatticePathOrdersClassical

set_option maxRecDepth 100000
set_option maxHeartbeats 0

theorem problem63Right_coordinate_surjective_list :
    (tableVertices problem63RightAlgorithmTable).Forall fun point =>
      ∃ raw : RawBandCorner 26,
        gluedRawCoordinate problem63Right raw = point := by
  decide

end LatticePathOrdersKernel
