import LatticePathOrders.GeneratedMinimality_11_10_Part012_Region0048
import LatticePathOrders.GeneratedMinimality_11_10_Part012_Region0049
import LatticePathOrders.GeneratedMinimality_11_10_Part012_Region0050
import LatticePathOrders.GeneratedMinimality_11_10_Part012_Region0051

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_11_10

def regionsPart012 : List (Path × Nat × AssignmentTree) := [
  (mustParsePath "RRRRRURRUURR", 9, region_0048),
  (mustParsePath "RRRRRURRUURU", 9, region_0049),
  (mustParsePath "RRRRRURRUUUR", 9, region_0050),
  (mustParsePath "RRRRRURRUUUU", 9, region_0051)
]

theorem regionsPart012_valid : ∀ region ∈ regionsPart012,
    region.1.length + region.2.1 = 21 ∧
      region.2.2.check 11 10 classes region.2.1 region.1 = true := by
  intro region h
  simp only [regionsPart012, List.mem_cons, List.mem_nil_iff, or_false] at h
  rcases h with rfl | rfl | rfl | rfl
  · exact ⟨by decide, region_0048_check⟩
  · exact ⟨by decide, region_0049_check⟩
  · exact ⟨by decide, region_0050_check⟩
  · exact ⟨by decide, region_0051_check⟩

end LatticePathOrders.GeneratedMinimality_11_10

