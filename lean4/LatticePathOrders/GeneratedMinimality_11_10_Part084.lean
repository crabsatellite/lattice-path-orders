import LatticePathOrders.GeneratedMinimality_11_10_Part084_Region0336
import LatticePathOrders.GeneratedMinimality_11_10_Part084_Region0337
import LatticePathOrders.GeneratedMinimality_11_10_Part084_Region0338
import LatticePathOrders.GeneratedMinimality_11_10_Part084_Region0339

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_11_10

def regionsPart084 : List (Path × Nat × AssignmentTree) := [
  (mustParsePath "RRURRRUUURRR", 9, region_0336),
  (mustParsePath "RRURRRUUURRU", 9, region_0337),
  (mustParsePath "RRURRRUUURU", 10, region_0338),
  (mustParsePath "RRURRURRRRR", 10, region_0339)
]

theorem regionsPart084_valid : ∀ region ∈ regionsPart084,
    region.1.length + region.2.1 = 21 ∧
      region.2.2.check 11 10 classes region.2.1 region.1 = true := by
  intro region h
  simp only [regionsPart084, List.mem_cons, List.mem_nil_iff, or_false] at h
  rcases h with rfl | rfl | rfl | rfl
  · exact ⟨by decide, region_0336_check⟩
  · exact ⟨by decide, region_0337_check⟩
  · exact ⟨by decide, region_0338_check⟩
  · exact ⟨by decide, region_0339_check⟩

end LatticePathOrders.GeneratedMinimality_11_10

