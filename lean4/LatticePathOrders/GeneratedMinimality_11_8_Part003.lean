import LatticePathOrders.GeneratedMinimality_11_8_Part003_Region0012
import LatticePathOrders.GeneratedMinimality_11_8_Part003_Region0013
import LatticePathOrders.GeneratedMinimality_11_8_Part003_Region0014
import LatticePathOrders.GeneratedMinimality_11_8_Part003_Region0015

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_11_8

def regionsPart003 : List (Path × Nat × AssignmentTree) := [
  (mustParsePath "RRRRRRUURU", 9, region_0012),
  (mustParsePath "RRRRRRUUUR", 9, region_0013),
  (mustParsePath "RRRRRRUUUU", 9, region_0014),
  (mustParsePath "RRRRRURRRR", 9, region_0015)
]

theorem regionsPart003_valid : ∀ region ∈ regionsPart003,
    region.1.length + region.2.1 = 19 ∧
      region.2.2.check 11 8 classes region.2.1 region.1 = true := by
  intro region h
  simp only [regionsPart003, List.mem_cons, List.mem_nil_iff, or_false] at h
  rcases h with rfl | rfl | rfl | rfl
  · exact ⟨by decide, region_0012_check⟩
  · exact ⟨by decide, region_0013_check⟩
  · exact ⟨by decide, region_0014_check⟩
  · exact ⟨by decide, region_0015_check⟩

end LatticePathOrders.GeneratedMinimality_11_8

