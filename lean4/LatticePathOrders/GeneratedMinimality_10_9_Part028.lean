import LatticePathOrders.GeneratedMinimality_10_9_Part028_Region0112
import LatticePathOrders.GeneratedMinimality_10_9_Part028_Region0113
import LatticePathOrders.GeneratedMinimality_10_9_Part028_Region0114
import LatticePathOrders.GeneratedMinimality_10_9_Part028_Region0115

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_10_9

def regionsPart028 : List (Path × Nat × AssignmentTree) := [
  (mustParsePath "RRURURRURU", 9, region_0112),
  (mustParsePath "RRURURRUU", 10, region_0113),
  (mustParsePath "RRURURURRR", 9, region_0114),
  (mustParsePath "RRURURURRU", 9, region_0115)
]

theorem regionsPart028_valid : ∀ region ∈ regionsPart028,
    region.1.length + region.2.1 = 19 ∧
      region.2.2.check 10 9 classes region.2.1 region.1 = true := by
  intro region h
  simp only [regionsPart028, List.mem_cons, List.mem_nil_iff, or_false] at h
  rcases h with rfl | rfl | rfl | rfl
  · exact ⟨by decide, region_0112_check⟩
  · exact ⟨by decide, region_0113_check⟩
  · exact ⟨by decide, region_0114_check⟩
  · exact ⟨by decide, region_0115_check⟩

end LatticePathOrders.GeneratedMinimality_10_9

