import LatticePathOrders.GeneratedMinimality_13_11_Part613_Region2452
import LatticePathOrders.GeneratedMinimality_13_11_Part613_Region2453
import LatticePathOrders.GeneratedMinimality_13_11_Part613_Region2454
import LatticePathOrders.GeneratedMinimality_13_11_Part613_Region2455

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_13_11

def regionsPart613 : List (Path × Nat × AssignmentTree) := [
  (mustParsePath "RRURURRUURRURRR", 9, region_2452),
  (mustParsePath "RRURURRUURRURRU", 9, region_2453),
  (mustParsePath "RRURURRUURRURU", 10, region_2454),
  (mustParsePath "RRURURRUURURRRR", 9, region_2455)
]

theorem regionsPart613_valid : ∀ region ∈ regionsPart613,
    region.1.length + region.2.1 = 24 ∧
      region.2.2.check 13 11 classes region.2.1 region.1 = true := by
  intro region h
  simp only [regionsPart613, List.mem_cons, List.mem_nil_iff, or_false] at h
  rcases h with rfl | rfl | rfl | rfl
  · exact ⟨by decide, region_2452_check⟩
  · exact ⟨by decide, region_2453_check⟩
  · exact ⟨by decide, region_2454_check⟩
  · exact ⟨by decide, region_2455_check⟩

end LatticePathOrders.GeneratedMinimality_13_11

