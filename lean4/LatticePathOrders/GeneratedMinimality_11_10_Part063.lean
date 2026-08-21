import LatticePathOrders.GeneratedMinimality_11_10_Part063_Region0252
import LatticePathOrders.GeneratedMinimality_11_10_Part063_Region0253
import LatticePathOrders.GeneratedMinimality_11_10_Part063_Region0254
import LatticePathOrders.GeneratedMinimality_11_10_Part063_Region0255

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_11_10

def regionsPart063 : List (Path × Nat × AssignmentTree) := [
  (mustParsePath "RRRURUURRUU", 10, region_0252),
  (mustParsePath "RRRURUURURRR", 9, region_0253),
  (mustParsePath "RRRURUURURRU", 9, region_0254),
  (mustParsePath "RRRURUURURU", 10, region_0255)
]

theorem regionsPart063_valid : ∀ region ∈ regionsPart063,
    region.1.length + region.2.1 = 21 ∧
      region.2.2.check 11 10 classes region.2.1 region.1 = true := by
  intro region h
  simp only [regionsPart063, List.mem_cons, List.mem_nil_iff, or_false] at h
  rcases h with rfl | rfl | rfl | rfl
  · exact ⟨by decide, region_0252_check⟩
  · exact ⟨by decide, region_0253_check⟩
  · exact ⟨by decide, region_0254_check⟩
  · exact ⟨by decide, region_0255_check⟩

end LatticePathOrders.GeneratedMinimality_11_10

