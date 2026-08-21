import LatticePathOrders.GeneratedMinimality_13_11_Part000_Region0000
import LatticePathOrders.GeneratedMinimality_13_11_Part000_Region0001
import LatticePathOrders.GeneratedMinimality_13_11_Part000_Region0002
import LatticePathOrders.GeneratedMinimality_13_11_Part000_Region0003

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_13_11

def regionsPart000 : List (Path × Nat × AssignmentTree) := [
  (mustParsePath "RRRRRRRRRRRR", 12, region_0000),
  (mustParsePath "RRRRRRRRRRRU", 12, region_0001),
  (mustParsePath "RRRRRRRRRRUR", 12, region_0002),
  (mustParsePath "RRRRRRRRRRUUR", 11, region_0003)
]

theorem regionsPart000_valid : ∀ region ∈ regionsPart000,
    region.1.length + region.2.1 = 24 ∧
      region.2.2.check 13 11 classes region.2.1 region.1 = true := by
  intro region h
  simp only [regionsPart000, List.mem_cons, List.mem_nil_iff, or_false] at h
  rcases h with rfl | rfl | rfl | rfl
  · exact ⟨by decide, region_0000_check⟩
  · exact ⟨by decide, region_0001_check⟩
  · exact ⟨by decide, region_0002_check⟩
  · exact ⟨by decide, region_0003_check⟩

end LatticePathOrders.GeneratedMinimality_13_11

