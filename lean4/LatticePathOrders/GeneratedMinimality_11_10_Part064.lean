import LatticePathOrders.GeneratedMinimality_11_10_Part064_Region0256
import LatticePathOrders.GeneratedMinimality_11_10_Part064_Region0257
import LatticePathOrders.GeneratedMinimality_11_10_Part064_Region0258
import LatticePathOrders.GeneratedMinimality_11_10_Part064_Region0259

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_11_10

def regionsPart064 : List (Path × Nat × AssignmentTree) := [
  (mustParsePath "RRRUURRRRRR", 10, region_0256),
  (mustParsePath "RRRUURRRRRUR", 9, region_0257),
  (mustParsePath "RRRUURRRRRUU", 9, region_0258),
  (mustParsePath "RRRUURRRRURR", 9, region_0259)
]

theorem regionsPart064_valid : ∀ region ∈ regionsPart064,
    region.1.length + region.2.1 = 21 ∧
      region.2.2.check 11 10 classes region.2.1 region.1 = true := by
  intro region h
  simp only [regionsPart064, List.mem_cons, List.mem_nil_iff, or_false] at h
  rcases h with rfl | rfl | rfl | rfl
  · exact ⟨by decide, region_0256_check⟩
  · exact ⟨by decide, region_0257_check⟩
  · exact ⟨by decide, region_0258_check⟩
  · exact ⟨by decide, region_0259_check⟩

end LatticePathOrders.GeneratedMinimality_11_10

