import LatticePathOrders.GeneratedMinimality_11_10_Part085_Region0340
import LatticePathOrders.GeneratedMinimality_11_10_Part085_Region0341
import LatticePathOrders.GeneratedMinimality_11_10_Part085_Region0342
import LatticePathOrders.GeneratedMinimality_11_10_Part085_Region0343

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_11_10

def regionsPart085 : List (Path × Nat × AssignmentTree) := [
  (mustParsePath "RRURRURRRRUR", 9, region_0340),
  (mustParsePath "RRURRURRRRUU", 9, region_0341),
  (mustParsePath "RRURRURRRURR", 9, region_0342),
  (mustParsePath "RRURRURRRURU", 9, region_0343)
]

theorem regionsPart085_valid : ∀ region ∈ regionsPart085,
    region.1.length + region.2.1 = 21 ∧
      region.2.2.check 11 10 classes region.2.1 region.1 = true := by
  intro region h
  simp only [regionsPart085, List.mem_cons, List.mem_nil_iff, or_false] at h
  rcases h with rfl | rfl | rfl | rfl
  · exact ⟨by decide, region_0340_check⟩
  · exact ⟨by decide, region_0341_check⟩
  · exact ⟨by decide, region_0342_check⟩
  · exact ⟨by decide, region_0343_check⟩

end LatticePathOrders.GeneratedMinimality_11_10

