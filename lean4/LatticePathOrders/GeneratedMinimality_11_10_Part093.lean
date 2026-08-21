import LatticePathOrders.GeneratedMinimality_11_10_Part093_Region0372
import LatticePathOrders.GeneratedMinimality_11_10_Part093_Region0373
import LatticePathOrders.GeneratedMinimality_11_10_Part093_Region0374
import LatticePathOrders.GeneratedMinimality_11_10_Part093_Region0375

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_11_10

def regionsPart093 : List (Path × Nat × AssignmentTree) := [
  (mustParsePath "RRURRUURURU", 10, region_0372),
  (mustParsePath "RRURURRRRRR", 10, region_0373),
  (mustParsePath "RRURURRRRRUR", 9, region_0374),
  (mustParsePath "RRURURRRRRUU", 9, region_0375)
]

theorem regionsPart093_valid : ∀ region ∈ regionsPart093,
    region.1.length + region.2.1 = 21 ∧
      region.2.2.check 11 10 classes region.2.1 region.1 = true := by
  intro region h
  simp only [regionsPart093, List.mem_cons, List.mem_nil_iff, or_false] at h
  rcases h with rfl | rfl | rfl | rfl
  · exact ⟨by decide, region_0372_check⟩
  · exact ⟨by decide, region_0373_check⟩
  · exact ⟨by decide, region_0374_check⟩
  · exact ⟨by decide, region_0375_check⟩

end LatticePathOrders.GeneratedMinimality_11_10

