import LatticePathOrders.GeneratedMinimality_11_10_Part029_Region0116
import LatticePathOrders.GeneratedMinimality_11_10_Part029_Region0117
import LatticePathOrders.GeneratedMinimality_11_10_Part029_Region0118
import LatticePathOrders.GeneratedMinimality_11_10_Part029_Region0119

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_11_10

def regionsPart029 : List (Path × Nat × AssignmentTree) := [
  (mustParsePath "RRRRURURRRUR", 9, region_0116),
  (mustParsePath "RRRRURURRRUU", 9, region_0117),
  (mustParsePath "RRRRURURRURR", 9, region_0118),
  (mustParsePath "RRRRURURRURU", 9, region_0119)
]

theorem regionsPart029_valid : ∀ region ∈ regionsPart029,
    region.1.length + region.2.1 = 21 ∧
      region.2.2.check 11 10 classes region.2.1 region.1 = true := by
  intro region h
  simp only [regionsPart029, List.mem_cons, List.mem_nil_iff, or_false] at h
  rcases h with rfl | rfl | rfl | rfl
  · exact ⟨by decide, region_0116_check⟩
  · exact ⟨by decide, region_0117_check⟩
  · exact ⟨by decide, region_0118_check⟩
  · exact ⟨by decide, region_0119_check⟩

end LatticePathOrders.GeneratedMinimality_11_10

