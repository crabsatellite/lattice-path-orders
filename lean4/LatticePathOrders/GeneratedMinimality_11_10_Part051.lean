import LatticePathOrders.GeneratedMinimality_11_10_Part051_Region0204
import LatticePathOrders.GeneratedMinimality_11_10_Part051_Region0205
import LatticePathOrders.GeneratedMinimality_11_10_Part051_Region0206
import LatticePathOrders.GeneratedMinimality_11_10_Part051_Region0207

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_11_10

def regionsPart051 : List (Path × Nat × AssignmentTree) := [
  (mustParsePath "RRRURRURRUUU", 9, region_0204),
  (mustParsePath "RRRURRURURRR", 9, region_0205),
  (mustParsePath "RRRURRURURRU", 9, region_0206),
  (mustParsePath "RRRURRURURUR", 9, region_0207)
]

theorem regionsPart051_valid : ∀ region ∈ regionsPart051,
    region.1.length + region.2.1 = 21 ∧
      region.2.2.check 11 10 classes region.2.1 region.1 = true := by
  intro region h
  simp only [regionsPart051, List.mem_cons, List.mem_nil_iff, or_false] at h
  rcases h with rfl | rfl | rfl | rfl
  · exact ⟨by decide, region_0204_check⟩
  · exact ⟨by decide, region_0205_check⟩
  · exact ⟨by decide, region_0206_check⟩
  · exact ⟨by decide, region_0207_check⟩

end LatticePathOrders.GeneratedMinimality_11_10

