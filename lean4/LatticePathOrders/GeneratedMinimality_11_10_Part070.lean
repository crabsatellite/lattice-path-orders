import LatticePathOrders.GeneratedMinimality_11_10_Part070_Region0280
import LatticePathOrders.GeneratedMinimality_11_10_Part070_Region0281
import LatticePathOrders.GeneratedMinimality_11_10_Part070_Region0282
import LatticePathOrders.GeneratedMinimality_11_10_Part070_Region0283

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_11_10

def regionsPart070 : List (Path × Nat × AssignmentTree) := [
  (mustParsePath "RRRUURURRRRR", 9, region_0280),
  (mustParsePath "RRRUURURRRRU", 9, region_0281),
  (mustParsePath "RRRUURURRRUR", 9, region_0282),
  (mustParsePath "RRRUURURRRUU", 9, region_0283)
]

theorem regionsPart070_valid : ∀ region ∈ regionsPart070,
    region.1.length + region.2.1 = 21 ∧
      region.2.2.check 11 10 classes region.2.1 region.1 = true := by
  intro region h
  simp only [regionsPart070, List.mem_cons, List.mem_nil_iff, or_false] at h
  rcases h with rfl | rfl | rfl | rfl
  · exact ⟨by decide, region_0280_check⟩
  · exact ⟨by decide, region_0281_check⟩
  · exact ⟨by decide, region_0282_check⟩
  · exact ⟨by decide, region_0283_check⟩

end LatticePathOrders.GeneratedMinimality_11_10

