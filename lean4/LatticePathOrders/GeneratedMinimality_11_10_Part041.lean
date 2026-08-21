import LatticePathOrders.GeneratedMinimality_11_10_Part041_Region0164
import LatticePathOrders.GeneratedMinimality_11_10_Part041_Region0165
import LatticePathOrders.GeneratedMinimality_11_10_Part041_Region0166
import LatticePathOrders.GeneratedMinimality_11_10_Part041_Region0167

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_11_10

def regionsPart041 : List (Path × Nat × AssignmentTree) := [
  (mustParsePath "RRRRUUURRRRU", 9, region_0164),
  (mustParsePath "RRRRUUURRRUR", 9, region_0165),
  (mustParsePath "RRRRUUURRRUU", 9, region_0166),
  (mustParsePath "RRRRUUURRURR", 9, region_0167)
]

theorem regionsPart041_valid : ∀ region ∈ regionsPart041,
    region.1.length + region.2.1 = 21 ∧
      region.2.2.check 11 10 classes region.2.1 region.1 = true := by
  intro region h
  simp only [regionsPart041, List.mem_cons, List.mem_nil_iff, or_false] at h
  rcases h with rfl | rfl | rfl | rfl
  · exact ⟨by decide, region_0164_check⟩
  · exact ⟨by decide, region_0165_check⟩
  · exact ⟨by decide, region_0166_check⟩
  · exact ⟨by decide, region_0167_check⟩

end LatticePathOrders.GeneratedMinimality_11_10

