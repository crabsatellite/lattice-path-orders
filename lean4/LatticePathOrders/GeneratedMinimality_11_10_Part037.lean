import LatticePathOrders.GeneratedMinimality_11_10_Part037_Region0148
import LatticePathOrders.GeneratedMinimality_11_10_Part037_Region0149
import LatticePathOrders.GeneratedMinimality_11_10_Part037_Region0150
import LatticePathOrders.GeneratedMinimality_11_10_Part037_Region0151

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_11_10

def regionsPart037 : List (Path × Nat × AssignmentTree) := [
  (mustParsePath "RRRRUURRURUR", 9, region_0148),
  (mustParsePath "RRRRUURRURUU", 9, region_0149),
  (mustParsePath "RRRRUURRUURR", 9, region_0150),
  (mustParsePath "RRRRUURRUURU", 9, region_0151)
]

theorem regionsPart037_valid : ∀ region ∈ regionsPart037,
    region.1.length + region.2.1 = 21 ∧
      region.2.2.check 11 10 classes region.2.1 region.1 = true := by
  intro region h
  simp only [regionsPart037, List.mem_cons, List.mem_nil_iff, or_false] at h
  rcases h with rfl | rfl | rfl | rfl
  · exact ⟨by decide, region_0148_check⟩
  · exact ⟨by decide, region_0149_check⟩
  · exact ⟨by decide, region_0150_check⟩
  · exact ⟨by decide, region_0151_check⟩

end LatticePathOrders.GeneratedMinimality_11_10

