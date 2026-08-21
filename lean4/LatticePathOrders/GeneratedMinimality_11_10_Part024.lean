import LatticePathOrders.GeneratedMinimality_11_10_Part024_Region0096
import LatticePathOrders.GeneratedMinimality_11_10_Part024_Region0097
import LatticePathOrders.GeneratedMinimality_11_10_Part024_Region0098
import LatticePathOrders.GeneratedMinimality_11_10_Part024_Region0099

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_11_10

def regionsPart024 : List (Path × Nat × AssignmentTree) := [
  (mustParsePath "RRRRURRRURUU", 9, region_0096),
  (mustParsePath "RRRRURRRUURR", 9, region_0097),
  (mustParsePath "RRRRURRRUURU", 9, region_0098),
  (mustParsePath "RRRRURRRUUUR", 9, region_0099)
]

theorem regionsPart024_valid : ∀ region ∈ regionsPart024,
    region.1.length + region.2.1 = 21 ∧
      region.2.2.check 11 10 classes region.2.1 region.1 = true := by
  intro region h
  simp only [regionsPart024, List.mem_cons, List.mem_nil_iff, or_false] at h
  rcases h with rfl | rfl | rfl | rfl
  · exact ⟨by decide, region_0096_check⟩
  · exact ⟨by decide, region_0097_check⟩
  · exact ⟨by decide, region_0098_check⟩
  · exact ⟨by decide, region_0099_check⟩

end LatticePathOrders.GeneratedMinimality_11_10

