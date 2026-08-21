import LatticePathOrders.GeneratedMinimality_11_10_Part034_Region0136
import LatticePathOrders.GeneratedMinimality_11_10_Part034_Region0137
import LatticePathOrders.GeneratedMinimality_11_10_Part034_Region0138
import LatticePathOrders.GeneratedMinimality_11_10_Part034_Region0139

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_11_10

def regionsPart034 : List (Path × Nat × AssignmentTree) := [
  (mustParsePath "RRRRURUUURRR", 9, region_0136),
  (mustParsePath "RRRRURUUURRU", 9, region_0137),
  (mustParsePath "RRRRURUUURU", 10, region_0138),
  (mustParsePath "RRRRUURRRRR", 10, region_0139)
]

theorem regionsPart034_valid : ∀ region ∈ regionsPart034,
    region.1.length + region.2.1 = 21 ∧
      region.2.2.check 11 10 classes region.2.1 region.1 = true := by
  intro region h
  simp only [regionsPart034, List.mem_cons, List.mem_nil_iff, or_false] at h
  rcases h with rfl | rfl | rfl | rfl
  · exact ⟨by decide, region_0136_check⟩
  · exact ⟨by decide, region_0137_check⟩
  · exact ⟨by decide, region_0138_check⟩
  · exact ⟨by decide, region_0139_check⟩

end LatticePathOrders.GeneratedMinimality_11_10

