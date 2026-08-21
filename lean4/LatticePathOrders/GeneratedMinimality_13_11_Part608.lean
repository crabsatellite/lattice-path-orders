import LatticePathOrders.GeneratedMinimality_13_11_Part608_Region2432
import LatticePathOrders.GeneratedMinimality_13_11_Part608_Region2433
import LatticePathOrders.GeneratedMinimality_13_11_Part608_Region2434
import LatticePathOrders.GeneratedMinimality_13_11_Part608_Region2435

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_13_11

def regionsPart608 : List (Path × Nat × AssignmentTree) := [
  (mustParsePath "RRURURRURURRRRR", 9, region_2432),
  (mustParsePath "RRURURRURURRRRU", 9, region_2433),
  (mustParsePath "RRURURRURURRRUR", 9, region_2434),
  (mustParsePath "RRURURRURURRRUU", 9, region_2435)
]

theorem regionsPart608_valid : ∀ region ∈ regionsPart608,
    region.1.length + region.2.1 = 24 ∧
      region.2.2.check 13 11 classes region.2.1 region.1 = true := by
  intro region h
  simp only [regionsPart608, List.mem_cons, List.mem_nil_iff, or_false] at h
  rcases h with rfl | rfl | rfl | rfl
  · exact ⟨by decide, region_2432_check⟩
  · exact ⟨by decide, region_2433_check⟩
  · exact ⟨by decide, region_2434_check⟩
  · exact ⟨by decide, region_2435_check⟩

end LatticePathOrders.GeneratedMinimality_13_11

