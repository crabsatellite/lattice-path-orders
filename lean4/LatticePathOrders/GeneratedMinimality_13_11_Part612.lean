import LatticePathOrders.GeneratedMinimality_13_11_Part612_Region2448
import LatticePathOrders.GeneratedMinimality_13_11_Part612_Region2449
import LatticePathOrders.GeneratedMinimality_13_11_Part612_Region2450
import LatticePathOrders.GeneratedMinimality_13_11_Part612_Region2451

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_13_11

def regionsPart612 : List (Path × Nat × AssignmentTree) := [
  (mustParsePath "RRURURRUURRRRUU", 9, region_2448),
  (mustParsePath "RRURURRUURRRURR", 9, region_2449),
  (mustParsePath "RRURURRUURRRURU", 9, region_2450),
  (mustParsePath "RRURURRUURRRUU", 10, region_2451)
]

theorem regionsPart612_valid : ∀ region ∈ regionsPart612,
    region.1.length + region.2.1 = 24 ∧
      region.2.2.check 13 11 classes region.2.1 region.1 = true := by
  intro region h
  simp only [regionsPart612, List.mem_cons, List.mem_nil_iff, or_false] at h
  rcases h with rfl | rfl | rfl | rfl
  · exact ⟨by decide, region_2448_check⟩
  · exact ⟨by decide, region_2449_check⟩
  · exact ⟨by decide, region_2450_check⟩
  · exact ⟨by decide, region_2451_check⟩

end LatticePathOrders.GeneratedMinimality_13_11

