import LatticePathOrdersKernel.Problem63GraphLeftTableValid
import LatticePathOrdersKernel.ListBandGraphIso

namespace LatticePathOrdersKernel

set_option maxRecDepth 100000
set_option maxHeartbeats 0

theorem problem63Left_no_profile_four_explicit :
    ∀ u ∈ tableVertices problem63LeftAlgorithmTable,
      tableDegreeWalkCount problem63LeftAlgorithmTable 2 4 u ≠ 4 := by
  decide

theorem problem63Left_no_profile_four :
    ¬ HasDegreeWalkProfile (literalBandTable problem63Left) 2 4 4 := by
  rw [problem63Left_literal_table_eq_explicit]
  rintro ⟨u, hu, hvalue⟩
  exact problem63Left_no_profile_four_explicit u hu hvalue

end LatticePathOrdersKernel
