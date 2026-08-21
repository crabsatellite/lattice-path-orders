import LatticePathOrders.GeneratedMinimality_11_10_Part040_Region0160
import LatticePathOrders.GeneratedMinimality_11_10_Part040_Region0161
import LatticePathOrders.GeneratedMinimality_11_10_Part040_Region0162
import LatticePathOrders.GeneratedMinimality_11_10_Part040_Region0163

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_11_10

def regionsPart040 : List (Path × Nat × AssignmentTree) := [
  (mustParsePath "RRRRUURUURRR", 9, region_0160),
  (mustParsePath "RRRRUURUURRU", 9, region_0161),
  (mustParsePath "RRRRUURUURU", 10, region_0162),
  (mustParsePath "RRRRUUURRRRR", 9, region_0163)
]

theorem regionsPart040_valid : ∀ region ∈ regionsPart040,
    region.1.length + region.2.1 = 21 ∧
      region.2.2.check 11 10 classes region.2.1 region.1 = true := by
  intro region h
  simp only [regionsPart040, List.mem_cons, List.mem_nil_iff, or_false] at h
  rcases h with rfl | rfl | rfl | rfl
  · exact ⟨by decide, region_0160_check⟩
  · exact ⟨by decide, region_0161_check⟩
  · exact ⟨by decide, region_0162_check⟩
  · exact ⟨by decide, region_0163_check⟩

end LatticePathOrders.GeneratedMinimality_11_10

