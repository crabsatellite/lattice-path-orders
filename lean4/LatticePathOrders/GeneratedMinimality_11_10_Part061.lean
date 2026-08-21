import LatticePathOrders.GeneratedMinimality_11_10_Part061_Region0244
import LatticePathOrders.GeneratedMinimality_11_10_Part061_Region0245
import LatticePathOrders.GeneratedMinimality_11_10_Part061_Region0246
import LatticePathOrders.GeneratedMinimality_11_10_Part061_Region0247

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_11_10

def regionsPart061 : List (Path × Nat × AssignmentTree) := [
  (mustParsePath "RRRURURUURRU", 9, region_0244),
  (mustParsePath "RRRURURUURU", 10, region_0245),
  (mustParsePath "RRRURUURRRRR", 9, region_0246),
  (mustParsePath "RRRURUURRRRU", 9, region_0247)
]

theorem regionsPart061_valid : ∀ region ∈ regionsPart061,
    region.1.length + region.2.1 = 21 ∧
      region.2.2.check 11 10 classes region.2.1 region.1 = true := by
  intro region h
  simp only [regionsPart061, List.mem_cons, List.mem_nil_iff, or_false] at h
  rcases h with rfl | rfl | rfl | rfl
  · exact ⟨by decide, region_0244_check⟩
  · exact ⟨by decide, region_0245_check⟩
  · exact ⟨by decide, region_0246_check⟩
  · exact ⟨by decide, region_0247_check⟩

end LatticePathOrders.GeneratedMinimality_11_10

