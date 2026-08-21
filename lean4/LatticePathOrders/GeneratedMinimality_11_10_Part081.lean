import LatticePathOrders.GeneratedMinimality_11_10_Part081_Region0324
import LatticePathOrders.GeneratedMinimality_11_10_Part081_Region0325
import LatticePathOrders.GeneratedMinimality_11_10_Part081_Region0326
import LatticePathOrders.GeneratedMinimality_11_10_Part081_Region0327

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_11_10

def regionsPart081 : List (Path × Nat × AssignmentTree) := [
  (mustParsePath "RRURRRURURUR", 9, region_0324),
  (mustParsePath "RRURRRURURUU", 9, region_0325),
  (mustParsePath "RRURRRURUURR", 9, region_0326),
  (mustParsePath "RRURRRURUURU", 9, region_0327)
]

theorem regionsPart081_valid : ∀ region ∈ regionsPart081,
    region.1.length + region.2.1 = 21 ∧
      region.2.2.check 11 10 classes region.2.1 region.1 = true := by
  intro region h
  simp only [regionsPart081, List.mem_cons, List.mem_nil_iff, or_false] at h
  rcases h with rfl | rfl | rfl | rfl
  · exact ⟨by decide, region_0324_check⟩
  · exact ⟨by decide, region_0325_check⟩
  · exact ⟨by decide, region_0326_check⟩
  · exact ⟨by decide, region_0327_check⟩

end LatticePathOrders.GeneratedMinimality_11_10

