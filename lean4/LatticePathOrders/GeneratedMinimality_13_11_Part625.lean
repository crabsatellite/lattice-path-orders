import LatticePathOrders.GeneratedMinimality_13_11_Part625_Region2500
import LatticePathOrders.GeneratedMinimality_13_11_Part625_Region2501
import LatticePathOrders.GeneratedMinimality_13_11_Part625_Region2502
import LatticePathOrders.GeneratedMinimality_13_11_Part625_Region2503

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_13_11

def regionsPart625 : List (Path × Nat × AssignmentTree) := [
  (mustParsePath "RRURURURURRRURU", 9, region_2500),
  (mustParsePath "RRURURURURRRUU", 10, region_2501),
  (mustParsePath "RRURURURURRURRR", 9, region_2502),
  (mustParsePath "RRURURURURRURRU", 9, region_2503)
]

theorem regionsPart625_valid : ∀ region ∈ regionsPart625,
    region.1.length + region.2.1 = 24 ∧
      region.2.2.check 13 11 classes region.2.1 region.1 = true := by
  intro region h
  simp only [regionsPart625, List.mem_cons, List.mem_nil_iff, or_false] at h
  rcases h with rfl | rfl | rfl | rfl
  · exact ⟨by decide, region_2500_check⟩
  · exact ⟨by decide, region_2501_check⟩
  · exact ⟨by decide, region_2502_check⟩
  · exact ⟨by decide, region_2503_check⟩

end LatticePathOrders.GeneratedMinimality_13_11

