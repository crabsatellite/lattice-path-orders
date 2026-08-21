import LatticePathOrders.GeneratedMinimality_10_9_Part029_Region0116

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_10_9

def regionsPart029 : List (Path × Nat × AssignmentTree) := [
  (mustParsePath "RRURURURU", 10, region_0116)
]

theorem regionsPart029_valid : ∀ region ∈ regionsPart029,
    region.1.length + region.2.1 = 19 ∧
      region.2.2.check 10 9 classes region.2.1 region.1 = true := by
  intro region h
  simp only [regionsPart029, List.mem_cons, List.mem_nil_iff, or_false] at h
  rcases h with rfl
  · exact ⟨by decide, region_0116_check⟩

end LatticePathOrders.GeneratedMinimality_10_9

