import LatticePathOrders.GeneratedMinimality_11_10_Part091_Region0364
import LatticePathOrders.GeneratedMinimality_11_10_Part091_Region0365
import LatticePathOrders.GeneratedMinimality_11_10_Part091_Region0366
import LatticePathOrders.GeneratedMinimality_11_10_Part091_Region0367

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_11_10

def regionsPart091 : List (Path × Nat × AssignmentTree) := [
  (mustParsePath "RRURRUURRRRU", 9, region_0364),
  (mustParsePath "RRURRUURRRUR", 9, region_0365),
  (mustParsePath "RRURRUURRRUU", 9, region_0366),
  (mustParsePath "RRURRUURRURR", 9, region_0367)
]

theorem regionsPart091_valid : ∀ region ∈ regionsPart091,
    region.1.length + region.2.1 = 21 ∧
      region.2.2.check 11 10 classes region.2.1 region.1 = true := by
  intro region h
  simp only [regionsPart091, List.mem_cons, List.mem_nil_iff, or_false] at h
  rcases h with rfl | rfl | rfl | rfl
  · exact ⟨by decide, region_0364_check⟩
  · exact ⟨by decide, region_0365_check⟩
  · exact ⟨by decide, region_0366_check⟩
  · exact ⟨by decide, region_0367_check⟩

end LatticePathOrders.GeneratedMinimality_11_10

