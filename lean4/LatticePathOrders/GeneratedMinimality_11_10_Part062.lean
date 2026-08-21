import LatticePathOrders.GeneratedMinimality_11_10_Part062_Region0248
import LatticePathOrders.GeneratedMinimality_11_10_Part062_Region0249
import LatticePathOrders.GeneratedMinimality_11_10_Part062_Region0250
import LatticePathOrders.GeneratedMinimality_11_10_Part062_Region0251

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_11_10

def regionsPart062 : List (Path × Nat × AssignmentTree) := [
  (mustParsePath "RRRURUURRRUR", 9, region_0248),
  (mustParsePath "RRRURUURRRUU", 9, region_0249),
  (mustParsePath "RRRURUURRURR", 9, region_0250),
  (mustParsePath "RRRURUURRURU", 9, region_0251)
]

theorem regionsPart062_valid : ∀ region ∈ regionsPart062,
    region.1.length + region.2.1 = 21 ∧
      region.2.2.check 11 10 classes region.2.1 region.1 = true := by
  intro region h
  simp only [regionsPart062, List.mem_cons, List.mem_nil_iff, or_false] at h
  rcases h with rfl | rfl | rfl | rfl
  · exact ⟨by decide, region_0248_check⟩
  · exact ⟨by decide, region_0249_check⟩
  · exact ⟨by decide, region_0250_check⟩
  · exact ⟨by decide, region_0251_check⟩

end LatticePathOrders.GeneratedMinimality_11_10

