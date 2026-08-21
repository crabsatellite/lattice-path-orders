import LatticePathOrders.GeneratedMinimality_11_10_Part039_Region0156
import LatticePathOrders.GeneratedMinimality_11_10_Part039_Region0157
import LatticePathOrders.GeneratedMinimality_11_10_Part039_Region0158
import LatticePathOrders.GeneratedMinimality_11_10_Part039_Region0159

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_11_10

def regionsPart039 : List (Path × Nat × AssignmentTree) := [
  (mustParsePath "RRRRUURURRUU", 9, region_0156),
  (mustParsePath "RRRRUURURURR", 9, region_0157),
  (mustParsePath "RRRRUURURURU", 9, region_0158),
  (mustParsePath "RRRRUURURUU", 10, region_0159)
]

theorem regionsPart039_valid : ∀ region ∈ regionsPart039,
    region.1.length + region.2.1 = 21 ∧
      region.2.2.check 11 10 classes region.2.1 region.1 = true := by
  intro region h
  simp only [regionsPart039, List.mem_cons, List.mem_nil_iff, or_false] at h
  rcases h with rfl | rfl | rfl | rfl
  · exact ⟨by decide, region_0156_check⟩
  · exact ⟨by decide, region_0157_check⟩
  · exact ⟨by decide, region_0158_check⟩
  · exact ⟨by decide, region_0159_check⟩

end LatticePathOrders.GeneratedMinimality_11_10

