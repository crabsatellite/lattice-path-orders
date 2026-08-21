import LatticePathOrders.GeneratedMinimality_13_11_Part015_Region0060
import LatticePathOrders.GeneratedMinimality_13_11_Part015_Region0061
import LatticePathOrders.GeneratedMinimality_13_11_Part015_Region0062
import LatticePathOrders.GeneratedMinimality_13_11_Part015_Region0063

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_13_11

def regionsPart015 : List (Path × Nat × AssignmentTree) := [
  (mustParsePath "RRRRRRRRUUUURUU", 9, region_0060),
  (mustParsePath "RRRRRRRRUUUUURR", 9, region_0061),
  (mustParsePath "RRRRRRRRUUUUURU", 9, region_0062),
  (mustParsePath "RRRRRRRRUUUUUU", 10, region_0063)
]

theorem regionsPart015_valid : ∀ region ∈ regionsPart015,
    region.1.length + region.2.1 = 24 ∧
      region.2.2.check 13 11 classes region.2.1 region.1 = true := by
  intro region h
  simp only [regionsPart015, List.mem_cons, List.mem_nil_iff, or_false] at h
  rcases h with rfl | rfl | rfl | rfl
  · exact ⟨by decide, region_0060_check⟩
  · exact ⟨by decide, region_0061_check⟩
  · exact ⟨by decide, region_0062_check⟩
  · exact ⟨by decide, region_0063_check⟩

end LatticePathOrders.GeneratedMinimality_13_11

