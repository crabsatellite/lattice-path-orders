import LatticePathOrders.GeneratedMinimality_11_10_Part073_Region0292
import LatticePathOrders.GeneratedMinimality_11_10_Part073_Region0293
import LatticePathOrders.GeneratedMinimality_11_10_Part073_Region0294
import LatticePathOrders.GeneratedMinimality_11_10_Part073_Region0295

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_11_10

def regionsPart073 : List (Path × Nat × AssignmentTree) := [
  (mustParsePath "RRURRRRRRUUR", 9, region_0292),
  (mustParsePath "RRURRRRRRUUU", 9, region_0293),
  (mustParsePath "RRURRRRRURR", 10, region_0294),
  (mustParsePath "RRURRRRRURUR", 9, region_0295)
]

theorem regionsPart073_valid : ∀ region ∈ regionsPart073,
    region.1.length + region.2.1 = 21 ∧
      region.2.2.check 11 10 classes region.2.1 region.1 = true := by
  intro region h
  simp only [regionsPart073, List.mem_cons, List.mem_nil_iff, or_false] at h
  rcases h with rfl | rfl | rfl | rfl
  · exact ⟨by decide, region_0292_check⟩
  · exact ⟨by decide, region_0293_check⟩
  · exact ⟨by decide, region_0294_check⟩
  · exact ⟨by decide, region_0295_check⟩

end LatticePathOrders.GeneratedMinimality_11_10

