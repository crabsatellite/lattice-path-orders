import LatticePathOrders.GeneratedMinimality_11_10_Part069_Region0276
import LatticePathOrders.GeneratedMinimality_11_10_Part069_Region0277
import LatticePathOrders.GeneratedMinimality_11_10_Part069_Region0278
import LatticePathOrders.GeneratedMinimality_11_10_Part069_Region0279

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_11_10

def regionsPart069 : List (Path × Nat × AssignmentTree) := [
  (mustParsePath "RRRUURRURUU", 10, region_0276),
  (mustParsePath "RRRUURRUURRR", 9, region_0277),
  (mustParsePath "RRRUURRUURRU", 9, region_0278),
  (mustParsePath "RRRUURRUURU", 10, region_0279)
]

theorem regionsPart069_valid : ∀ region ∈ regionsPart069,
    region.1.length + region.2.1 = 21 ∧
      region.2.2.check 11 10 classes region.2.1 region.1 = true := by
  intro region h
  simp only [regionsPart069, List.mem_cons, List.mem_nil_iff, or_false] at h
  rcases h with rfl | rfl | rfl | rfl
  · exact ⟨by decide, region_0276_check⟩
  · exact ⟨by decide, region_0277_check⟩
  · exact ⟨by decide, region_0278_check⟩
  · exact ⟨by decide, region_0279_check⟩

end LatticePathOrders.GeneratedMinimality_11_10

