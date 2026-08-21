import LatticePathOrdersKernel.Problem63GraphRightRawEdges

namespace LatticePathOrdersKernel

set_option maxRecDepth 100000
set_option maxHeartbeats 0

theorem problem63Right_glued_edges_eq_raw :
    gluedBandEdges problem63Right = problem63RightRawEdges := by
  decide

end LatticePathOrdersKernel
