import LatticePathOrders.GeneratedMinimality_11_10_Part038_Region0152
import LatticePathOrders.GeneratedMinimality_11_10_Part038_Region0153
import LatticePathOrders.GeneratedMinimality_11_10_Part038_Region0154
import LatticePathOrders.GeneratedMinimality_11_10_Part038_Region0155

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_11_10

def regionsPart038 : List (Path × Nat × AssignmentTree) := [
  (mustParsePath "RRRRUURRUUU", 10, region_0152),
  (mustParsePath "RRRRUURURRRR", 9, region_0153),
  (mustParsePath "RRRRUURURRRU", 9, region_0154),
  (mustParsePath "RRRRUURURRUR", 9, region_0155)
]

theorem regionsPart038_valid : ∀ region ∈ regionsPart038,
    region.1.length + region.2.1 = 21 ∧
      region.2.2.check 11 10 classes region.2.1 region.1 = true := by
  intro region h
  simp only [regionsPart038, List.mem_cons, List.mem_nil_iff, or_false] at h
  rcases h with rfl | rfl | rfl | rfl
  · exact ⟨by decide, region_0152_check⟩
  · exact ⟨by decide, region_0153_check⟩
  · exact ⟨by decide, region_0154_check⟩
  · exact ⟨by decide, region_0155_check⟩

end LatticePathOrders.GeneratedMinimality_11_10

