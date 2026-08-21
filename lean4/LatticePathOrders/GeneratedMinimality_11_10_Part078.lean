import LatticePathOrders.GeneratedMinimality_11_10_Part078_Region0312
import LatticePathOrders.GeneratedMinimality_11_10_Part078_Region0313
import LatticePathOrders.GeneratedMinimality_11_10_Part078_Region0314
import LatticePathOrders.GeneratedMinimality_11_10_Part078_Region0315

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_11_10

def regionsPart078 : List (Path × Nat × AssignmentTree) := [
  (mustParsePath "RRURRRRUUURR", 9, region_0312),
  (mustParsePath "RRURRRRUUURU", 9, region_0313),
  (mustParsePath "RRURRRRUUUU", 10, region_0314),
  (mustParsePath "RRURRRURRRR", 10, region_0315)
]

theorem regionsPart078_valid : ∀ region ∈ regionsPart078,
    region.1.length + region.2.1 = 21 ∧
      region.2.2.check 11 10 classes region.2.1 region.1 = true := by
  intro region h
  simp only [regionsPart078, List.mem_cons, List.mem_nil_iff, or_false] at h
  rcases h with rfl | rfl | rfl | rfl
  · exact ⟨by decide, region_0312_check⟩
  · exact ⟨by decide, region_0313_check⟩
  · exact ⟨by decide, region_0314_check⟩
  · exact ⟨by decide, region_0315_check⟩

end LatticePathOrders.GeneratedMinimality_11_10

