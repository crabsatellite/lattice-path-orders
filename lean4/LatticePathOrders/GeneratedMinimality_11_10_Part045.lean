import LatticePathOrders.GeneratedMinimality_11_10_Part045_Region0180
import LatticePathOrders.GeneratedMinimality_11_10_Part045_Region0181
import LatticePathOrders.GeneratedMinimality_11_10_Part045_Region0182
import LatticePathOrders.GeneratedMinimality_11_10_Part045_Region0183

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_11_10

def regionsPart045 : List (Path × Nat × AssignmentTree) := [
  (mustParsePath "RRRURRRRUURR", 9, region_0180),
  (mustParsePath "RRRURRRRUURU", 9, region_0181),
  (mustParsePath "RRRURRRRUUUR", 9, region_0182),
  (mustParsePath "RRRURRRRUUUU", 9, region_0183)
]

theorem regionsPart045_valid : ∀ region ∈ regionsPart045,
    region.1.length + region.2.1 = 21 ∧
      region.2.2.check 11 10 classes region.2.1 region.1 = true := by
  intro region h
  simp only [regionsPart045, List.mem_cons, List.mem_nil_iff, or_false] at h
  rcases h with rfl | rfl | rfl | rfl
  · exact ⟨by decide, region_0180_check⟩
  · exact ⟨by decide, region_0181_check⟩
  · exact ⟨by decide, region_0182_check⟩
  · exact ⟨by decide, region_0183_check⟩

end LatticePathOrders.GeneratedMinimality_11_10

