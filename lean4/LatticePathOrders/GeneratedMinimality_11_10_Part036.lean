import LatticePathOrders.GeneratedMinimality_11_10_Part036_Region0144
import LatticePathOrders.GeneratedMinimality_11_10_Part036_Region0145
import LatticePathOrders.GeneratedMinimality_11_10_Part036_Region0146
import LatticePathOrders.GeneratedMinimality_11_10_Part036_Region0147

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_11_10

def regionsPart036 : List (Path × Nat × AssignmentTree) := [
  (mustParsePath "RRRRUURRRUUR", 9, region_0144),
  (mustParsePath "RRRRUURRRUUU", 9, region_0145),
  (mustParsePath "RRRRUURRURRR", 9, region_0146),
  (mustParsePath "RRRRUURRURRU", 9, region_0147)
]

theorem regionsPart036_valid : ∀ region ∈ regionsPart036,
    region.1.length + region.2.1 = 21 ∧
      region.2.2.check 11 10 classes region.2.1 region.1 = true := by
  intro region h
  simp only [regionsPart036, List.mem_cons, List.mem_nil_iff, or_false] at h
  rcases h with rfl | rfl | rfl | rfl
  · exact ⟨by decide, region_0144_check⟩
  · exact ⟨by decide, region_0145_check⟩
  · exact ⟨by decide, region_0146_check⟩
  · exact ⟨by decide, region_0147_check⟩

end LatticePathOrders.GeneratedMinimality_11_10

