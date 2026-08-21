import LatticePathOrders.GeneratedMinimality_13_11_Part593_Region2372
import LatticePathOrders.GeneratedMinimality_13_11_Part593_Region2373
import LatticePathOrders.GeneratedMinimality_13_11_Part593_Region2374
import LatticePathOrders.GeneratedMinimality_13_11_Part593_Region2375

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_13_11

def regionsPart593 : List (Path × Nat × AssignmentTree) := [
  (mustParsePath "RRURURRRURRRRUR", 9, region_2372),
  (mustParsePath "RRURURRRURRRRUU", 9, region_2373),
  (mustParsePath "RRURURRRURRRURR", 9, region_2374),
  (mustParsePath "RRURURRRURRRURU", 9, region_2375)
]

theorem regionsPart593_valid : ∀ region ∈ regionsPart593,
    region.1.length + region.2.1 = 24 ∧
      region.2.2.check 13 11 classes region.2.1 region.1 = true := by
  intro region h
  simp only [regionsPart593, List.mem_cons, List.mem_nil_iff, or_false] at h
  rcases h with rfl | rfl | rfl | rfl
  · exact ⟨by decide, region_2372_check⟩
  · exact ⟨by decide, region_2373_check⟩
  · exact ⟨by decide, region_2374_check⟩
  · exact ⟨by decide, region_2375_check⟩

end LatticePathOrders.GeneratedMinimality_13_11

