import LatticePathOrders.GeneratedMinimality_11_10_Part086_Region0344
import LatticePathOrders.GeneratedMinimality_11_10_Part086_Region0345
import LatticePathOrders.GeneratedMinimality_11_10_Part086_Region0346
import LatticePathOrders.GeneratedMinimality_11_10_Part086_Region0347

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_11_10

def regionsPart086 : List (Path × Nat × AssignmentTree) := [
  (mustParsePath "RRURRURRRUUR", 9, region_0344),
  (mustParsePath "RRURRURRRUUU", 9, region_0345),
  (mustParsePath "RRURRURRURRR", 9, region_0346),
  (mustParsePath "RRURRURRURRU", 9, region_0347)
]

theorem regionsPart086_valid : ∀ region ∈ regionsPart086,
    region.1.length + region.2.1 = 21 ∧
      region.2.2.check 11 10 classes region.2.1 region.1 = true := by
  intro region h
  simp only [regionsPart086, List.mem_cons, List.mem_nil_iff, or_false] at h
  rcases h with rfl | rfl | rfl | rfl
  · exact ⟨by decide, region_0344_check⟩
  · exact ⟨by decide, region_0345_check⟩
  · exact ⟨by decide, region_0346_check⟩
  · exact ⟨by decide, region_0347_check⟩

end LatticePathOrders.GeneratedMinimality_11_10

