import LatticePathOrders.GeneratedMinimality_11_10_Part077_Region0308
import LatticePathOrders.GeneratedMinimality_11_10_Part077_Region0309
import LatticePathOrders.GeneratedMinimality_11_10_Part077_Region0310
import LatticePathOrders.GeneratedMinimality_11_10_Part077_Region0311

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_11_10

def regionsPart077 : List (Path × Nat × AssignmentTree) := [
  (mustParsePath "RRURRRRUURRR", 9, region_0308),
  (mustParsePath "RRURRRRUURRU", 9, region_0309),
  (mustParsePath "RRURRRRUURUR", 9, region_0310),
  (mustParsePath "RRURRRRUURUU", 9, region_0311)
]

theorem regionsPart077_valid : ∀ region ∈ regionsPart077,
    region.1.length + region.2.1 = 21 ∧
      region.2.2.check 11 10 classes region.2.1 region.1 = true := by
  intro region h
  simp only [regionsPart077, List.mem_cons, List.mem_nil_iff, or_false] at h
  rcases h with rfl | rfl | rfl | rfl
  · exact ⟨by decide, region_0308_check⟩
  · exact ⟨by decide, region_0309_check⟩
  · exact ⟨by decide, region_0310_check⟩
  · exact ⟨by decide, region_0311_check⟩

end LatticePathOrders.GeneratedMinimality_11_10

