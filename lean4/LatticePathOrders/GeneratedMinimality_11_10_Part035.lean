import LatticePathOrders.GeneratedMinimality_11_10_Part035_Region0140
import LatticePathOrders.GeneratedMinimality_11_10_Part035_Region0141
import LatticePathOrders.GeneratedMinimality_11_10_Part035_Region0142
import LatticePathOrders.GeneratedMinimality_11_10_Part035_Region0143

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_11_10

def regionsPart035 : List (Path × Nat × AssignmentTree) := [
  (mustParsePath "RRRRUURRRRUR", 9, region_0140),
  (mustParsePath "RRRRUURRRRUU", 9, region_0141),
  (mustParsePath "RRRRUURRRURR", 9, region_0142),
  (mustParsePath "RRRRUURRRURU", 9, region_0143)
]

theorem regionsPart035_valid : ∀ region ∈ regionsPart035,
    region.1.length + region.2.1 = 21 ∧
      region.2.2.check 11 10 classes region.2.1 region.1 = true := by
  intro region h
  simp only [regionsPart035, List.mem_cons, List.mem_nil_iff, or_false] at h
  rcases h with rfl | rfl | rfl | rfl
  · exact ⟨by decide, region_0140_check⟩
  · exact ⟨by decide, region_0141_check⟩
  · exact ⟨by decide, region_0142_check⟩
  · exact ⟨by decide, region_0143_check⟩

end LatticePathOrders.GeneratedMinimality_11_10

