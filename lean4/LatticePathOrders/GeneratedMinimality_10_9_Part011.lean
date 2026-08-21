import LatticePathOrders.GeneratedMinimality_10_9_Part011_Region0044
import LatticePathOrders.GeneratedMinimality_10_9_Part011_Region0045
import LatticePathOrders.GeneratedMinimality_10_9_Part011_Region0046
import LatticePathOrders.GeneratedMinimality_10_9_Part011_Region0047

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_10_9

def regionsPart011 : List (Path × Nat × AssignmentTree) := [
  (mustParsePath "RRRRUURURU", 9, region_0044),
  (mustParsePath "RRRRUURUU", 10, region_0045),
  (mustParsePath "RRRRUUURRR", 9, region_0046),
  (mustParsePath "RRRRUUURRU", 9, region_0047)
]

theorem regionsPart011_valid : ∀ region ∈ regionsPart011,
    region.1.length + region.2.1 = 19 ∧
      region.2.2.check 10 9 classes region.2.1 region.1 = true := by
  intro region h
  simp only [regionsPart011, List.mem_cons, List.mem_nil_iff, or_false] at h
  rcases h with rfl | rfl | rfl | rfl
  · exact ⟨by decide, region_0044_check⟩
  · exact ⟨by decide, region_0045_check⟩
  · exact ⟨by decide, region_0046_check⟩
  · exact ⟨by decide, region_0047_check⟩

end LatticePathOrders.GeneratedMinimality_10_9

