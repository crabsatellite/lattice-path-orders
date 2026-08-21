import LatticePathOrders.GeneratedMinimality_13_11_Part607_Region2428
import LatticePathOrders.GeneratedMinimality_13_11_Part607_Region2429
import LatticePathOrders.GeneratedMinimality_13_11_Part607_Region2430
import LatticePathOrders.GeneratedMinimality_13_11_Part607_Region2431

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_13_11

def regionsPart607 : List (Path × Nat × AssignmentTree) := [
  (mustParsePath "RRURURRURRURUU", 10, region_2428),
  (mustParsePath "RRURURRURRUURRR", 9, region_2429),
  (mustParsePath "RRURURRURRUURRU", 9, region_2430),
  (mustParsePath "RRURURRURRUURU", 10, region_2431)
]

theorem regionsPart607_valid : ∀ region ∈ regionsPart607,
    region.1.length + region.2.1 = 24 ∧
      region.2.2.check 13 11 classes region.2.1 region.1 = true := by
  intro region h
  simp only [regionsPart607, List.mem_cons, List.mem_nil_iff, or_false] at h
  rcases h with rfl | rfl | rfl | rfl
  · exact ⟨by decide, region_2428_check⟩
  · exact ⟨by decide, region_2429_check⟩
  · exact ⟨by decide, region_2430_check⟩
  · exact ⟨by decide, region_2431_check⟩

end LatticePathOrders.GeneratedMinimality_13_11

