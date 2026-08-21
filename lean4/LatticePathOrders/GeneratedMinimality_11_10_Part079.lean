import LatticePathOrders.GeneratedMinimality_11_10_Part079_Region0316
import LatticePathOrders.GeneratedMinimality_11_10_Part079_Region0317
import LatticePathOrders.GeneratedMinimality_11_10_Part079_Region0318
import LatticePathOrders.GeneratedMinimality_11_10_Part079_Region0319

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_11_10

def regionsPart079 : List (Path × Nat × AssignmentTree) := [
  (mustParsePath "RRURRRURRRUR", 9, region_0316),
  (mustParsePath "RRURRRURRRUU", 9, region_0317),
  (mustParsePath "RRURRRURRURR", 9, region_0318),
  (mustParsePath "RRURRRURRURU", 9, region_0319)
]

theorem regionsPart079_valid : ∀ region ∈ regionsPart079,
    region.1.length + region.2.1 = 21 ∧
      region.2.2.check 11 10 classes region.2.1 region.1 = true := by
  intro region h
  simp only [regionsPart079, List.mem_cons, List.mem_nil_iff, or_false] at h
  rcases h with rfl | rfl | rfl | rfl
  · exact ⟨by decide, region_0316_check⟩
  · exact ⟨by decide, region_0317_check⟩
  · exact ⟨by decide, region_0318_check⟩
  · exact ⟨by decide, region_0319_check⟩

end LatticePathOrders.GeneratedMinimality_11_10

