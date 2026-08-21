import LatticePathOrders.GeneratedMinimality_11_10_Part028_Region0112
import LatticePathOrders.GeneratedMinimality_11_10_Part028_Region0113
import LatticePathOrders.GeneratedMinimality_11_10_Part028_Region0114
import LatticePathOrders.GeneratedMinimality_11_10_Part028_Region0115

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_11_10

def regionsPart028 : List (Path × Nat × AssignmentTree) := [
  (mustParsePath "RRRRURRUUURR", 9, region_0112),
  (mustParsePath "RRRRURRUUURU", 9, region_0113),
  (mustParsePath "RRRRURRUUUU", 10, region_0114),
  (mustParsePath "RRRRURURRRR", 10, region_0115)
]

theorem regionsPart028_valid : ∀ region ∈ regionsPart028,
    region.1.length + region.2.1 = 21 ∧
      region.2.2.check 11 10 classes region.2.1 region.1 = true := by
  intro region h
  simp only [regionsPart028, List.mem_cons, List.mem_nil_iff, or_false] at h
  rcases h with rfl | rfl | rfl | rfl
  · exact ⟨by decide, region_0112_check⟩
  · exact ⟨by decide, region_0113_check⟩
  · exact ⟨by decide, region_0114_check⟩
  · exact ⟨by decide, region_0115_check⟩

end LatticePathOrders.GeneratedMinimality_11_10

