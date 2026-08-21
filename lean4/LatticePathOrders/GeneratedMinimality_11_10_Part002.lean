import LatticePathOrders.GeneratedMinimality_11_10_Part002_Region0008
import LatticePathOrders.GeneratedMinimality_11_10_Part002_Region0009
import LatticePathOrders.GeneratedMinimality_11_10_Part002_Region0010
import LatticePathOrders.GeneratedMinimality_11_10_Part002_Region0011

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_11_10

def regionsPart002 : List (Path × Nat × AssignmentTree) := [
  (mustParsePath "RRRRRRRURUUU", 9, region_0008),
  (mustParsePath "RRRRRRRUURR", 10, region_0009),
  (mustParsePath "RRRRRRRUURUR", 9, region_0010),
  (mustParsePath "RRRRRRRUURUU", 9, region_0011)
]

theorem regionsPart002_valid : ∀ region ∈ regionsPart002,
    region.1.length + region.2.1 = 21 ∧
      region.2.2.check 11 10 classes region.2.1 region.1 = true := by
  intro region h
  simp only [regionsPart002, List.mem_cons, List.mem_nil_iff, or_false] at h
  rcases h with rfl | rfl | rfl | rfl
  · exact ⟨by decide, region_0008_check⟩
  · exact ⟨by decide, region_0009_check⟩
  · exact ⟨by decide, region_0010_check⟩
  · exact ⟨by decide, region_0011_check⟩

end LatticePathOrders.GeneratedMinimality_11_10

