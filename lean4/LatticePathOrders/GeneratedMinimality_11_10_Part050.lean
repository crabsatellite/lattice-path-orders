import LatticePathOrders.GeneratedMinimality_11_10_Part050_Region0200
import LatticePathOrders.GeneratedMinimality_11_10_Part050_Region0201
import LatticePathOrders.GeneratedMinimality_11_10_Part050_Region0202
import LatticePathOrders.GeneratedMinimality_11_10_Part050_Region0203

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_11_10

def regionsPart050 : List (Path × Nat × AssignmentTree) := [
  (mustParsePath "RRRURRURRRUU", 9, region_0200),
  (mustParsePath "RRRURRURRURR", 9, region_0201),
  (mustParsePath "RRRURRURRURU", 9, region_0202),
  (mustParsePath "RRRURRURRUUR", 9, region_0203)
]

theorem regionsPart050_valid : ∀ region ∈ regionsPart050,
    region.1.length + region.2.1 = 21 ∧
      region.2.2.check 11 10 classes region.2.1 region.1 = true := by
  intro region h
  simp only [regionsPart050, List.mem_cons, List.mem_nil_iff, or_false] at h
  rcases h with rfl | rfl | rfl | rfl
  · exact ⟨by decide, region_0200_check⟩
  · exact ⟨by decide, region_0201_check⟩
  · exact ⟨by decide, region_0202_check⟩
  · exact ⟨by decide, region_0203_check⟩

end LatticePathOrders.GeneratedMinimality_11_10

