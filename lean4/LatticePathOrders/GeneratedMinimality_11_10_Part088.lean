import LatticePathOrders.GeneratedMinimality_11_10_Part088_Region0352
import LatticePathOrders.GeneratedMinimality_11_10_Part088_Region0353
import LatticePathOrders.GeneratedMinimality_11_10_Part088_Region0354
import LatticePathOrders.GeneratedMinimality_11_10_Part088_Region0355

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_11_10

def regionsPart088 : List (Path × Nat × AssignmentTree) := [
  (mustParsePath "RRURRURRUUU", 10, region_0352),
  (mustParsePath "RRURRURURRRR", 9, region_0353),
  (mustParsePath "RRURRURURRRU", 9, region_0354),
  (mustParsePath "RRURRURURRUR", 9, region_0355)
]

theorem regionsPart088_valid : ∀ region ∈ regionsPart088,
    region.1.length + region.2.1 = 21 ∧
      region.2.2.check 11 10 classes region.2.1 region.1 = true := by
  intro region h
  simp only [regionsPart088, List.mem_cons, List.mem_nil_iff, or_false] at h
  rcases h with rfl | rfl | rfl | rfl
  · exact ⟨by decide, region_0352_check⟩
  · exact ⟨by decide, region_0353_check⟩
  · exact ⟨by decide, region_0354_check⟩
  · exact ⟨by decide, region_0355_check⟩

end LatticePathOrders.GeneratedMinimality_11_10

