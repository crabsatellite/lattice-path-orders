import LatticePathOrders.GeneratedMinimality_13_11_Part605_Region2420
import LatticePathOrders.GeneratedMinimality_13_11_Part605_Region2421
import LatticePathOrders.GeneratedMinimality_13_11_Part605_Region2422
import LatticePathOrders.GeneratedMinimality_13_11_Part605_Region2423

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_13_11

def regionsPart605 : List (Path × Nat × AssignmentTree) := [
  (mustParsePath "RRURURRURRRUURU", 9, region_2420),
  (mustParsePath "RRURURRURRRUUU", 10, region_2421),
  (mustParsePath "RRURURRURRURRRR", 9, region_2422),
  (mustParsePath "RRURURRURRURRRU", 9, region_2423)
]

theorem regionsPart605_valid : ∀ region ∈ regionsPart605,
    region.1.length + region.2.1 = 24 ∧
      region.2.2.check 13 11 classes region.2.1 region.1 = true := by
  intro region h
  simp only [regionsPart605, List.mem_cons, List.mem_nil_iff, or_false] at h
  rcases h with rfl | rfl | rfl | rfl
  · exact ⟨by decide, region_2420_check⟩
  · exact ⟨by decide, region_2421_check⟩
  · exact ⟨by decide, region_2422_check⟩
  · exact ⟨by decide, region_2423_check⟩

end LatticePathOrders.GeneratedMinimality_13_11

