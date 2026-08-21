import LatticePathOrders.GeneratedMinimality_11_8_Part014_Region0056
import LatticePathOrders.GeneratedMinimality_11_8_Part014_Region0057
import LatticePathOrders.GeneratedMinimality_11_8_Part014_Region0058
import LatticePathOrders.GeneratedMinimality_11_8_Part014_Region0059

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_11_8

def regionsPart014 : List (Path × Nat × AssignmentTree) := [
  (mustParsePath "RRRURRRUUU", 9, region_0056),
  (mustParsePath "RRRURRURRR", 9, region_0057),
  (mustParsePath "RRRURRURRU", 9, region_0058),
  (mustParsePath "RRRURRURUR", 9, region_0059)
]

theorem regionsPart014_valid : ∀ region ∈ regionsPart014,
    region.1.length + region.2.1 = 19 ∧
      region.2.2.check 11 8 classes region.2.1 region.1 = true := by
  intro region h
  simp only [regionsPart014, List.mem_cons, List.mem_nil_iff, or_false] at h
  rcases h with rfl | rfl | rfl | rfl
  · exact ⟨by decide, region_0056_check⟩
  · exact ⟨by decide, region_0057_check⟩
  · exact ⟨by decide, region_0058_check⟩
  · exact ⟨by decide, region_0059_check⟩

end LatticePathOrders.GeneratedMinimality_11_8

