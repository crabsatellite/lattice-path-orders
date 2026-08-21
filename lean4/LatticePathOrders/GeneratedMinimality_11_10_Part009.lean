import LatticePathOrders.GeneratedMinimality_11_10_Part009_Region0036
import LatticePathOrders.GeneratedMinimality_11_10_Part009_Region0037
import LatticePathOrders.GeneratedMinimality_11_10_Part009_Region0038
import LatticePathOrders.GeneratedMinimality_11_10_Part009_Region0039

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_11_10

def regionsPart009 : List (Path × Nat × AssignmentTree) := [
  (mustParsePath "RRRRRRUUURUR", 9, region_0036),
  (mustParsePath "RRRRRRUUURUU", 9, region_0037),
  (mustParsePath "RRRRRRUUUURR", 9, region_0038),
  (mustParsePath "RRRRRRUUUURU", 9, region_0039)
]

theorem regionsPart009_valid : ∀ region ∈ regionsPart009,
    region.1.length + region.2.1 = 21 ∧
      region.2.2.check 11 10 classes region.2.1 region.1 = true := by
  intro region h
  simp only [regionsPart009, List.mem_cons, List.mem_nil_iff, or_false] at h
  rcases h with rfl | rfl | rfl | rfl
  · exact ⟨by decide, region_0036_check⟩
  · exact ⟨by decide, region_0037_check⟩
  · exact ⟨by decide, region_0038_check⟩
  · exact ⟨by decide, region_0039_check⟩

end LatticePathOrders.GeneratedMinimality_11_10

