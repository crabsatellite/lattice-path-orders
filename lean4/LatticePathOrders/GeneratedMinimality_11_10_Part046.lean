import LatticePathOrders.GeneratedMinimality_11_10_Part046_Region0184
import LatticePathOrders.GeneratedMinimality_11_10_Part046_Region0185
import LatticePathOrders.GeneratedMinimality_11_10_Part046_Region0186
import LatticePathOrders.GeneratedMinimality_11_10_Part046_Region0187

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_11_10

def regionsPart046 : List (Path × Nat × AssignmentTree) := [
  (mustParsePath "RRRURRRURRR", 10, region_0184),
  (mustParsePath "RRRURRRURRUR", 9, region_0185),
  (mustParsePath "RRRURRRURRUU", 9, region_0186),
  (mustParsePath "RRRURRRURURR", 9, region_0187)
]

theorem regionsPart046_valid : ∀ region ∈ regionsPart046,
    region.1.length + region.2.1 = 21 ∧
      region.2.2.check 11 10 classes region.2.1 region.1 = true := by
  intro region h
  simp only [regionsPart046, List.mem_cons, List.mem_nil_iff, or_false] at h
  rcases h with rfl | rfl | rfl | rfl
  · exact ⟨by decide, region_0184_check⟩
  · exact ⟨by decide, region_0185_check⟩
  · exact ⟨by decide, region_0186_check⟩
  · exact ⟨by decide, region_0187_check⟩

end LatticePathOrders.GeneratedMinimality_11_10

