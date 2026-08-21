import LatticePathOrders.GeneratedMinimality_11_10_Part030_Region0120
import LatticePathOrders.GeneratedMinimality_11_10_Part030_Region0121
import LatticePathOrders.GeneratedMinimality_11_10_Part030_Region0122
import LatticePathOrders.GeneratedMinimality_11_10_Part030_Region0123

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_11_10

def regionsPart030 : List (Path × Nat × AssignmentTree) := [
  (mustParsePath "RRRRURURRUUR", 9, region_0120),
  (mustParsePath "RRRRURURRUUU", 9, region_0121),
  (mustParsePath "RRRRURURURRR", 9, region_0122),
  (mustParsePath "RRRRURURURRU", 9, region_0123)
]

theorem regionsPart030_valid : ∀ region ∈ regionsPart030,
    region.1.length + region.2.1 = 21 ∧
      region.2.2.check 11 10 classes region.2.1 region.1 = true := by
  intro region h
  simp only [regionsPart030, List.mem_cons, List.mem_nil_iff, or_false] at h
  rcases h with rfl | rfl | rfl | rfl
  · exact ⟨by decide, region_0120_check⟩
  · exact ⟨by decide, region_0121_check⟩
  · exact ⟨by decide, region_0122_check⟩
  · exact ⟨by decide, region_0123_check⟩

end LatticePathOrders.GeneratedMinimality_11_10

