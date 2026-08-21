import LatticePathOrders.GeneratedMinimality_11_10_Part099_Region0396
import LatticePathOrders.GeneratedMinimality_11_10_Part099_Region0397
import LatticePathOrders.GeneratedMinimality_11_10_Part099_Region0398
import LatticePathOrders.GeneratedMinimality_11_10_Part099_Region0399

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_11_10

def regionsPart099 : List (Path × Nat × AssignmentTree) := [
  (mustParsePath "RRURURRUURU", 10, region_0396),
  (mustParsePath "RRURURURRRRR", 9, region_0397),
  (mustParsePath "RRURURURRRRU", 9, region_0398),
  (mustParsePath "RRURURURRRUR", 9, region_0399)
]

theorem regionsPart099_valid : ∀ region ∈ regionsPart099,
    region.1.length + region.2.1 = 21 ∧
      region.2.2.check 11 10 classes region.2.1 region.1 = true := by
  intro region h
  simp only [regionsPart099, List.mem_cons, List.mem_nil_iff, or_false] at h
  rcases h with rfl | rfl | rfl | rfl
  · exact ⟨by decide, region_0396_check⟩
  · exact ⟨by decide, region_0397_check⟩
  · exact ⟨by decide, region_0398_check⟩
  · exact ⟨by decide, region_0399_check⟩

end LatticePathOrders.GeneratedMinimality_11_10

