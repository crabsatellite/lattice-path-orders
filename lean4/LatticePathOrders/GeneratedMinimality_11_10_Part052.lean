import LatticePathOrders.GeneratedMinimality_11_10_Part052_Region0208
import LatticePathOrders.GeneratedMinimality_11_10_Part052_Region0209
import LatticePathOrders.GeneratedMinimality_11_10_Part052_Region0210
import LatticePathOrders.GeneratedMinimality_11_10_Part052_Region0211

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_11_10

def regionsPart052 : List (Path × Nat × AssignmentTree) := [
  (mustParsePath "RRRURRURURUU", 9, region_0208),
  (mustParsePath "RRRURRURUURR", 9, region_0209),
  (mustParsePath "RRRURRURUURU", 9, region_0210),
  (mustParsePath "RRRURRURUUU", 10, region_0211)
]

theorem regionsPart052_valid : ∀ region ∈ regionsPart052,
    region.1.length + region.2.1 = 21 ∧
      region.2.2.check 11 10 classes region.2.1 region.1 = true := by
  intro region h
  simp only [regionsPart052, List.mem_cons, List.mem_nil_iff, or_false] at h
  rcases h with rfl | rfl | rfl | rfl
  · exact ⟨by decide, region_0208_check⟩
  · exact ⟨by decide, region_0209_check⟩
  · exact ⟨by decide, region_0210_check⟩
  · exact ⟨by decide, region_0211_check⟩

end LatticePathOrders.GeneratedMinimality_11_10

