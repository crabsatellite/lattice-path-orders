import LatticePathOrders.GeneratedMinimality_11_10_Part044_Region0176
import LatticePathOrders.GeneratedMinimality_11_10_Part044_Region0177
import LatticePathOrders.GeneratedMinimality_11_10_Part044_Region0178
import LatticePathOrders.GeneratedMinimality_11_10_Part044_Region0179

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_11_10

def regionsPart044 : List (Path × Nat × AssignmentTree) := [
  (mustParsePath "RRRURRRRRUUU", 9, region_0176),
  (mustParsePath "RRRURRRRURR", 10, region_0177),
  (mustParsePath "RRRURRRRURUR", 9, region_0178),
  (mustParsePath "RRRURRRRURUU", 9, region_0179)
]

theorem regionsPart044_valid : ∀ region ∈ regionsPart044,
    region.1.length + region.2.1 = 21 ∧
      region.2.2.check 11 10 classes region.2.1 region.1 = true := by
  intro region h
  simp only [regionsPart044, List.mem_cons, List.mem_nil_iff, or_false] at h
  rcases h with rfl | rfl | rfl | rfl
  · exact ⟨by decide, region_0176_check⟩
  · exact ⟨by decide, region_0177_check⟩
  · exact ⟨by decide, region_0178_check⟩
  · exact ⟨by decide, region_0179_check⟩

end LatticePathOrders.GeneratedMinimality_11_10

