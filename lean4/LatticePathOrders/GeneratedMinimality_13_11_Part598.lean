import LatticePathOrders.GeneratedMinimality_13_11_Part598_Region2392
import LatticePathOrders.GeneratedMinimality_13_11_Part598_Region2393
import LatticePathOrders.GeneratedMinimality_13_11_Part598_Region2394
import LatticePathOrders.GeneratedMinimality_13_11_Part598_Region2395

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_13_11

def regionsPart598 : List (Path × Nat × AssignmentTree) := [
  (mustParsePath "RRURURRRURUURRR", 9, region_2392),
  (mustParsePath "RRURURRRURUURRU", 9, region_2393),
  (mustParsePath "RRURURRRURUURU", 10, region_2394),
  (mustParsePath "RRURURRRUURRRRR", 9, region_2395)
]

theorem regionsPart598_valid : ∀ region ∈ regionsPart598,
    region.1.length + region.2.1 = 24 ∧
      region.2.2.check 13 11 classes region.2.1 region.1 = true := by
  intro region h
  simp only [regionsPart598, List.mem_cons, List.mem_nil_iff, or_false] at h
  rcases h with rfl | rfl | rfl | rfl
  · exact ⟨by decide, region_2392_check⟩
  · exact ⟨by decide, region_2393_check⟩
  · exact ⟨by decide, region_2394_check⟩
  · exact ⟨by decide, region_2395_check⟩

end LatticePathOrders.GeneratedMinimality_13_11

