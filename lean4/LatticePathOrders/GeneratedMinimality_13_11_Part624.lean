import LatticePathOrders.GeneratedMinimality_13_11_Part624_Region2496
import LatticePathOrders.GeneratedMinimality_13_11_Part624_Region2497
import LatticePathOrders.GeneratedMinimality_13_11_Part624_Region2498
import LatticePathOrders.GeneratedMinimality_13_11_Part624_Region2499

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_13_11

def regionsPart624 : List (Path × Nat × AssignmentTree) := [
  (mustParsePath "RRURURURURRRRRU", 9, region_2496),
  (mustParsePath "RRURURURURRRRUR", 9, region_2497),
  (mustParsePath "RRURURURURRRRUU", 9, region_2498),
  (mustParsePath "RRURURURURRRURR", 9, region_2499)
]

theorem regionsPart624_valid : ∀ region ∈ regionsPart624,
    region.1.length + region.2.1 = 24 ∧
      region.2.2.check 13 11 classes region.2.1 region.1 = true := by
  intro region h
  simp only [regionsPart624, List.mem_cons, List.mem_nil_iff, or_false] at h
  rcases h with rfl | rfl | rfl | rfl
  · exact ⟨by decide, region_2496_check⟩
  · exact ⟨by decide, region_2497_check⟩
  · exact ⟨by decide, region_2498_check⟩
  · exact ⟨by decide, region_2499_check⟩

end LatticePathOrders.GeneratedMinimality_13_11

