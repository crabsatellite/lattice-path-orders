import LatticePathOrders.GeneratedMinimality_13_11_Part609_Region2436
import LatticePathOrders.GeneratedMinimality_13_11_Part609_Region2437
import LatticePathOrders.GeneratedMinimality_13_11_Part609_Region2438
import LatticePathOrders.GeneratedMinimality_13_11_Part609_Region2439

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_13_11

def regionsPart609 : List (Path × Nat × AssignmentTree) := [
  (mustParsePath "RRURURRURURRURR", 9, region_2436),
  (mustParsePath "RRURURRURURRURU", 9, region_2437),
  (mustParsePath "RRURURRURURRUU", 10, region_2438),
  (mustParsePath "RRURURRURURURRR", 9, region_2439)
]

theorem regionsPart609_valid : ∀ region ∈ regionsPart609,
    region.1.length + region.2.1 = 24 ∧
      region.2.2.check 13 11 classes region.2.1 region.1 = true := by
  intro region h
  simp only [regionsPart609, List.mem_cons, List.mem_nil_iff, or_false] at h
  rcases h with rfl | rfl | rfl | rfl
  · exact ⟨by decide, region_2436_check⟩
  · exact ⟨by decide, region_2437_check⟩
  · exact ⟨by decide, region_2438_check⟩
  · exact ⟨by decide, region_2439_check⟩

end LatticePathOrders.GeneratedMinimality_13_11

