import LatticePathOrders.GeneratedMinimality_11_10_Part055_Region0220
import LatticePathOrders.GeneratedMinimality_11_10_Part055_Region0221
import LatticePathOrders.GeneratedMinimality_11_10_Part055_Region0222
import LatticePathOrders.GeneratedMinimality_11_10_Part055_Region0223

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_11_10

def regionsPart055 : List (Path × Nat × AssignmentTree) := [
  (mustParsePath "RRRURRUUURRU", 9, region_0220),
  (mustParsePath "RRRURRUUURU", 10, region_0221),
  (mustParsePath "RRRURURRRRR", 10, region_0222),
  (mustParsePath "RRRURURRRRUR", 9, region_0223)
]

theorem regionsPart055_valid : ∀ region ∈ regionsPart055,
    region.1.length + region.2.1 = 21 ∧
      region.2.2.check 11 10 classes region.2.1 region.1 = true := by
  intro region h
  simp only [regionsPart055, List.mem_cons, List.mem_nil_iff, or_false] at h
  rcases h with rfl | rfl | rfl | rfl
  · exact ⟨by decide, region_0220_check⟩
  · exact ⟨by decide, region_0221_check⟩
  · exact ⟨by decide, region_0222_check⟩
  · exact ⟨by decide, region_0223_check⟩

end LatticePathOrders.GeneratedMinimality_11_10

