import LatticePathOrders.GeneratedMinimality_11_10_Part018_Region0072
import LatticePathOrders.GeneratedMinimality_11_10_Part018_Region0073
import LatticePathOrders.GeneratedMinimality_11_10_Part018_Region0074
import LatticePathOrders.GeneratedMinimality_11_10_Part018_Region0075

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_11_10

def regionsPart018 : List (Path × Nat × AssignmentTree) := [
  (mustParsePath "RRRRRUURRUUU", 9, region_0072),
  (mustParsePath "RRRRRUURURRR", 9, region_0073),
  (mustParsePath "RRRRRUURURRU", 9, region_0074),
  (mustParsePath "RRRRRUURURUR", 9, region_0075)
]

theorem regionsPart018_valid : ∀ region ∈ regionsPart018,
    region.1.length + region.2.1 = 21 ∧
      region.2.2.check 11 10 classes region.2.1 region.1 = true := by
  intro region h
  simp only [regionsPart018, List.mem_cons, List.mem_nil_iff, or_false] at h
  rcases h with rfl | rfl | rfl | rfl
  · exact ⟨by decide, region_0072_check⟩
  · exact ⟨by decide, region_0073_check⟩
  · exact ⟨by decide, region_0074_check⟩
  · exact ⟨by decide, region_0075_check⟩

end LatticePathOrders.GeneratedMinimality_11_10

