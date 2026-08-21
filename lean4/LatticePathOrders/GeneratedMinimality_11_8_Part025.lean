import LatticePathOrders.GeneratedMinimality_11_8_Part025_Region0100

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_11_8

def regionsPart025 : List (Path × Nat × AssignmentTree) := [
  (mustParsePath "RRURURRURU", 9, region_0100)
]

theorem regionsPart025_valid : ∀ region ∈ regionsPart025,
    region.1.length + region.2.1 = 19 ∧
      region.2.2.check 11 8 classes region.2.1 region.1 = true := by
  intro region h
  simp only [regionsPart025, List.mem_cons, List.mem_nil_iff, or_false] at h
  rcases h with rfl
  · exact ⟨by decide, region_0100_check⟩

end LatticePathOrders.GeneratedMinimality_11_8

