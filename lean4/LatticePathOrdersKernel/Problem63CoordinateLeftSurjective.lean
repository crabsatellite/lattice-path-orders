import LatticePathOrdersKernel.Problem63CoordinateLeftComplete

namespace LatticePathOrdersKernel

open LatticePathOrdersClassical

set_option maxRecDepth 100000
set_option maxHeartbeats 0

theorem problem63Left_coordinate_surjective_list :
    (tableVertices problem63LeftAlgorithmTable).Forall fun point =>
      ∃ raw : RawBandCorner 26,
        gluedRawCoordinate problem63Left raw = point := by
  decide

end LatticePathOrdersKernel
