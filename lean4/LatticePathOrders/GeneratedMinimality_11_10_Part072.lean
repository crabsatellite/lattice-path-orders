import LatticePathOrders.GeneratedMinimality_11_10_Part072_Region0288
import LatticePathOrders.GeneratedMinimality_11_10_Part072_Region0289
import LatticePathOrders.GeneratedMinimality_11_10_Part072_Region0290
import LatticePathOrders.GeneratedMinimality_11_10_Part072_Region0291

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_11_10

def regionsPart072 : List (Path × Nat × AssignmentTree) := [
  (mustParsePath "RRRUURURURRU", 9, region_0288),
  (mustParsePath "RRRUURURURU", 10, region_0289),
  (mustParsePath "RRURRRRRRR", 11, region_0290),
  (mustParsePath "RRURRRRRRUR", 10, region_0291)
]

theorem regionsPart072_valid : ∀ region ∈ regionsPart072,
    region.1.length + region.2.1 = 21 ∧
      region.2.2.check 11 10 classes region.2.1 region.1 = true := by
  intro region h
  simp only [regionsPart072, List.mem_cons, List.mem_nil_iff, or_false] at h
  rcases h with rfl | rfl | rfl | rfl
  · exact ⟨by decide, region_0288_check⟩
  · exact ⟨by decide, region_0289_check⟩
  · exact ⟨by decide, region_0290_check⟩
  · exact ⟨by decide, region_0291_check⟩

end LatticePathOrders.GeneratedMinimality_11_10

