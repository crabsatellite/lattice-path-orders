import LatticePathOrders.GeneratedMinimality_11_10_Part042_Region0168
import LatticePathOrders.GeneratedMinimality_11_10_Part042_Region0169
import LatticePathOrders.GeneratedMinimality_11_10_Part042_Region0170
import LatticePathOrders.GeneratedMinimality_11_10_Part042_Region0171

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_11_10

def regionsPart042 : List (Path × Nat × AssignmentTree) := [
  (mustParsePath "RRRRUUURRURU", 9, region_0168),
  (mustParsePath "RRRRUUURRUU", 10, region_0169),
  (mustParsePath "RRRRUUURURRR", 9, region_0170),
  (mustParsePath "RRRRUUURURRU", 9, region_0171)
]

theorem regionsPart042_valid : ∀ region ∈ regionsPart042,
    region.1.length + region.2.1 = 21 ∧
      region.2.2.check 11 10 classes region.2.1 region.1 = true := by
  intro region h
  simp only [regionsPart042, List.mem_cons, List.mem_nil_iff, or_false] at h
  rcases h with rfl | rfl | rfl | rfl
  · exact ⟨by decide, region_0168_check⟩
  · exact ⟨by decide, region_0169_check⟩
  · exact ⟨by decide, region_0170_check⟩
  · exact ⟨by decide, region_0171_check⟩

end LatticePathOrders.GeneratedMinimality_11_10

