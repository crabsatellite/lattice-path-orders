import LatticePathOrders.GeneratedMinimality_13_11_Part597_Region2388
import LatticePathOrders.GeneratedMinimality_13_11_Part597_Region2389
import LatticePathOrders.GeneratedMinimality_13_11_Part597_Region2390
import LatticePathOrders.GeneratedMinimality_13_11_Part597_Region2391

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_13_11

def regionsPart597 : List (Path × Nat × AssignmentTree) := [
  (mustParsePath "RRURURRRURURRUU", 9, region_2388),
  (mustParsePath "RRURURRRURURURR", 9, region_2389),
  (mustParsePath "RRURURRRURURURU", 9, region_2390),
  (mustParsePath "RRURURRRURURUU", 10, region_2391)
]

theorem regionsPart597_valid : ∀ region ∈ regionsPart597,
    region.1.length + region.2.1 = 24 ∧
      region.2.2.check 13 11 classes region.2.1 region.1 = true := by
  intro region h
  simp only [regionsPart597, List.mem_cons, List.mem_nil_iff, or_false] at h
  rcases h with rfl | rfl | rfl | rfl
  · exact ⟨by decide, region_2388_check⟩
  · exact ⟨by decide, region_2389_check⟩
  · exact ⟨by decide, region_2390_check⟩
  · exact ⟨by decide, region_2391_check⟩

end LatticePathOrders.GeneratedMinimality_13_11

