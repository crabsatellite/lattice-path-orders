import LatticePathOrders.GeneratedMinimality_11_10_Part017_Region0068
import LatticePathOrders.GeneratedMinimality_11_10_Part017_Region0069
import LatticePathOrders.GeneratedMinimality_11_10_Part017_Region0070
import LatticePathOrders.GeneratedMinimality_11_10_Part017_Region0071

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_11_10

def regionsPart017 : List (Path × Nat × AssignmentTree) := [
  (mustParsePath "RRRRRUURRRUU", 9, region_0068),
  (mustParsePath "RRRRRUURRURR", 9, region_0069),
  (mustParsePath "RRRRRUURRURU", 9, region_0070),
  (mustParsePath "RRRRRUURRUUR", 9, region_0071)
]

theorem regionsPart017_valid : ∀ region ∈ regionsPart017,
    region.1.length + region.2.1 = 21 ∧
      region.2.2.check 11 10 classes region.2.1 region.1 = true := by
  intro region h
  simp only [regionsPart017, List.mem_cons, List.mem_nil_iff, or_false] at h
  rcases h with rfl | rfl | rfl | rfl
  · exact ⟨by decide, region_0068_check⟩
  · exact ⟨by decide, region_0069_check⟩
  · exact ⟨by decide, region_0070_check⟩
  · exact ⟨by decide, region_0071_check⟩

end LatticePathOrders.GeneratedMinimality_11_10

