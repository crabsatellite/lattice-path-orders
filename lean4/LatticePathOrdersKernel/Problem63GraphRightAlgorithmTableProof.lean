import LatticePathOrdersKernel.Problem63GraphRightAlgorithmTable
import LatticePathOrdersKernel.Problem63GraphRightRawEdgesProof

namespace LatticePathOrdersKernel

set_option maxRecDepth 100000
set_option maxHeartbeats 0

theorem problem63Right_literal_table_eq_explicit :
    literalBandTable problem63Right = problem63RightAlgorithmTable := by
  unfold literalBandTable
  rw [problem63Right_glued_edges_eq_raw]
  decide

end LatticePathOrdersKernel
