import LatticePathOrders.GeneratedMinimality_11_8_Part001_Region0004
import LatticePathOrders.GeneratedMinimality_11_8_Part001_Region0005
import LatticePathOrders.GeneratedMinimality_11_8_Part001_Region0006
import LatticePathOrders.GeneratedMinimality_11_8_Part001_Region0007

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_11_8

def regionsPart001 : List (Path × Nat × AssignmentTree) := [
  (mustParsePath "RRRRRRRURU", 9, region_0004),
  (mustParsePath "RRRRRRRUUR", 9, region_0005),
  (mustParsePath "RRRRRRRUUU", 9, region_0006),
  (mustParsePath "RRRRRRURRR", 9, region_0007)
]

theorem regionsPart001_valid : ∀ region ∈ regionsPart001,
    region.1.length + region.2.1 = 19 ∧
      region.2.2.check 11 8 classes region.2.1 region.1 = true := by
  intro region h
  simp only [regionsPart001, List.mem_cons, List.mem_nil_iff, or_false] at h
  rcases h with rfl | rfl | rfl | rfl
  · exact ⟨by decide, region_0004_check⟩
  · exact ⟨by decide, region_0005_check⟩
  · exact ⟨by decide, region_0006_check⟩
  · exact ⟨by decide, region_0007_check⟩

end LatticePathOrders.GeneratedMinimality_11_8

