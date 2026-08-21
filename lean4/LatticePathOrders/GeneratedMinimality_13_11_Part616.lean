import LatticePathOrders.GeneratedMinimality_13_11_Part616_Region2464
import LatticePathOrders.GeneratedMinimality_13_11_Part616_Region2465
import LatticePathOrders.GeneratedMinimality_13_11_Part616_Region2466
import LatticePathOrders.GeneratedMinimality_13_11_Part616_Region2467

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_13_11

def regionsPart616 : List (Path × Nat × AssignmentTree) := [
  (mustParsePath "RRURURURRRRRUUU", 9, region_2464),
  (mustParsePath "RRURURURRRRURRR", 9, region_2465),
  (mustParsePath "RRURURURRRRURRU", 9, region_2466),
  (mustParsePath "RRURURURRRRURUR", 9, region_2467)
]

theorem regionsPart616_valid : ∀ region ∈ regionsPart616,
    region.1.length + region.2.1 = 24 ∧
      region.2.2.check 13 11 classes region.2.1 region.1 = true := by
  intro region h
  simp only [regionsPart616, List.mem_cons, List.mem_nil_iff, or_false] at h
  rcases h with rfl | rfl | rfl | rfl
  · exact ⟨by decide, region_2464_check⟩
  · exact ⟨by decide, region_2465_check⟩
  · exact ⟨by decide, region_2466_check⟩
  · exact ⟨by decide, region_2467_check⟩

end LatticePathOrders.GeneratedMinimality_13_11

