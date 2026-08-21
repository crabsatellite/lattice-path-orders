import LatticePathOrders.GeneratedMinimality_13_11_Part603_Region2412
import LatticePathOrders.GeneratedMinimality_13_11_Part603_Region2413
import LatticePathOrders.GeneratedMinimality_13_11_Part603_Region2414
import LatticePathOrders.GeneratedMinimality_13_11_Part603_Region2415

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_13_11

def regionsPart603 : List (Path × Nat × AssignmentTree) := [
  (mustParsePath "RRURURRURRRRURU", 9, region_2412),
  (mustParsePath "RRURURRURRRRUUR", 9, region_2413),
  (mustParsePath "RRURURRURRRRUUU", 9, region_2414),
  (mustParsePath "RRURURRURRRURRR", 9, region_2415)
]

theorem regionsPart603_valid : ∀ region ∈ regionsPart603,
    region.1.length + region.2.1 = 24 ∧
      region.2.2.check 13 11 classes region.2.1 region.1 = true := by
  intro region h
  simp only [regionsPart603, List.mem_cons, List.mem_nil_iff, or_false] at h
  rcases h with rfl | rfl | rfl | rfl
  · exact ⟨by decide, region_2412_check⟩
  · exact ⟨by decide, region_2413_check⟩
  · exact ⟨by decide, region_2414_check⟩
  · exact ⟨by decide, region_2415_check⟩

end LatticePathOrders.GeneratedMinimality_13_11

