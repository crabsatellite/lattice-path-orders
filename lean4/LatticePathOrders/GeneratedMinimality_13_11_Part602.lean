import LatticePathOrders.GeneratedMinimality_13_11_Part602_Region2408
import LatticePathOrders.GeneratedMinimality_13_11_Part602_Region2409
import LatticePathOrders.GeneratedMinimality_13_11_Part602_Region2410
import LatticePathOrders.GeneratedMinimality_13_11_Part602_Region2411

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_13_11

def regionsPart602 : List (Path × Nat × AssignmentTree) := [
  (mustParsePath "RRURURRURRRRRR", 10, region_2408),
  (mustParsePath "RRURURRURRRRRUR", 9, region_2409),
  (mustParsePath "RRURURRURRRRRUU", 9, region_2410),
  (mustParsePath "RRURURRURRRRURR", 9, region_2411)
]

theorem regionsPart602_valid : ∀ region ∈ regionsPart602,
    region.1.length + region.2.1 = 24 ∧
      region.2.2.check 13 11 classes region.2.1 region.1 = true := by
  intro region h
  simp only [regionsPart602, List.mem_cons, List.mem_nil_iff, or_false] at h
  rcases h with rfl | rfl | rfl | rfl
  · exact ⟨by decide, region_2408_check⟩
  · exact ⟨by decide, region_2409_check⟩
  · exact ⟨by decide, region_2410_check⟩
  · exact ⟨by decide, region_2411_check⟩

end LatticePathOrders.GeneratedMinimality_13_11

