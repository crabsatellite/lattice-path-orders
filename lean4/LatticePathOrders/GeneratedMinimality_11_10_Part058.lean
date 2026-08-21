import LatticePathOrders.GeneratedMinimality_11_10_Part058_Region0232
import LatticePathOrders.GeneratedMinimality_11_10_Part058_Region0233
import LatticePathOrders.GeneratedMinimality_11_10_Part058_Region0234
import LatticePathOrders.GeneratedMinimality_11_10_Part058_Region0235

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_11_10

def regionsPart058 : List (Path × Nat × AssignmentTree) := [
  (mustParsePath "RRRURURRURUU", 9, region_0232),
  (mustParsePath "RRRURURRUURR", 9, region_0233),
  (mustParsePath "RRRURURRUURU", 9, region_0234),
  (mustParsePath "RRRURURRUUU", 10, region_0235)
]

theorem regionsPart058_valid : ∀ region ∈ regionsPart058,
    region.1.length + region.2.1 = 21 ∧
      region.2.2.check 11 10 classes region.2.1 region.1 = true := by
  intro region h
  simp only [regionsPart058, List.mem_cons, List.mem_nil_iff, or_false] at h
  rcases h with rfl | rfl | rfl | rfl
  · exact ⟨by decide, region_0232_check⟩
  · exact ⟨by decide, region_0233_check⟩
  · exact ⟨by decide, region_0234_check⟩
  · exact ⟨by decide, region_0235_check⟩

end LatticePathOrders.GeneratedMinimality_11_10

