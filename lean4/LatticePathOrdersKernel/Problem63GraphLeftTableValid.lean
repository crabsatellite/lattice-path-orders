import LatticePathOrdersKernel.Problem63GraphLeftAlgorithmTableProof

namespace LatticePathOrdersKernel

set_option maxRecDepth 100000

theorem problem63Left_explicit_table_valid :
    ValidNeighborTable problem63LeftAlgorithmTable := by
  decide

theorem problem63Left_literal_table_valid :
    ValidNeighborTable (literalBandTable problem63Left) := by
  rw [problem63Left_literal_table_eq_explicit]
  exact problem63Left_explicit_table_valid

end LatticePathOrdersKernel
