import LatticePathOrders.GeneratedMinimality_10_9_Part020_Region0080
import LatticePathOrders.GeneratedMinimality_10_9_Part020_Region0081
import LatticePathOrders.GeneratedMinimality_10_9_Part020_Region0082
import LatticePathOrders.GeneratedMinimality_10_9_Part020_Region0083

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_10_9

def regionsPart020 : List (Path × Nat × AssignmentTree) := [
  (mustParsePath "RRRUURURRR", 9, region_0080),
  (mustParsePath "RRRUURURRU", 9, region_0081),
  (mustParsePath "RRRUURURU", 10, region_0082),
  (mustParsePath "RRURRRRRR", 10, region_0083)
]

theorem regionsPart020_valid : ∀ region ∈ regionsPart020,
    region.1.length + region.2.1 = 19 ∧
      region.2.2.check 10 9 classes region.2.1 region.1 = true := by
  intro region h
  simp only [regionsPart020, List.mem_cons, List.mem_nil_iff, or_false] at h
  rcases h with rfl | rfl | rfl | rfl
  · exact ⟨by decide, region_0080_check⟩
  · exact ⟨by decide, region_0081_check⟩
  · exact ⟨by decide, region_0082_check⟩
  · exact ⟨by decide, region_0083_check⟩

end LatticePathOrders.GeneratedMinimality_10_9

