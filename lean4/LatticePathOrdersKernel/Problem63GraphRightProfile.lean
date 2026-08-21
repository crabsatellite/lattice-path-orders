import LatticePathOrdersKernel.Problem63GraphRightTableValid
import LatticePathOrdersKernel.ListBandGraphIso

namespace LatticePathOrdersKernel

set_option maxRecDepth 100000
set_option maxHeartbeats 0

def problem63RightProfileWitness : Coord := { x := 5, y := -1 }

theorem problem63Right_profile_witness_mem :
    problem63RightProfileWitness ∈ tableVertices problem63RightAlgorithmTable := by
  decide

theorem problem63Right_profile_witness_value :
    tableDegreeWalkCount problem63RightAlgorithmTable 2 4
      problem63RightProfileWitness = 4 := by
  decide

theorem problem63Right_has_profile_four :
    HasDegreeWalkProfile (literalBandTable problem63Right) 2 4 4 := by
  rw [problem63Right_literal_table_eq_explicit]
  exact ⟨problem63RightProfileWitness,
    problem63Right_profile_witness_mem,
    problem63Right_profile_witness_value⟩

end LatticePathOrdersKernel
