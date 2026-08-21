import LatticePathOrders.GeneratedMinimality_13_11_Part610_Region2440
import LatticePathOrders.GeneratedMinimality_13_11_Part610_Region2441
import LatticePathOrders.GeneratedMinimality_13_11_Part610_Region2442
import LatticePathOrders.GeneratedMinimality_13_11_Part610_Region2443

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_13_11

def regionsPart610 : List (Path × Nat × AssignmentTree) := [
  (mustParsePath "RRURURRURURURRU", 9, region_2440),
  (mustParsePath "RRURURRURURURU", 10, region_2441),
  (mustParsePath "RRURURRURUURRRR", 9, region_2442),
  (mustParsePath "RRURURRURUURRRU", 9, region_2443)
]

theorem regionsPart610_valid : ∀ region ∈ regionsPart610,
    region.1.length + region.2.1 = 24 ∧
      region.2.2.check 13 11 classes region.2.1 region.1 = true := by
  intro region h
  simp only [regionsPart610, List.mem_cons, List.mem_nil_iff, or_false] at h
  rcases h with rfl | rfl | rfl | rfl
  · exact ⟨by decide, region_2440_check⟩
  · exact ⟨by decide, region_2441_check⟩
  · exact ⟨by decide, region_2442_check⟩
  · exact ⟨by decide, region_2443_check⟩

end LatticePathOrders.GeneratedMinimality_13_11

