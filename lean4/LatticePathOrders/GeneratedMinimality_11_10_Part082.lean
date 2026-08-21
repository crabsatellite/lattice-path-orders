import LatticePathOrders.GeneratedMinimality_11_10_Part082_Region0328
import LatticePathOrders.GeneratedMinimality_11_10_Part082_Region0329
import LatticePathOrders.GeneratedMinimality_11_10_Part082_Region0330
import LatticePathOrders.GeneratedMinimality_11_10_Part082_Region0331

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_11_10

def regionsPart082 : List (Path × Nat × AssignmentTree) := [
  (mustParsePath "RRURRRURUUU", 10, region_0328),
  (mustParsePath "RRURRRUURRRR", 9, region_0329),
  (mustParsePath "RRURRRUURRRU", 9, region_0330),
  (mustParsePath "RRURRRUURRUR", 9, region_0331)
]

theorem regionsPart082_valid : ∀ region ∈ regionsPart082,
    region.1.length + region.2.1 = 21 ∧
      region.2.2.check 11 10 classes region.2.1 region.1 = true := by
  intro region h
  simp only [regionsPart082, List.mem_cons, List.mem_nil_iff, or_false] at h
  rcases h with rfl | rfl | rfl | rfl
  · exact ⟨by decide, region_0328_check⟩
  · exact ⟨by decide, region_0329_check⟩
  · exact ⟨by decide, region_0330_check⟩
  · exact ⟨by decide, region_0331_check⟩

end LatticePathOrders.GeneratedMinimality_11_10

