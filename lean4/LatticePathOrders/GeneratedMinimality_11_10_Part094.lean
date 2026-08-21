import LatticePathOrders.GeneratedMinimality_11_10_Part094_Region0376
import LatticePathOrders.GeneratedMinimality_11_10_Part094_Region0377
import LatticePathOrders.GeneratedMinimality_11_10_Part094_Region0378
import LatticePathOrders.GeneratedMinimality_11_10_Part094_Region0379

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_11_10

def regionsPart094 : List (Path × Nat × AssignmentTree) := [
  (mustParsePath "RRURURRRRURR", 9, region_0376),
  (mustParsePath "RRURURRRRURU", 9, region_0377),
  (mustParsePath "RRURURRRRUUR", 9, region_0378),
  (mustParsePath "RRURURRRRUUU", 9, region_0379)
]

theorem regionsPart094_valid : ∀ region ∈ regionsPart094,
    region.1.length + region.2.1 = 21 ∧
      region.2.2.check 11 10 classes region.2.1 region.1 = true := by
  intro region h
  simp only [regionsPart094, List.mem_cons, List.mem_nil_iff, or_false] at h
  rcases h with rfl | rfl | rfl | rfl
  · exact ⟨by decide, region_0376_check⟩
  · exact ⟨by decide, region_0377_check⟩
  · exact ⟨by decide, region_0378_check⟩
  · exact ⟨by decide, region_0379_check⟩

end LatticePathOrders.GeneratedMinimality_11_10

