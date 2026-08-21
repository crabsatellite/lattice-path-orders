import LatticePathOrders.GeneratedMinimality_13_11_Part615_Region2460
import LatticePathOrders.GeneratedMinimality_13_11_Part615_Region2461
import LatticePathOrders.GeneratedMinimality_13_11_Part615_Region2462
import LatticePathOrders.GeneratedMinimality_13_11_Part615_Region2463

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_13_11

def regionsPart615 : List (Path × Nat × AssignmentTree) := [
  (mustParsePath "RRURURURRRRRRUU", 9, region_2460),
  (mustParsePath "RRURURURRRRRURR", 9, region_2461),
  (mustParsePath "RRURURURRRRRURU", 9, region_2462),
  (mustParsePath "RRURURURRRRRUUR", 9, region_2463)
]

theorem regionsPart615_valid : ∀ region ∈ regionsPart615,
    region.1.length + region.2.1 = 24 ∧
      region.2.2.check 13 11 classes region.2.1 region.1 = true := by
  intro region h
  simp only [regionsPart615, List.mem_cons, List.mem_nil_iff, or_false] at h
  rcases h with rfl | rfl | rfl | rfl
  · exact ⟨by decide, region_2460_check⟩
  · exact ⟨by decide, region_2461_check⟩
  · exact ⟨by decide, region_2462_check⟩
  · exact ⟨by decide, region_2463_check⟩

end LatticePathOrders.GeneratedMinimality_13_11

