import LatticePathOrders.GeneratedMinimality_13_11_Part594_Region2376
import LatticePathOrders.GeneratedMinimality_13_11_Part594_Region2377
import LatticePathOrders.GeneratedMinimality_13_11_Part594_Region2378
import LatticePathOrders.GeneratedMinimality_13_11_Part594_Region2379

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_13_11

def regionsPart594 : List (Path × Nat × AssignmentTree) := [
  (mustParsePath "RRURURRRURRRUUR", 9, region_2376),
  (mustParsePath "RRURURRRURRRUUU", 9, region_2377),
  (mustParsePath "RRURURRRURRURRR", 9, region_2378),
  (mustParsePath "RRURURRRURRURRU", 9, region_2379)
]

theorem regionsPart594_valid : ∀ region ∈ regionsPart594,
    region.1.length + region.2.1 = 24 ∧
      region.2.2.check 13 11 classes region.2.1 region.1 = true := by
  intro region h
  simp only [regionsPart594, List.mem_cons, List.mem_nil_iff, or_false] at h
  rcases h with rfl | rfl | rfl | rfl
  · exact ⟨by decide, region_2376_check⟩
  · exact ⟨by decide, region_2377_check⟩
  · exact ⟨by decide, region_2378_check⟩
  · exact ⟨by decide, region_2379_check⟩

end LatticePathOrders.GeneratedMinimality_13_11

