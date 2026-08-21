import LatticePathOrders.GeneratedMinimality_13_11_Part621_Region2484
import LatticePathOrders.GeneratedMinimality_13_11_Part621_Region2485
import LatticePathOrders.GeneratedMinimality_13_11_Part621_Region2486
import LatticePathOrders.GeneratedMinimality_13_11_Part621_Region2487

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_13_11

def regionsPart621 : List (Path × Nat × AssignmentTree) := [
  (mustParsePath "RRURURURRURRRUR", 9, region_2484),
  (mustParsePath "RRURURURRURRRUU", 9, region_2485),
  (mustParsePath "RRURURURRURRURR", 9, region_2486),
  (mustParsePath "RRURURURRURRURU", 9, region_2487)
]

theorem regionsPart621_valid : ∀ region ∈ regionsPart621,
    region.1.length + region.2.1 = 24 ∧
      region.2.2.check 13 11 classes region.2.1 region.1 = true := by
  intro region h
  simp only [regionsPart621, List.mem_cons, List.mem_nil_iff, or_false] at h
  rcases h with rfl | rfl | rfl | rfl
  · exact ⟨by decide, region_2484_check⟩
  · exact ⟨by decide, region_2485_check⟩
  · exact ⟨by decide, region_2486_check⟩
  · exact ⟨by decide, region_2487_check⟩

end LatticePathOrders.GeneratedMinimality_13_11

