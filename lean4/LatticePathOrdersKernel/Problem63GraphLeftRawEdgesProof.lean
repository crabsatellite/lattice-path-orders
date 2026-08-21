import LatticePathOrdersKernel.Problem63GraphLeftRawEdges

namespace LatticePathOrdersKernel

set_option maxRecDepth 100000
set_option maxHeartbeats 0

theorem problem63Left_glued_edges_eq_raw :
    gluedBandEdges problem63Left = problem63LeftRawEdges := by
  decide

end LatticePathOrdersKernel
