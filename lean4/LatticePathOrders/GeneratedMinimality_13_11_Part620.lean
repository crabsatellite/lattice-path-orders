import LatticePathOrders.GeneratedMinimality_13_11_Part620_Region2480
import LatticePathOrders.GeneratedMinimality_13_11_Part620_Region2481
import LatticePathOrders.GeneratedMinimality_13_11_Part620_Region2482
import LatticePathOrders.GeneratedMinimality_13_11_Part620_Region2483

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_13_11

def regionsPart620 : List (Path × Nat × AssignmentTree) := [
  (mustParsePath "RRURURURRRUURRU", 9, region_2480),
  (mustParsePath "RRURURURRRUURU", 10, region_2481),
  (mustParsePath "RRURURURRURRRRR", 9, region_2482),
  (mustParsePath "RRURURURRURRRRU", 9, region_2483)
]

theorem regionsPart620_valid : ∀ region ∈ regionsPart620,
    region.1.length + region.2.1 = 24 ∧
      region.2.2.check 13 11 classes region.2.1 region.1 = true := by
  intro region h
  simp only [regionsPart620, List.mem_cons, List.mem_nil_iff, or_false] at h
  rcases h with rfl | rfl | rfl | rfl
  · exact ⟨by decide, region_2480_check⟩
  · exact ⟨by decide, region_2481_check⟩
  · exact ⟨by decide, region_2482_check⟩
  · exact ⟨by decide, region_2483_check⟩

end LatticePathOrders.GeneratedMinimality_13_11

