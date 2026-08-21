import LatticePathOrders.GeneratedMinimality_13_11_Part592_Region2368
import LatticePathOrders.GeneratedMinimality_13_11_Part592_Region2369
import LatticePathOrders.GeneratedMinimality_13_11_Part592_Region2370
import LatticePathOrders.GeneratedMinimality_13_11_Part592_Region2371

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_13_11

def regionsPart592 : List (Path × Nat × AssignmentTree) := [
  (mustParsePath "RRURURRRRUUURRR", 9, region_2368),
  (mustParsePath "RRURURRRRUUURRU", 9, region_2369),
  (mustParsePath "RRURURRRRUUURU", 10, region_2370),
  (mustParsePath "RRURURRRURRRRR", 10, region_2371)
]

theorem regionsPart592_valid : ∀ region ∈ regionsPart592,
    region.1.length + region.2.1 = 24 ∧
      region.2.2.check 13 11 classes region.2.1 region.1 = true := by
  intro region h
  simp only [regionsPart592, List.mem_cons, List.mem_nil_iff, or_false] at h
  rcases h with rfl | rfl | rfl | rfl
  · exact ⟨by decide, region_2368_check⟩
  · exact ⟨by decide, region_2369_check⟩
  · exact ⟨by decide, region_2370_check⟩
  · exact ⟨by decide, region_2371_check⟩

end LatticePathOrders.GeneratedMinimality_13_11

