import LatticePathOrders.GeneratedMinimality_11_10_Part097_Region0388
import LatticePathOrders.GeneratedMinimality_11_10_Part097_Region0389
import LatticePathOrders.GeneratedMinimality_11_10_Part097_Region0390
import LatticePathOrders.GeneratedMinimality_11_10_Part097_Region0391

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_11_10

def regionsPart097 : List (Path × Nat × AssignmentTree) := [
  (mustParsePath "RRURURRURRRU", 9, region_0388),
  (mustParsePath "RRURURRURRUR", 9, region_0389),
  (mustParsePath "RRURURRURRUU", 9, region_0390),
  (mustParsePath "RRURURRURURR", 9, region_0391)
]

theorem regionsPart097_valid : ∀ region ∈ regionsPart097,
    region.1.length + region.2.1 = 21 ∧
      region.2.2.check 11 10 classes region.2.1 region.1 = true := by
  intro region h
  simp only [regionsPart097, List.mem_cons, List.mem_nil_iff, or_false] at h
  rcases h with rfl | rfl | rfl | rfl
  · exact ⟨by decide, region_0388_check⟩
  · exact ⟨by decide, region_0389_check⟩
  · exact ⟨by decide, region_0390_check⟩
  · exact ⟨by decide, region_0391_check⟩

end LatticePathOrders.GeneratedMinimality_11_10

