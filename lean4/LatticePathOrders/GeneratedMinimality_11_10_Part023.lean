import LatticePathOrders.GeneratedMinimality_11_10_Part023_Region0092
import LatticePathOrders.GeneratedMinimality_11_10_Part023_Region0093
import LatticePathOrders.GeneratedMinimality_11_10_Part023_Region0094
import LatticePathOrders.GeneratedMinimality_11_10_Part023_Region0095

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_11_10

def regionsPart023 : List (Path × Nat × AssignmentTree) := [
  (mustParsePath "RRRRURRRRUUR", 9, region_0092),
  (mustParsePath "RRRRURRRRUUU", 9, region_0093),
  (mustParsePath "RRRRURRRURR", 10, region_0094),
  (mustParsePath "RRRRURRRURUR", 9, region_0095)
]

theorem regionsPart023_valid : ∀ region ∈ regionsPart023,
    region.1.length + region.2.1 = 21 ∧
      region.2.2.check 11 10 classes region.2.1 region.1 = true := by
  intro region h
  simp only [regionsPart023, List.mem_cons, List.mem_nil_iff, or_false] at h
  rcases h with rfl | rfl | rfl | rfl
  · exact ⟨by decide, region_0092_check⟩
  · exact ⟨by decide, region_0093_check⟩
  · exact ⟨by decide, region_0094_check⟩
  · exact ⟨by decide, region_0095_check⟩

end LatticePathOrders.GeneratedMinimality_11_10

