import LatticePathOrders.GeneratedMinimality_11_10_Part080_Region0320
import LatticePathOrders.GeneratedMinimality_11_10_Part080_Region0321
import LatticePathOrders.GeneratedMinimality_11_10_Part080_Region0322
import LatticePathOrders.GeneratedMinimality_11_10_Part080_Region0323

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_11_10

def regionsPart080 : List (Path × Nat × AssignmentTree) := [
  (mustParsePath "RRURRRURRUUR", 9, region_0320),
  (mustParsePath "RRURRRURRUUU", 9, region_0321),
  (mustParsePath "RRURRRURURRR", 9, region_0322),
  (mustParsePath "RRURRRURURRU", 9, region_0323)
]

theorem regionsPart080_valid : ∀ region ∈ regionsPart080,
    region.1.length + region.2.1 = 21 ∧
      region.2.2.check 11 10 classes region.2.1 region.1 = true := by
  intro region h
  simp only [regionsPart080, List.mem_cons, List.mem_nil_iff, or_false] at h
  rcases h with rfl | rfl | rfl | rfl
  · exact ⟨by decide, region_0320_check⟩
  · exact ⟨by decide, region_0321_check⟩
  · exact ⟨by decide, region_0322_check⟩
  · exact ⟨by decide, region_0323_check⟩

end LatticePathOrders.GeneratedMinimality_11_10

