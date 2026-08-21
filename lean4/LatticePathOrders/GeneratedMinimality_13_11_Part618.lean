import LatticePathOrders.GeneratedMinimality_13_11_Part618_Region2472
import LatticePathOrders.GeneratedMinimality_13_11_Part618_Region2473
import LatticePathOrders.GeneratedMinimality_13_11_Part618_Region2474
import LatticePathOrders.GeneratedMinimality_13_11_Part618_Region2475

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_13_11

def regionsPart618 : List (Path × Nat × AssignmentTree) := [
  (mustParsePath "RRURURURRRURRRR", 9, region_2472),
  (mustParsePath "RRURURURRRURRRU", 9, region_2473),
  (mustParsePath "RRURURURRRURRUR", 9, region_2474),
  (mustParsePath "RRURURURRRURRUU", 9, region_2475)
]

theorem regionsPart618_valid : ∀ region ∈ regionsPart618,
    region.1.length + region.2.1 = 24 ∧
      region.2.2.check 13 11 classes region.2.1 region.1 = true := by
  intro region h
  simp only [regionsPart618, List.mem_cons, List.mem_nil_iff, or_false] at h
  rcases h with rfl | rfl | rfl | rfl
  · exact ⟨by decide, region_2472_check⟩
  · exact ⟨by decide, region_2473_check⟩
  · exact ⟨by decide, region_2474_check⟩
  · exact ⟨by decide, region_2475_check⟩

end LatticePathOrders.GeneratedMinimality_13_11

