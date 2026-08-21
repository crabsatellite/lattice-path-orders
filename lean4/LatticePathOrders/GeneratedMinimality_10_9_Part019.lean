import LatticePathOrders.GeneratedMinimality_10_9_Part019_Region0076
import LatticePathOrders.GeneratedMinimality_10_9_Part019_Region0077
import LatticePathOrders.GeneratedMinimality_10_9_Part019_Region0078
import LatticePathOrders.GeneratedMinimality_10_9_Part019_Region0079

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_10_9

def regionsPart019 : List (Path × Nat × AssignmentTree) := [
  (mustParsePath "RRRUURRRUU", 9, region_0076),
  (mustParsePath "RRRUURRURR", 9, region_0077),
  (mustParsePath "RRRUURRURU", 9, region_0078),
  (mustParsePath "RRRUURRUU", 10, region_0079)
]

theorem regionsPart019_valid : ∀ region ∈ regionsPart019,
    region.1.length + region.2.1 = 19 ∧
      region.2.2.check 10 9 classes region.2.1 region.1 = true := by
  intro region h
  simp only [regionsPart019, List.mem_cons, List.mem_nil_iff, or_false] at h
  rcases h with rfl | rfl | rfl | rfl
  · exact ⟨by decide, region_0076_check⟩
  · exact ⟨by decide, region_0077_check⟩
  · exact ⟨by decide, region_0078_check⟩
  · exact ⟨by decide, region_0079_check⟩

end LatticePathOrders.GeneratedMinimality_10_9

