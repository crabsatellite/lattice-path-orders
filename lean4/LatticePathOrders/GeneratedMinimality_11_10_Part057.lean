import LatticePathOrders.GeneratedMinimality_11_10_Part057_Region0228
import LatticePathOrders.GeneratedMinimality_11_10_Part057_Region0229
import LatticePathOrders.GeneratedMinimality_11_10_Part057_Region0230
import LatticePathOrders.GeneratedMinimality_11_10_Part057_Region0231

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_11_10

def regionsPart057 : List (Path × Nat × AssignmentTree) := [
  (mustParsePath "RRRURURRRUUU", 9, region_0228),
  (mustParsePath "RRRURURRURRR", 9, region_0229),
  (mustParsePath "RRRURURRURRU", 9, region_0230),
  (mustParsePath "RRRURURRURUR", 9, region_0231)
]

theorem regionsPart057_valid : ∀ region ∈ regionsPart057,
    region.1.length + region.2.1 = 21 ∧
      region.2.2.check 11 10 classes region.2.1 region.1 = true := by
  intro region h
  simp only [regionsPart057, List.mem_cons, List.mem_nil_iff, or_false] at h
  rcases h with rfl | rfl | rfl | rfl
  · exact ⟨by decide, region_0228_check⟩
  · exact ⟨by decide, region_0229_check⟩
  · exact ⟨by decide, region_0230_check⟩
  · exact ⟨by decide, region_0231_check⟩

end LatticePathOrders.GeneratedMinimality_11_10

