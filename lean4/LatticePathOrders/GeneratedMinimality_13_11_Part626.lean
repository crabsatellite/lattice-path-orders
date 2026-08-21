import LatticePathOrders.GeneratedMinimality_13_11_Part626_Region2504
import LatticePathOrders.GeneratedMinimality_13_11_Part626_Region2505
import LatticePathOrders.GeneratedMinimality_13_11_Part626_Region2506
import LatticePathOrders.GeneratedMinimality_13_11_Part626_Region2507

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_13_11

def regionsPart626 : List (Path × Nat × AssignmentTree) := [
  (mustParsePath "RRURURURURRURU", 10, region_2504),
  (mustParsePath "RRURURURURURRRR", 9, region_2505),
  (mustParsePath "RRURURURURURRRU", 9, region_2506),
  (mustParsePath "RRURURURURURRU", 10, region_2507)
]

theorem regionsPart626_valid : ∀ region ∈ regionsPart626,
    region.1.length + region.2.1 = 24 ∧
      region.2.2.check 13 11 classes region.2.1 region.1 = true := by
  intro region h
  simp only [regionsPart626, List.mem_cons, List.mem_nil_iff, or_false] at h
  rcases h with rfl | rfl | rfl | rfl
  · exact ⟨by decide, region_2504_check⟩
  · exact ⟨by decide, region_2505_check⟩
  · exact ⟨by decide, region_2506_check⟩
  · exact ⟨by decide, region_2507_check⟩

end LatticePathOrders.GeneratedMinimality_13_11

