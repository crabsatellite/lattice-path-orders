import LatticePathOrders.GeneratedMinimality_13_11_Part623_Region2492
import LatticePathOrders.GeneratedMinimality_13_11_Part623_Region2493
import LatticePathOrders.GeneratedMinimality_13_11_Part623_Region2494
import LatticePathOrders.GeneratedMinimality_13_11_Part623_Region2495

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_13_11

def regionsPart623 : List (Path × Nat × AssignmentTree) := [
  (mustParsePath "RRURURURRUURRRR", 9, region_2492),
  (mustParsePath "RRURURURRUURRRU", 9, region_2493),
  (mustParsePath "RRURURURRUURRU", 10, region_2494),
  (mustParsePath "RRURURURURRRRRR", 9, region_2495)
]

theorem regionsPart623_valid : ∀ region ∈ regionsPart623,
    region.1.length + region.2.1 = 24 ∧
      region.2.2.check 13 11 classes region.2.1 region.1 = true := by
  intro region h
  simp only [regionsPart623, List.mem_cons, List.mem_nil_iff, or_false] at h
  rcases h with rfl | rfl | rfl | rfl
  · exact ⟨by decide, region_2492_check⟩
  · exact ⟨by decide, region_2493_check⟩
  · exact ⟨by decide, region_2494_check⟩
  · exact ⟨by decide, region_2495_check⟩

end LatticePathOrders.GeneratedMinimality_13_11

