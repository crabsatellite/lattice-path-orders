import LatticePathOrders.GeneratedMinimality_11_10_Part074_Region0296
import LatticePathOrders.GeneratedMinimality_11_10_Part074_Region0297
import LatticePathOrders.GeneratedMinimality_11_10_Part074_Region0298
import LatticePathOrders.GeneratedMinimality_11_10_Part074_Region0299

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_11_10

def regionsPart074 : List (Path × Nat × AssignmentTree) := [
  (mustParsePath "RRURRRRRURUU", 9, region_0296),
  (mustParsePath "RRURRRRRUURR", 9, region_0297),
  (mustParsePath "RRURRRRRUURU", 9, region_0298),
  (mustParsePath "RRURRRRRUUUR", 9, region_0299)
]

theorem regionsPart074_valid : ∀ region ∈ regionsPart074,
    region.1.length + region.2.1 = 21 ∧
      region.2.2.check 11 10 classes region.2.1 region.1 = true := by
  intro region h
  simp only [regionsPart074, List.mem_cons, List.mem_nil_iff, or_false] at h
  rcases h with rfl | rfl | rfl | rfl
  · exact ⟨by decide, region_0296_check⟩
  · exact ⟨by decide, region_0297_check⟩
  · exact ⟨by decide, region_0298_check⟩
  · exact ⟨by decide, region_0299_check⟩

end LatticePathOrders.GeneratedMinimality_11_10

