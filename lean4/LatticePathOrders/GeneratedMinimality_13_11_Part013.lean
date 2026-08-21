import LatticePathOrders.GeneratedMinimality_13_11_Part013_Region0052
import LatticePathOrders.GeneratedMinimality_13_11_Part013_Region0053
import LatticePathOrders.GeneratedMinimality_13_11_Part013_Region0054
import LatticePathOrders.GeneratedMinimality_13_11_Part013_Region0055

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_13_11

def regionsPart013 : List (Path × Nat × AssignmentTree) := [
  (mustParsePath "RRRRRRRRUUURRUU", 9, region_0052),
  (mustParsePath "RRRRRRRRUUURURR", 9, region_0053),
  (mustParsePath "RRRRRRRRUUURURU", 9, region_0054),
  (mustParsePath "RRRRRRRRUUURUUR", 9, region_0055)
]

theorem regionsPart013_valid : ∀ region ∈ regionsPart013,
    region.1.length + region.2.1 = 24 ∧
      region.2.2.check 13 11 classes region.2.1 region.1 = true := by
  intro region h
  simp only [regionsPart013, List.mem_cons, List.mem_nil_iff, or_false] at h
  rcases h with rfl | rfl | rfl | rfl
  · exact ⟨by decide, region_0052_check⟩
  · exact ⟨by decide, region_0053_check⟩
  · exact ⟨by decide, region_0054_check⟩
  · exact ⟨by decide, region_0055_check⟩

end LatticePathOrders.GeneratedMinimality_13_11

