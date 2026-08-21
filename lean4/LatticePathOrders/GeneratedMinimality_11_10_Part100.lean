import LatticePathOrders.GeneratedMinimality_11_10_Part100_Region0400
import LatticePathOrders.GeneratedMinimality_11_10_Part100_Region0401
import LatticePathOrders.GeneratedMinimality_11_10_Part100_Region0402
import LatticePathOrders.GeneratedMinimality_11_10_Part100_Region0403

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_11_10

def regionsPart100 : List (Path × Nat × AssignmentTree) := [
  (mustParsePath "RRURURURRRUU", 9, region_0400),
  (mustParsePath "RRURURURRURR", 9, region_0401),
  (mustParsePath "RRURURURRURU", 9, region_0402),
  (mustParsePath "RRURURURRUU", 10, region_0403)
]

theorem regionsPart100_valid : ∀ region ∈ regionsPart100,
    region.1.length + region.2.1 = 21 ∧
      region.2.2.check 11 10 classes region.2.1 region.1 = true := by
  intro region h
  simp only [regionsPart100, List.mem_cons, List.mem_nil_iff, or_false] at h
  rcases h with rfl | rfl | rfl | rfl
  · exact ⟨by decide, region_0400_check⟩
  · exact ⟨by decide, region_0401_check⟩
  · exact ⟨by decide, region_0402_check⟩
  · exact ⟨by decide, region_0403_check⟩

end LatticePathOrders.GeneratedMinimality_11_10

