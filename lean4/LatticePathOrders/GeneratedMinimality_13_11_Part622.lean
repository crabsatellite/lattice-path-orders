import LatticePathOrders.GeneratedMinimality_13_11_Part622_Region2488
import LatticePathOrders.GeneratedMinimality_13_11_Part622_Region2489
import LatticePathOrders.GeneratedMinimality_13_11_Part622_Region2490
import LatticePathOrders.GeneratedMinimality_13_11_Part622_Region2491

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_13_11

def regionsPart622 : List (Path × Nat × AssignmentTree) := [
  (mustParsePath "RRURURURRURRUU", 10, region_2488),
  (mustParsePath "RRURURURRURURRR", 9, region_2489),
  (mustParsePath "RRURURURRURURRU", 9, region_2490),
  (mustParsePath "RRURURURRURURU", 10, region_2491)
]

theorem regionsPart622_valid : ∀ region ∈ regionsPart622,
    region.1.length + region.2.1 = 24 ∧
      region.2.2.check 13 11 classes region.2.1 region.1 = true := by
  intro region h
  simp only [regionsPart622, List.mem_cons, List.mem_nil_iff, or_false] at h
  rcases h with rfl | rfl | rfl | rfl
  · exact ⟨by decide, region_2488_check⟩
  · exact ⟨by decide, region_2489_check⟩
  · exact ⟨by decide, region_2490_check⟩
  · exact ⟨by decide, region_2491_check⟩

end LatticePathOrders.GeneratedMinimality_13_11

