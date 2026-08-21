import LatticePathOrdersKernel.Problem63GraphRightAlgorithmTableProof

namespace LatticePathOrdersKernel

set_option maxRecDepth 100000

theorem problem63Right_explicit_table_valid :
    ValidNeighborTable problem63RightAlgorithmTable := by
  decide

theorem problem63Right_literal_table_valid :
    ValidNeighborTable (literalBandTable problem63Right) := by
  rw [problem63Right_literal_table_eq_explicit]
  exact problem63Right_explicit_table_valid

end LatticePathOrdersKernel
