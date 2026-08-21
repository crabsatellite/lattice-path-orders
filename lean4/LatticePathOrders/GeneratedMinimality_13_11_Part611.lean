import LatticePathOrders.GeneratedMinimality_13_11_Part611_Region2444
import LatticePathOrders.GeneratedMinimality_13_11_Part611_Region2445
import LatticePathOrders.GeneratedMinimality_13_11_Part611_Region2446
import LatticePathOrders.GeneratedMinimality_13_11_Part611_Region2447

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_13_11

def regionsPart611 : List (Path × Nat × AssignmentTree) := [
  (mustParsePath "RRURURRURUURRU", 10, region_2444),
  (mustParsePath "RRURURRUURRRRRR", 9, region_2445),
  (mustParsePath "RRURURRUURRRRRU", 9, region_2446),
  (mustParsePath "RRURURRUURRRRUR", 9, region_2447)
]

theorem regionsPart611_valid : ∀ region ∈ regionsPart611,
    region.1.length + region.2.1 = 24 ∧
      region.2.2.check 13 11 classes region.2.1 region.1 = true := by
  intro region h
  simp only [regionsPart611, List.mem_cons, List.mem_nil_iff, or_false] at h
  rcases h with rfl | rfl | rfl | rfl
  · exact ⟨by decide, region_2444_check⟩
  · exact ⟨by decide, region_2445_check⟩
  · exact ⟨by decide, region_2446_check⟩
  · exact ⟨by decide, region_2447_check⟩

end LatticePathOrders.GeneratedMinimality_13_11

