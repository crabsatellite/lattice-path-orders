import LatticePathOrders.GeneratedMinimality_13_11_Part012_Region0048
import LatticePathOrders.GeneratedMinimality_13_11_Part012_Region0049
import LatticePathOrders.GeneratedMinimality_13_11_Part012_Region0050
import LatticePathOrders.GeneratedMinimality_13_11_Part012_Region0051

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_13_11

def regionsPart012 : List (Path × Nat × AssignmentTree) := [
  (mustParsePath "RRRRRRRRUURUUUR", 9, region_0048),
  (mustParsePath "RRRRRRRRUURUUUU", 9, region_0049),
  (mustParsePath "RRRRRRRRUUURRR", 10, region_0050),
  (mustParsePath "RRRRRRRRUUURRUR", 9, region_0051)
]

theorem regionsPart012_valid : ∀ region ∈ regionsPart012,
    region.1.length + region.2.1 = 24 ∧
      region.2.2.check 13 11 classes region.2.1 region.1 = true := by
  intro region h
  simp only [regionsPart012, List.mem_cons, List.mem_nil_iff, or_false] at h
  rcases h with rfl | rfl | rfl | rfl
  · exact ⟨by decide, region_0048_check⟩
  · exact ⟨by decide, region_0049_check⟩
  · exact ⟨by decide, region_0050_check⟩
  · exact ⟨by decide, region_0051_check⟩

end LatticePathOrders.GeneratedMinimality_13_11

