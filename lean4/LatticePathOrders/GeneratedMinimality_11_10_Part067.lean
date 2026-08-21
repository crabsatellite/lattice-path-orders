import LatticePathOrders.GeneratedMinimality_11_10_Part067_Region0268
import LatticePathOrders.GeneratedMinimality_11_10_Part067_Region0269
import LatticePathOrders.GeneratedMinimality_11_10_Part067_Region0270
import LatticePathOrders.GeneratedMinimality_11_10_Part067_Region0271

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_11_10

def regionsPart067 : List (Path × Nat × AssignmentTree) := [
  (mustParsePath "RRRUURRRUURU", 9, region_0268),
  (mustParsePath "RRRUURRRUUU", 10, region_0269),
  (mustParsePath "RRRUURRURRRR", 9, region_0270),
  (mustParsePath "RRRUURRURRRU", 9, region_0271)
]

theorem regionsPart067_valid : ∀ region ∈ regionsPart067,
    region.1.length + region.2.1 = 21 ∧
      region.2.2.check 11 10 classes region.2.1 region.1 = true := by
  intro region h
  simp only [regionsPart067, List.mem_cons, List.mem_nil_iff, or_false] at h
  rcases h with rfl | rfl | rfl | rfl
  · exact ⟨by decide, region_0268_check⟩
  · exact ⟨by decide, region_0269_check⟩
  · exact ⟨by decide, region_0270_check⟩
  · exact ⟨by decide, region_0271_check⟩

end LatticePathOrders.GeneratedMinimality_11_10

