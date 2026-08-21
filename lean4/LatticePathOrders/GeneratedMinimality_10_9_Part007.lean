import LatticePathOrders.GeneratedMinimality_10_9_Part007_Region0028
import LatticePathOrders.GeneratedMinimality_10_9_Part007_Region0029
import LatticePathOrders.GeneratedMinimality_10_9_Part007_Region0030
import LatticePathOrders.GeneratedMinimality_10_9_Part007_Region0031

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_10_9

def regionsPart007 : List (Path × Nat × AssignmentTree) := [
  (mustParsePath "RRRRURRURR", 9, region_0028),
  (mustParsePath "RRRRURRURU", 9, region_0029),
  (mustParsePath "RRRRURRUUR", 9, region_0030),
  (mustParsePath "RRRRURRUUU", 9, region_0031)
]

theorem regionsPart007_valid : ∀ region ∈ regionsPart007,
    region.1.length + region.2.1 = 19 ∧
      region.2.2.check 10 9 classes region.2.1 region.1 = true := by
  intro region h
  simp only [regionsPart007, List.mem_cons, List.mem_nil_iff, or_false] at h
  rcases h with rfl | rfl | rfl | rfl
  · exact ⟨by decide, region_0028_check⟩
  · exact ⟨by decide, region_0029_check⟩
  · exact ⟨by decide, region_0030_check⟩
  · exact ⟨by decide, region_0031_check⟩

end LatticePathOrders.GeneratedMinimality_10_9

