import LatticePathOrders.GeneratedMinimality_11_10_Part083_Region0332
import LatticePathOrders.GeneratedMinimality_11_10_Part083_Region0333
import LatticePathOrders.GeneratedMinimality_11_10_Part083_Region0334
import LatticePathOrders.GeneratedMinimality_11_10_Part083_Region0335

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_11_10

def regionsPart083 : List (Path × Nat × AssignmentTree) := [
  (mustParsePath "RRURRRUURRUU", 9, region_0332),
  (mustParsePath "RRURRRUURURR", 9, region_0333),
  (mustParsePath "RRURRRUURURU", 9, region_0334),
  (mustParsePath "RRURRRUURUU", 10, region_0335)
]

theorem regionsPart083_valid : ∀ region ∈ regionsPart083,
    region.1.length + region.2.1 = 21 ∧
      region.2.2.check 11 10 classes region.2.1 region.1 = true := by
  intro region h
  simp only [regionsPart083, List.mem_cons, List.mem_nil_iff, or_false] at h
  rcases h with rfl | rfl | rfl | rfl
  · exact ⟨by decide, region_0332_check⟩
  · exact ⟨by decide, region_0333_check⟩
  · exact ⟨by decide, region_0334_check⟩
  · exact ⟨by decide, region_0335_check⟩

end LatticePathOrders.GeneratedMinimality_11_10

