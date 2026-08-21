import LatticePathOrders.GeneratedMinimality_11_10_Part060_Region0240
import LatticePathOrders.GeneratedMinimality_11_10_Part060_Region0241
import LatticePathOrders.GeneratedMinimality_11_10_Part060_Region0242
import LatticePathOrders.GeneratedMinimality_11_10_Part060_Region0243

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_11_10

def regionsPart060 : List (Path × Nat × AssignmentTree) := [
  (mustParsePath "RRRURURURURR", 9, region_0240),
  (mustParsePath "RRRURURURURU", 9, region_0241),
  (mustParsePath "RRRURURURUU", 10, region_0242),
  (mustParsePath "RRRURURUURRR", 9, region_0243)
]

theorem regionsPart060_valid : ∀ region ∈ regionsPart060,
    region.1.length + region.2.1 = 21 ∧
      region.2.2.check 11 10 classes region.2.1 region.1 = true := by
  intro region h
  simp only [regionsPart060, List.mem_cons, List.mem_nil_iff, or_false] at h
  rcases h with rfl | rfl | rfl | rfl
  · exact ⟨by decide, region_0240_check⟩
  · exact ⟨by decide, region_0241_check⟩
  · exact ⟨by decide, region_0242_check⟩
  · exact ⟨by decide, region_0243_check⟩

end LatticePathOrders.GeneratedMinimality_11_10

