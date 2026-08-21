import LatticePathOrders.GeneratedMinimality_11_10_Part076_Region0304
import LatticePathOrders.GeneratedMinimality_11_10_Part076_Region0305
import LatticePathOrders.GeneratedMinimality_11_10_Part076_Region0306
import LatticePathOrders.GeneratedMinimality_11_10_Part076_Region0307

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_11_10

def regionsPart076 : List (Path × Nat × AssignmentTree) := [
  (mustParsePath "RRURRRRURURR", 9, region_0304),
  (mustParsePath "RRURRRRURURU", 9, region_0305),
  (mustParsePath "RRURRRRURUUR", 9, region_0306),
  (mustParsePath "RRURRRRURUUU", 9, region_0307)
]

theorem regionsPart076_valid : ∀ region ∈ regionsPart076,
    region.1.length + region.2.1 = 21 ∧
      region.2.2.check 11 10 classes region.2.1 region.1 = true := by
  intro region h
  simp only [regionsPart076, List.mem_cons, List.mem_nil_iff, or_false] at h
  rcases h with rfl | rfl | rfl | rfl
  · exact ⟨by decide, region_0304_check⟩
  · exact ⟨by decide, region_0305_check⟩
  · exact ⟨by decide, region_0306_check⟩
  · exact ⟨by decide, region_0307_check⟩

end LatticePathOrders.GeneratedMinimality_11_10

