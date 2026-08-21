import LatticePathOrders.GeneratedMinimality_11_10_Part043_Region0172
import LatticePathOrders.GeneratedMinimality_11_10_Part043_Region0173
import LatticePathOrders.GeneratedMinimality_11_10_Part043_Region0174
import LatticePathOrders.GeneratedMinimality_11_10_Part043_Region0175

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_11_10

def regionsPart043 : List (Path × Nat × AssignmentTree) := [
  (mustParsePath "RRRRUUURURU", 10, region_0172),
  (mustParsePath "RRRURRRRRR", 11, region_0173),
  (mustParsePath "RRRURRRRRUR", 10, region_0174),
  (mustParsePath "RRRURRRRRUUR", 9, region_0175)
]

theorem regionsPart043_valid : ∀ region ∈ regionsPart043,
    region.1.length + region.2.1 = 21 ∧
      region.2.2.check 11 10 classes region.2.1 region.1 = true := by
  intro region h
  simp only [regionsPart043, List.mem_cons, List.mem_nil_iff, or_false] at h
  rcases h with rfl | rfl | rfl | rfl
  · exact ⟨by decide, region_0172_check⟩
  · exact ⟨by decide, region_0173_check⟩
  · exact ⟨by decide, region_0174_check⟩
  · exact ⟨by decide, region_0175_check⟩

end LatticePathOrders.GeneratedMinimality_11_10

