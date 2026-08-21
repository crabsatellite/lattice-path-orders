import LatticePathOrders.GeneratedMinimality_13_11_Part617_Region2468
import LatticePathOrders.GeneratedMinimality_13_11_Part617_Region2469
import LatticePathOrders.GeneratedMinimality_13_11_Part617_Region2470
import LatticePathOrders.GeneratedMinimality_13_11_Part617_Region2471

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_13_11

def regionsPart617 : List (Path × Nat × AssignmentTree) := [
  (mustParsePath "RRURURURRRRURUU", 9, region_2468),
  (mustParsePath "RRURURURRRRUURR", 9, region_2469),
  (mustParsePath "RRURURURRRRUURU", 9, region_2470),
  (mustParsePath "RRURURURRRRUUU", 10, region_2471)
]

theorem regionsPart617_valid : ∀ region ∈ regionsPart617,
    region.1.length + region.2.1 = 24 ∧
      region.2.2.check 13 11 classes region.2.1 region.1 = true := by
  intro region h
  simp only [regionsPart617, List.mem_cons, List.mem_nil_iff, or_false] at h
  rcases h with rfl | rfl | rfl | rfl
  · exact ⟨by decide, region_2468_check⟩
  · exact ⟨by decide, region_2469_check⟩
  · exact ⟨by decide, region_2470_check⟩
  · exact ⟨by decide, region_2471_check⟩

end LatticePathOrders.GeneratedMinimality_13_11

