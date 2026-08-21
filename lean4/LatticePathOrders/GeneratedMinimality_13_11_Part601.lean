import LatticePathOrders.GeneratedMinimality_13_11_Part601_Region2404
import LatticePathOrders.GeneratedMinimality_13_11_Part601_Region2405
import LatticePathOrders.GeneratedMinimality_13_11_Part601_Region2406
import LatticePathOrders.GeneratedMinimality_13_11_Part601_Region2407

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_13_11

def regionsPart601 : List (Path × Nat × AssignmentTree) := [
  (mustParsePath "RRURURRRUURURU", 10, region_2404),
  (mustParsePath "RRURURRRUUURRRR", 9, region_2405),
  (mustParsePath "RRURURRRUUURRRU", 9, region_2406),
  (mustParsePath "RRURURRRUUURRU", 10, region_2407)
]

theorem regionsPart601_valid : ∀ region ∈ regionsPart601,
    region.1.length + region.2.1 = 24 ∧
      region.2.2.check 13 11 classes region.2.1 region.1 = true := by
  intro region h
  simp only [regionsPart601, List.mem_cons, List.mem_nil_iff, or_false] at h
  rcases h with rfl | rfl | rfl | rfl
  · exact ⟨by decide, region_2404_check⟩
  · exact ⟨by decide, region_2405_check⟩
  · exact ⟨by decide, region_2406_check⟩
  · exact ⟨by decide, region_2407_check⟩

end LatticePathOrders.GeneratedMinimality_13_11

