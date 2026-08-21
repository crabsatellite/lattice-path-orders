import LatticePathOrders.GeneratedMinimality_11_10_Part022_Region0088
import LatticePathOrders.GeneratedMinimality_11_10_Part022_Region0089
import LatticePathOrders.GeneratedMinimality_11_10_Part022_Region0090
import LatticePathOrders.GeneratedMinimality_11_10_Part022_Region0091

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_11_10

def regionsPart022 : List (Path × Nat × AssignmentTree) := [
  (mustParsePath "RRRRRUUUURRU", 9, region_0088),
  (mustParsePath "RRRRRUUUURU", 10, region_0089),
  (mustParsePath "RRRRURRRRR", 11, region_0090),
  (mustParsePath "RRRRURRRRUR", 10, region_0091)
]

theorem regionsPart022_valid : ∀ region ∈ regionsPart022,
    region.1.length + region.2.1 = 21 ∧
      region.2.2.check 11 10 classes region.2.1 region.1 = true := by
  intro region h
  simp only [regionsPart022, List.mem_cons, List.mem_nil_iff, or_false] at h
  rcases h with rfl | rfl | rfl | rfl
  · exact ⟨by decide, region_0088_check⟩
  · exact ⟨by decide, region_0089_check⟩
  · exact ⟨by decide, region_0090_check⟩
  · exact ⟨by decide, region_0091_check⟩

end LatticePathOrders.GeneratedMinimality_11_10

