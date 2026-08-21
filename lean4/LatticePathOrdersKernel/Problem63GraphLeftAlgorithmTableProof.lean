import LatticePathOrdersKernel.Problem63GraphLeftAlgorithmTable

namespace LatticePathOrdersKernel

set_option maxRecDepth 100000
set_option maxHeartbeats 0

theorem problem63Left_literal_table_eq_explicit :
    literalBandTable problem63Left = problem63LeftAlgorithmTable := by
  unfold literalBandTable
  rw [problem63Left_glued_edges_eq_raw]
  decide

end LatticePathOrdersKernel
