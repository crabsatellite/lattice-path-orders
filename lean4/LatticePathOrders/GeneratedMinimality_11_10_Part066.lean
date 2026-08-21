import LatticePathOrders.GeneratedMinimality_11_10_Part066_Region0264
import LatticePathOrders.GeneratedMinimality_11_10_Part066_Region0265
import LatticePathOrders.GeneratedMinimality_11_10_Part066_Region0266
import LatticePathOrders.GeneratedMinimality_11_10_Part066_Region0267

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_11_10

def regionsPart066 : List (Path × Nat × AssignmentTree) := [
  (mustParsePath "RRRUURRRURRU", 9, region_0264),
  (mustParsePath "RRRUURRRURUR", 9, region_0265),
  (mustParsePath "RRRUURRRURUU", 9, region_0266),
  (mustParsePath "RRRUURRRUURR", 9, region_0267)
]

theorem regionsPart066_valid : ∀ region ∈ regionsPart066,
    region.1.length + region.2.1 = 21 ∧
      region.2.2.check 11 10 classes region.2.1 region.1 = true := by
  intro region h
  simp only [regionsPart066, List.mem_cons, List.mem_nil_iff, or_false] at h
  rcases h with rfl | rfl | rfl | rfl
  · exact ⟨by decide, region_0264_check⟩
  · exact ⟨by decide, region_0265_check⟩
  · exact ⟨by decide, region_0266_check⟩
  · exact ⟨by decide, region_0267_check⟩

end LatticePathOrders.GeneratedMinimality_11_10

