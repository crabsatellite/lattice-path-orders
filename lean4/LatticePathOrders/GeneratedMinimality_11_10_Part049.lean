import LatticePathOrders.GeneratedMinimality_11_10_Part049_Region0196
import LatticePathOrders.GeneratedMinimality_11_10_Part049_Region0197
import LatticePathOrders.GeneratedMinimality_11_10_Part049_Region0198
import LatticePathOrders.GeneratedMinimality_11_10_Part049_Region0199

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_11_10

def regionsPart049 : List (Path × Nat × AssignmentTree) := [
  (mustParsePath "RRRURRRUUURU", 9, region_0196),
  (mustParsePath "RRRURRRUUUU", 10, region_0197),
  (mustParsePath "RRRURRURRRR", 10, region_0198),
  (mustParsePath "RRRURRURRRUR", 9, region_0199)
]

theorem regionsPart049_valid : ∀ region ∈ regionsPart049,
    region.1.length + region.2.1 = 21 ∧
      region.2.2.check 11 10 classes region.2.1 region.1 = true := by
  intro region h
  simp only [regionsPart049, List.mem_cons, List.mem_nil_iff, or_false] at h
  rcases h with rfl | rfl | rfl | rfl
  · exact ⟨by decide, region_0196_check⟩
  · exact ⟨by decide, region_0197_check⟩
  · exact ⟨by decide, region_0198_check⟩
  · exact ⟨by decide, region_0199_check⟩

end LatticePathOrders.GeneratedMinimality_11_10

