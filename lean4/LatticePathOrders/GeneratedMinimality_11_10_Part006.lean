import LatticePathOrders.GeneratedMinimality_11_10_Part006_Region0024
import LatticePathOrders.GeneratedMinimality_11_10_Part006_Region0025
import LatticePathOrders.GeneratedMinimality_11_10_Part006_Region0026
import LatticePathOrders.GeneratedMinimality_11_10_Part006_Region0027

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_11_10

def regionsPart006 : List (Path × Nat × AssignmentTree) := [
  (mustParsePath "RRRRRRURUURU", 9, region_0024),
  (mustParsePath "RRRRRRURUUUR", 9, region_0025),
  (mustParsePath "RRRRRRURUUUU", 9, region_0026),
  (mustParsePath "RRRRRRUURRR", 10, region_0027)
]

theorem regionsPart006_valid : ∀ region ∈ regionsPart006,
    region.1.length + region.2.1 = 21 ∧
      region.2.2.check 11 10 classes region.2.1 region.1 = true := by
  intro region h
  simp only [regionsPart006, List.mem_cons, List.mem_nil_iff, or_false] at h
  rcases h with rfl | rfl | rfl | rfl
  · exact ⟨by decide, region_0024_check⟩
  · exact ⟨by decide, region_0025_check⟩
  · exact ⟨by decide, region_0026_check⟩
  · exact ⟨by decide, region_0027_check⟩

end LatticePathOrders.GeneratedMinimality_11_10

