import LatticePathOrders.GeneratedMinimality_11_10_Part075_Region0300
import LatticePathOrders.GeneratedMinimality_11_10_Part075_Region0301
import LatticePathOrders.GeneratedMinimality_11_10_Part075_Region0302
import LatticePathOrders.GeneratedMinimality_11_10_Part075_Region0303

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_11_10

def regionsPart075 : List (Path × Nat × AssignmentTree) := [
  (mustParsePath "RRURRRRRUUUU", 9, region_0300),
  (mustParsePath "RRURRRRURRR", 10, region_0301),
  (mustParsePath "RRURRRRURRUR", 9, region_0302),
  (mustParsePath "RRURRRRURRUU", 9, region_0303)
]

theorem regionsPart075_valid : ∀ region ∈ regionsPart075,
    region.1.length + region.2.1 = 21 ∧
      region.2.2.check 11 10 classes region.2.1 region.1 = true := by
  intro region h
  simp only [regionsPart075, List.mem_cons, List.mem_nil_iff, or_false] at h
  rcases h with rfl | rfl | rfl | rfl
  · exact ⟨by decide, region_0300_check⟩
  · exact ⟨by decide, region_0301_check⟩
  · exact ⟨by decide, region_0302_check⟩
  · exact ⟨by decide, region_0303_check⟩

end LatticePathOrders.GeneratedMinimality_11_10

