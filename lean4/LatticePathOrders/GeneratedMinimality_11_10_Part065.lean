import LatticePathOrders.GeneratedMinimality_11_10_Part065_Region0260
import LatticePathOrders.GeneratedMinimality_11_10_Part065_Region0261
import LatticePathOrders.GeneratedMinimality_11_10_Part065_Region0262
import LatticePathOrders.GeneratedMinimality_11_10_Part065_Region0263

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_11_10

def regionsPart065 : List (Path × Nat × AssignmentTree) := [
  (mustParsePath "RRRUURRRRURU", 9, region_0260),
  (mustParsePath "RRRUURRRRUUR", 9, region_0261),
  (mustParsePath "RRRUURRRRUUU", 9, region_0262),
  (mustParsePath "RRRUURRRURRR", 9, region_0263)
]

theorem regionsPart065_valid : ∀ region ∈ regionsPart065,
    region.1.length + region.2.1 = 21 ∧
      region.2.2.check 11 10 classes region.2.1 region.1 = true := by
  intro region h
  simp only [regionsPart065, List.mem_cons, List.mem_nil_iff, or_false] at h
  rcases h with rfl | rfl | rfl | rfl
  · exact ⟨by decide, region_0260_check⟩
  · exact ⟨by decide, region_0261_check⟩
  · exact ⟨by decide, region_0262_check⟩
  · exact ⟨by decide, region_0263_check⟩

end LatticePathOrders.GeneratedMinimality_11_10

