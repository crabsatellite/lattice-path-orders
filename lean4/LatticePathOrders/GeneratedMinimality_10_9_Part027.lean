import LatticePathOrders.GeneratedMinimality_10_9_Part027_Region0108
import LatticePathOrders.GeneratedMinimality_10_9_Part027_Region0109
import LatticePathOrders.GeneratedMinimality_10_9_Part027_Region0110
import LatticePathOrders.GeneratedMinimality_10_9_Part027_Region0111

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_10_9

def regionsPart027 : List (Path × Nat × AssignmentTree) := [
  (mustParsePath "RRURURRRRU", 9, region_0108),
  (mustParsePath "RRURURRRUR", 9, region_0109),
  (mustParsePath "RRURURRRUU", 9, region_0110),
  (mustParsePath "RRURURRURR", 9, region_0111)
]

theorem regionsPart027_valid : ∀ region ∈ regionsPart027,
    region.1.length + region.2.1 = 19 ∧
      region.2.2.check 10 9 classes region.2.1 region.1 = true := by
  intro region h
  simp only [regionsPart027, List.mem_cons, List.mem_nil_iff, or_false] at h
  rcases h with rfl | rfl | rfl | rfl
  · exact ⟨by decide, region_0108_check⟩
  · exact ⟨by decide, region_0109_check⟩
  · exact ⟨by decide, region_0110_check⟩
  · exact ⟨by decide, region_0111_check⟩

end LatticePathOrders.GeneratedMinimality_10_9

