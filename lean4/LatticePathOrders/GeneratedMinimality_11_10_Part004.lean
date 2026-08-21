import LatticePathOrders.GeneratedMinimality_11_10_Part004_Region0016
import LatticePathOrders.GeneratedMinimality_11_10_Part004_Region0017
import LatticePathOrders.GeneratedMinimality_11_10_Part004_Region0018
import LatticePathOrders.GeneratedMinimality_11_10_Part004_Region0019

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_11_10

def regionsPart004 : List (Path × Nat × AssignmentTree) := [
  (mustParsePath "RRRRRRURRR", 11, region_0016),
  (mustParsePath "RRRRRRURRUR", 10, region_0017),
  (mustParsePath "RRRRRRURRUUR", 9, region_0018),
  (mustParsePath "RRRRRRURRUUU", 9, region_0019)
]

theorem regionsPart004_valid : ∀ region ∈ regionsPart004,
    region.1.length + region.2.1 = 21 ∧
      region.2.2.check 11 10 classes region.2.1 region.1 = true := by
  intro region h
  simp only [regionsPart004, List.mem_cons, List.mem_nil_iff, or_false] at h
  rcases h with rfl | rfl | rfl | rfl
  · exact ⟨by decide, region_0016_check⟩
  · exact ⟨by decide, region_0017_check⟩
  · exact ⟨by decide, region_0018_check⟩
  · exact ⟨by decide, region_0019_check⟩

end LatticePathOrders.GeneratedMinimality_11_10

