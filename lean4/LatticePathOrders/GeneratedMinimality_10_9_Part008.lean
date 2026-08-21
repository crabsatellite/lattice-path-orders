import LatticePathOrders.GeneratedMinimality_10_9_Part008_Region0032
import LatticePathOrders.GeneratedMinimality_10_9_Part008_Region0033
import LatticePathOrders.GeneratedMinimality_10_9_Part008_Region0034
import LatticePathOrders.GeneratedMinimality_10_9_Part008_Region0035

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_10_9

def regionsPart008 : List (Path × Nat × AssignmentTree) := [
  (mustParsePath "RRRRURURRR", 9, region_0032),
  (mustParsePath "RRRRURURRU", 9, region_0033),
  (mustParsePath "RRRRURURUR", 9, region_0034),
  (mustParsePath "RRRRURURUU", 9, region_0035)
]

theorem regionsPart008_valid : ∀ region ∈ regionsPart008,
    region.1.length + region.2.1 = 19 ∧
      region.2.2.check 10 9 classes region.2.1 region.1 = true := by
  intro region h
  simp only [regionsPart008, List.mem_cons, List.mem_nil_iff, or_false] at h
  rcases h with rfl | rfl | rfl | rfl
  · exact ⟨by decide, region_0032_check⟩
  · exact ⟨by decide, region_0033_check⟩
  · exact ⟨by decide, region_0034_check⟩
  · exact ⟨by decide, region_0035_check⟩

end LatticePathOrders.GeneratedMinimality_10_9

