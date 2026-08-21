import LatticePathOrders.GeneratedMinimality_11_10_Part048_Region0192
import LatticePathOrders.GeneratedMinimality_11_10_Part048_Region0193
import LatticePathOrders.GeneratedMinimality_11_10_Part048_Region0194
import LatticePathOrders.GeneratedMinimality_11_10_Part048_Region0195

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_11_10

def regionsPart048 : List (Path × Nat × AssignmentTree) := [
  (mustParsePath "RRRURRRUURRU", 9, region_0192),
  (mustParsePath "RRRURRRUURUR", 9, region_0193),
  (mustParsePath "RRRURRRUURUU", 9, region_0194),
  (mustParsePath "RRRURRRUUURR", 9, region_0195)
]

theorem regionsPart048_valid : ∀ region ∈ regionsPart048,
    region.1.length + region.2.1 = 21 ∧
      region.2.2.check 11 10 classes region.2.1 region.1 = true := by
  intro region h
  simp only [regionsPart048, List.mem_cons, List.mem_nil_iff, or_false] at h
  rcases h with rfl | rfl | rfl | rfl
  · exact ⟨by decide, region_0192_check⟩
  · exact ⟨by decide, region_0193_check⟩
  · exact ⟨by decide, region_0194_check⟩
  · exact ⟨by decide, region_0195_check⟩

end LatticePathOrders.GeneratedMinimality_11_10

