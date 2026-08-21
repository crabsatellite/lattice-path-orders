import LatticePathOrders.GeneratedMinimality_11_10_Part026_Region0104
import LatticePathOrders.GeneratedMinimality_11_10_Part026_Region0105
import LatticePathOrders.GeneratedMinimality_11_10_Part026_Region0106
import LatticePathOrders.GeneratedMinimality_11_10_Part026_Region0107

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_11_10

def regionsPart026 : List (Path × Nat × AssignmentTree) := [
  (mustParsePath "RRRRURRURURR", 9, region_0104),
  (mustParsePath "RRRRURRURURU", 9, region_0105),
  (mustParsePath "RRRRURRURUUR", 9, region_0106),
  (mustParsePath "RRRRURRURUUU", 9, region_0107)
]

theorem regionsPart026_valid : ∀ region ∈ regionsPart026,
    region.1.length + region.2.1 = 21 ∧
      region.2.2.check 11 10 classes region.2.1 region.1 = true := by
  intro region h
  simp only [regionsPart026, List.mem_cons, List.mem_nil_iff, or_false] at h
  rcases h with rfl | rfl | rfl | rfl
  · exact ⟨by decide, region_0104_check⟩
  · exact ⟨by decide, region_0105_check⟩
  · exact ⟨by decide, region_0106_check⟩
  · exact ⟨by decide, region_0107_check⟩

end LatticePathOrders.GeneratedMinimality_11_10

