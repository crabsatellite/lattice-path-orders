import LatticePathOrders.GeneratedMinimality_11_10_Part033_Region0132
import LatticePathOrders.GeneratedMinimality_11_10_Part033_Region0133
import LatticePathOrders.GeneratedMinimality_11_10_Part033_Region0134
import LatticePathOrders.GeneratedMinimality_11_10_Part033_Region0135

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_11_10

def regionsPart033 : List (Path × Nat × AssignmentTree) := [
  (mustParsePath "RRRRURUURRUU", 9, region_0132),
  (mustParsePath "RRRRURUURURR", 9, region_0133),
  (mustParsePath "RRRRURUURURU", 9, region_0134),
  (mustParsePath "RRRRURUURUU", 10, region_0135)
]

theorem regionsPart033_valid : ∀ region ∈ regionsPart033,
    region.1.length + region.2.1 = 21 ∧
      region.2.2.check 11 10 classes region.2.1 region.1 = true := by
  intro region h
  simp only [regionsPart033, List.mem_cons, List.mem_nil_iff, or_false] at h
  rcases h with rfl | rfl | rfl | rfl
  · exact ⟨by decide, region_0132_check⟩
  · exact ⟨by decide, region_0133_check⟩
  · exact ⟨by decide, region_0134_check⟩
  · exact ⟨by decide, region_0135_check⟩

end LatticePathOrders.GeneratedMinimality_11_10

