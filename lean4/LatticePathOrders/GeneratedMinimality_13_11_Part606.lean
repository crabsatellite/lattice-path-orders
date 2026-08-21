import LatticePathOrders.GeneratedMinimality_13_11_Part606_Region2424
import LatticePathOrders.GeneratedMinimality_13_11_Part606_Region2425
import LatticePathOrders.GeneratedMinimality_13_11_Part606_Region2426
import LatticePathOrders.GeneratedMinimality_13_11_Part606_Region2427

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_13_11

def regionsPart606 : List (Path × Nat × AssignmentTree) := [
  (mustParsePath "RRURURRURRURRUR", 9, region_2424),
  (mustParsePath "RRURURRURRURRUU", 9, region_2425),
  (mustParsePath "RRURURRURRURURR", 9, region_2426),
  (mustParsePath "RRURURRURRURURU", 9, region_2427)
]

theorem regionsPart606_valid : ∀ region ∈ regionsPart606,
    region.1.length + region.2.1 = 24 ∧
      region.2.2.check 13 11 classes region.2.1 region.1 = true := by
  intro region h
  simp only [regionsPart606, List.mem_cons, List.mem_nil_iff, or_false] at h
  rcases h with rfl | rfl | rfl | rfl
  · exact ⟨by decide, region_2424_check⟩
  · exact ⟨by decide, region_2425_check⟩
  · exact ⟨by decide, region_2426_check⟩
  · exact ⟨by decide, region_2427_check⟩

end LatticePathOrders.GeneratedMinimality_13_11

