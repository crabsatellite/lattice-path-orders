import LatticePathOrders.GeneratedMinimality_11_10_Part000_Region0000
import LatticePathOrders.GeneratedMinimality_11_10_Part000_Region0001
import LatticePathOrders.GeneratedMinimality_11_10_Part000_Region0002
import LatticePathOrders.GeneratedMinimality_11_10_Part000_Region0003

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_11_10

def regionsPart000 : List (Path × Nat × AssignmentTree) := [
  (mustParsePath "RRRRRRRRR", 12, region_0000),
  (mustParsePath "RRRRRRRRUR", 11, region_0001),
  (mustParsePath "RRRRRRRRUUR", 10, region_0002),
  (mustParsePath "RRRRRRRRUUUR", 9, region_0003)
]

theorem regionsPart000_valid : ∀ region ∈ regionsPart000,
    region.1.length + region.2.1 = 21 ∧
      region.2.2.check 11 10 classes region.2.1 region.1 = true := by
  intro region h
  simp only [regionsPart000, List.mem_cons, List.mem_nil_iff, or_false] at h
  rcases h with rfl | rfl | rfl | rfl
  · exact ⟨by decide, region_0000_check⟩
  · exact ⟨by decide, region_0001_check⟩
  · exact ⟨by decide, region_0002_check⟩
  · exact ⟨by decide, region_0003_check⟩

end LatticePathOrders.GeneratedMinimality_11_10

