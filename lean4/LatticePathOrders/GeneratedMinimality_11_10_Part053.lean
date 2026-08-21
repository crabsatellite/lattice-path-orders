import LatticePathOrders.GeneratedMinimality_11_10_Part053_Region0212
import LatticePathOrders.GeneratedMinimality_11_10_Part053_Region0213
import LatticePathOrders.GeneratedMinimality_11_10_Part053_Region0214
import LatticePathOrders.GeneratedMinimality_11_10_Part053_Region0215

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_11_10

def regionsPart053 : List (Path × Nat × AssignmentTree) := [
  (mustParsePath "RRRURRUURRRR", 9, region_0212),
  (mustParsePath "RRRURRUURRRU", 9, region_0213),
  (mustParsePath "RRRURRUURRUR", 9, region_0214),
  (mustParsePath "RRRURRUURRUU", 9, region_0215)
]

theorem regionsPart053_valid : ∀ region ∈ regionsPart053,
    region.1.length + region.2.1 = 21 ∧
      region.2.2.check 11 10 classes region.2.1 region.1 = true := by
  intro region h
  simp only [regionsPart053, List.mem_cons, List.mem_nil_iff, or_false] at h
  rcases h with rfl | rfl | rfl | rfl
  · exact ⟨by decide, region_0212_check⟩
  · exact ⟨by decide, region_0213_check⟩
  · exact ⟨by decide, region_0214_check⟩
  · exact ⟨by decide, region_0215_check⟩

end LatticePathOrders.GeneratedMinimality_11_10

