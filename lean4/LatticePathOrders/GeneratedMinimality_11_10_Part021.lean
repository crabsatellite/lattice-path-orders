import LatticePathOrders.GeneratedMinimality_11_10_Part021_Region0084
import LatticePathOrders.GeneratedMinimality_11_10_Part021_Region0085
import LatticePathOrders.GeneratedMinimality_11_10_Part021_Region0086
import LatticePathOrders.GeneratedMinimality_11_10_Part021_Region0087

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_11_10

def regionsPart021 : List (Path × Nat × AssignmentTree) := [
  (mustParsePath "RRRRRUUURURR", 9, region_0084),
  (mustParsePath "RRRRRUUURURU", 9, region_0085),
  (mustParsePath "RRRRRUUURUU", 10, region_0086),
  (mustParsePath "RRRRRUUUURRR", 9, region_0087)
]

theorem regionsPart021_valid : ∀ region ∈ regionsPart021,
    region.1.length + region.2.1 = 21 ∧
      region.2.2.check 11 10 classes region.2.1 region.1 = true := by
  intro region h
  simp only [regionsPart021, List.mem_cons, List.mem_nil_iff, or_false] at h
  rcases h with rfl | rfl | rfl | rfl
  · exact ⟨by decide, region_0084_check⟩
  · exact ⟨by decide, region_0085_check⟩
  · exact ⟨by decide, region_0086_check⟩
  · exact ⟨by decide, region_0087_check⟩

end LatticePathOrders.GeneratedMinimality_11_10

