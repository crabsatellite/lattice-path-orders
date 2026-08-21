import LatticePathOrders.GeneratedMinimality_11_10_Part047_Region0188
import LatticePathOrders.GeneratedMinimality_11_10_Part047_Region0189
import LatticePathOrders.GeneratedMinimality_11_10_Part047_Region0190
import LatticePathOrders.GeneratedMinimality_11_10_Part047_Region0191

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_11_10

def regionsPart047 : List (Path × Nat × AssignmentTree) := [
  (mustParsePath "RRRURRRURURU", 9, region_0188),
  (mustParsePath "RRRURRRURUUR", 9, region_0189),
  (mustParsePath "RRRURRRURUUU", 9, region_0190),
  (mustParsePath "RRRURRRUURRR", 9, region_0191)
]

theorem regionsPart047_valid : ∀ region ∈ regionsPart047,
    region.1.length + region.2.1 = 21 ∧
      region.2.2.check 11 10 classes region.2.1 region.1 = true := by
  intro region h
  simp only [regionsPart047, List.mem_cons, List.mem_nil_iff, or_false] at h
  rcases h with rfl | rfl | rfl | rfl
  · exact ⟨by decide, region_0188_check⟩
  · exact ⟨by decide, region_0189_check⟩
  · exact ⟨by decide, region_0190_check⟩
  · exact ⟨by decide, region_0191_check⟩

end LatticePathOrders.GeneratedMinimality_11_10

