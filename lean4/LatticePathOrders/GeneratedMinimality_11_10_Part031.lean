import LatticePathOrders.GeneratedMinimality_11_10_Part031_Region0124
import LatticePathOrders.GeneratedMinimality_11_10_Part031_Region0125
import LatticePathOrders.GeneratedMinimality_11_10_Part031_Region0126
import LatticePathOrders.GeneratedMinimality_11_10_Part031_Region0127

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_11_10

def regionsPart031 : List (Path × Nat × AssignmentTree) := [
  (mustParsePath "RRRRURURURUR", 9, region_0124),
  (mustParsePath "RRRRURURURUU", 9, region_0125),
  (mustParsePath "RRRRURURUURR", 9, region_0126),
  (mustParsePath "RRRRURURUURU", 9, region_0127)
]

theorem regionsPart031_valid : ∀ region ∈ regionsPart031,
    region.1.length + region.2.1 = 21 ∧
      region.2.2.check 11 10 classes region.2.1 region.1 = true := by
  intro region h
  simp only [regionsPart031, List.mem_cons, List.mem_nil_iff, or_false] at h
  rcases h with rfl | rfl | rfl | rfl
  · exact ⟨by decide, region_0124_check⟩
  · exact ⟨by decide, region_0125_check⟩
  · exact ⟨by decide, region_0126_check⟩
  · exact ⟨by decide, region_0127_check⟩

end LatticePathOrders.GeneratedMinimality_11_10

