import LatticePathOrders.GeneratedMinimality_13_11_Part599_Region2396
import LatticePathOrders.GeneratedMinimality_13_11_Part599_Region2397
import LatticePathOrders.GeneratedMinimality_13_11_Part599_Region2398
import LatticePathOrders.GeneratedMinimality_13_11_Part599_Region2399

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_13_11

def regionsPart599 : List (Path × Nat × AssignmentTree) := [
  (mustParsePath "RRURURRRUURRRRU", 9, region_2396),
  (mustParsePath "RRURURRRUURRRUR", 9, region_2397),
  (mustParsePath "RRURURRRUURRRUU", 9, region_2398),
  (mustParsePath "RRURURRRUURRURR", 9, region_2399)
]

theorem regionsPart599_valid : ∀ region ∈ regionsPart599,
    region.1.length + region.2.1 = 24 ∧
      region.2.2.check 13 11 classes region.2.1 region.1 = true := by
  intro region h
  simp only [regionsPart599, List.mem_cons, List.mem_nil_iff, or_false] at h
  rcases h with rfl | rfl | rfl | rfl
  · exact ⟨by decide, region_2396_check⟩
  · exact ⟨by decide, region_2397_check⟩
  · exact ⟨by decide, region_2398_check⟩
  · exact ⟨by decide, region_2399_check⟩

end LatticePathOrders.GeneratedMinimality_13_11

