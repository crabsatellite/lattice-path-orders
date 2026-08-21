import LatticePathOrders.GeneratedMinimality_11_10_Part096_Region0384
import LatticePathOrders.GeneratedMinimality_11_10_Part096_Region0385
import LatticePathOrders.GeneratedMinimality_11_10_Part096_Region0386
import LatticePathOrders.GeneratedMinimality_11_10_Part096_Region0387

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_11_10

def regionsPart096 : List (Path × Nat × AssignmentTree) := [
  (mustParsePath "RRURURRRUURR", 9, region_0384),
  (mustParsePath "RRURURRRUURU", 9, region_0385),
  (mustParsePath "RRURURRRUUU", 10, region_0386),
  (mustParsePath "RRURURRURRRR", 9, region_0387)
]

theorem regionsPart096_valid : ∀ region ∈ regionsPart096,
    region.1.length + region.2.1 = 21 ∧
      region.2.2.check 11 10 classes region.2.1 region.1 = true := by
  intro region h
  simp only [regionsPart096, List.mem_cons, List.mem_nil_iff, or_false] at h
  rcases h with rfl | rfl | rfl | rfl
  · exact ⟨by decide, region_0384_check⟩
  · exact ⟨by decide, region_0385_check⟩
  · exact ⟨by decide, region_0386_check⟩
  · exact ⟨by decide, region_0387_check⟩

end LatticePathOrders.GeneratedMinimality_11_10

