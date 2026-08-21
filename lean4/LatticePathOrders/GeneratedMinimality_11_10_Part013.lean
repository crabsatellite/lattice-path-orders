import LatticePathOrders.GeneratedMinimality_11_10_Part013_Region0052
import LatticePathOrders.GeneratedMinimality_11_10_Part013_Region0053
import LatticePathOrders.GeneratedMinimality_11_10_Part013_Region0054
import LatticePathOrders.GeneratedMinimality_11_10_Part013_Region0055

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_11_10

def regionsPart013 : List (Path × Nat × AssignmentTree) := [
  (mustParsePath "RRRRRURURRR", 10, region_0052),
  (mustParsePath "RRRRRURURRUR", 9, region_0053),
  (mustParsePath "RRRRRURURRUU", 9, region_0054),
  (mustParsePath "RRRRRURURURR", 9, region_0055)
]

theorem regionsPart013_valid : ∀ region ∈ regionsPart013,
    region.1.length + region.2.1 = 21 ∧
      region.2.2.check 11 10 classes region.2.1 region.1 = true := by
  intro region h
  simp only [regionsPart013, List.mem_cons, List.mem_nil_iff, or_false] at h
  rcases h with rfl | rfl | rfl | rfl
  · exact ⟨by decide, region_0052_check⟩
  · exact ⟨by decide, region_0053_check⟩
  · exact ⟨by decide, region_0054_check⟩
  · exact ⟨by decide, region_0055_check⟩

end LatticePathOrders.GeneratedMinimality_11_10

