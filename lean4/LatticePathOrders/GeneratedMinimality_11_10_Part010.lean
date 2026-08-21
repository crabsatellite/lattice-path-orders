import LatticePathOrders.GeneratedMinimality_11_10_Part010_Region0040
import LatticePathOrders.GeneratedMinimality_11_10_Part010_Region0041
import LatticePathOrders.GeneratedMinimality_11_10_Part010_Region0042
import LatticePathOrders.GeneratedMinimality_11_10_Part010_Region0043

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_11_10

def regionsPart010 : List (Path × Nat × AssignmentTree) := [
  (mustParsePath "RRRRRRUUUUU", 10, region_0040),
  (mustParsePath "RRRRRURRRR", 11, region_0041),
  (mustParsePath "RRRRRURRRUR", 10, region_0042),
  (mustParsePath "RRRRRURRRUUR", 9, region_0043)
]

theorem regionsPart010_valid : ∀ region ∈ regionsPart010,
    region.1.length + region.2.1 = 21 ∧
      region.2.2.check 11 10 classes region.2.1 region.1 = true := by
  intro region h
  simp only [regionsPart010, List.mem_cons, List.mem_nil_iff, or_false] at h
  rcases h with rfl | rfl | rfl | rfl
  · exact ⟨by decide, region_0040_check⟩
  · exact ⟨by decide, region_0041_check⟩
  · exact ⟨by decide, region_0042_check⟩
  · exact ⟨by decide, region_0043_check⟩

end LatticePathOrders.GeneratedMinimality_11_10

