import LatticePathOrders.GeneratedMinimality_11_10_Part032_Region0128
import LatticePathOrders.GeneratedMinimality_11_10_Part032_Region0129
import LatticePathOrders.GeneratedMinimality_11_10_Part032_Region0130
import LatticePathOrders.GeneratedMinimality_11_10_Part032_Region0131

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_11_10

def regionsPart032 : List (Path × Nat × AssignmentTree) := [
  (mustParsePath "RRRRURURUUU", 10, region_0128),
  (mustParsePath "RRRRURUURRRR", 9, region_0129),
  (mustParsePath "RRRRURUURRRU", 9, region_0130),
  (mustParsePath "RRRRURUURRUR", 9, region_0131)
]

theorem regionsPart032_valid : ∀ region ∈ regionsPart032,
    region.1.length + region.2.1 = 21 ∧
      region.2.2.check 11 10 classes region.2.1 region.1 = true := by
  intro region h
  simp only [regionsPart032, List.mem_cons, List.mem_nil_iff, or_false] at h
  rcases h with rfl | rfl | rfl | rfl
  · exact ⟨by decide, region_0128_check⟩
  · exact ⟨by decide, region_0129_check⟩
  · exact ⟨by decide, region_0130_check⟩
  · exact ⟨by decide, region_0131_check⟩

end LatticePathOrders.GeneratedMinimality_11_10

