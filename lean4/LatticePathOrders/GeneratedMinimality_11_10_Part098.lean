import LatticePathOrders.GeneratedMinimality_11_10_Part098_Region0392
import LatticePathOrders.GeneratedMinimality_11_10_Part098_Region0393
import LatticePathOrders.GeneratedMinimality_11_10_Part098_Region0394
import LatticePathOrders.GeneratedMinimality_11_10_Part098_Region0395

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_11_10

def regionsPart098 : List (Path × Nat × AssignmentTree) := [
  (mustParsePath "RRURURRURURU", 9, region_0392),
  (mustParsePath "RRURURRURUU", 10, region_0393),
  (mustParsePath "RRURURRUURRR", 9, region_0394),
  (mustParsePath "RRURURRUURRU", 9, region_0395)
]

theorem regionsPart098_valid : ∀ region ∈ regionsPart098,
    region.1.length + region.2.1 = 21 ∧
      region.2.2.check 11 10 classes region.2.1 region.1 = true := by
  intro region h
  simp only [regionsPart098, List.mem_cons, List.mem_nil_iff, or_false] at h
  rcases h with rfl | rfl | rfl | rfl
  · exact ⟨by decide, region_0392_check⟩
  · exact ⟨by decide, region_0393_check⟩
  · exact ⟨by decide, region_0394_check⟩
  · exact ⟨by decide, region_0395_check⟩

end LatticePathOrders.GeneratedMinimality_11_10

