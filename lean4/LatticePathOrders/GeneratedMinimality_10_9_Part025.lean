import LatticePathOrders.GeneratedMinimality_10_9_Part025_Region0100
import LatticePathOrders.GeneratedMinimality_10_9_Part025_Region0101
import LatticePathOrders.GeneratedMinimality_10_9_Part025_Region0102
import LatticePathOrders.GeneratedMinimality_10_9_Part025_Region0103

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_10_9

def regionsPart025 : List (Path × Nat × AssignmentTree) := [
  (mustParsePath "RRURRURRUU", 9, region_0100),
  (mustParsePath "RRURRURURR", 9, region_0101),
  (mustParsePath "RRURRURURU", 9, region_0102),
  (mustParsePath "RRURRURUU", 10, region_0103)
]

theorem regionsPart025_valid : ∀ region ∈ regionsPart025,
    region.1.length + region.2.1 = 19 ∧
      region.2.2.check 10 9 classes region.2.1 region.1 = true := by
  intro region h
  simp only [regionsPart025, List.mem_cons, List.mem_nil_iff, or_false] at h
  rcases h with rfl | rfl | rfl | rfl
  · exact ⟨by decide, region_0100_check⟩
  · exact ⟨by decide, region_0101_check⟩
  · exact ⟨by decide, region_0102_check⟩
  · exact ⟨by decide, region_0103_check⟩

end LatticePathOrders.GeneratedMinimality_10_9

