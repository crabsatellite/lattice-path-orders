import LatticePathOrders.GeneratedMinimality_11_10_Part095_Region0380
import LatticePathOrders.GeneratedMinimality_11_10_Part095_Region0381
import LatticePathOrders.GeneratedMinimality_11_10_Part095_Region0382
import LatticePathOrders.GeneratedMinimality_11_10_Part095_Region0383

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_11_10

def regionsPart095 : List (Path × Nat × AssignmentTree) := [
  (mustParsePath "RRURURRRURRR", 9, region_0380),
  (mustParsePath "RRURURRRURRU", 9, region_0381),
  (mustParsePath "RRURURRRURUR", 9, region_0382),
  (mustParsePath "RRURURRRURUU", 9, region_0383)
]

theorem regionsPart095_valid : ∀ region ∈ regionsPart095,
    region.1.length + region.2.1 = 21 ∧
      region.2.2.check 11 10 classes region.2.1 region.1 = true := by
  intro region h
  simp only [regionsPart095, List.mem_cons, List.mem_nil_iff, or_false] at h
  rcases h with rfl | rfl | rfl | rfl
  · exact ⟨by decide, region_0380_check⟩
  · exact ⟨by decide, region_0381_check⟩
  · exact ⟨by decide, region_0382_check⟩
  · exact ⟨by decide, region_0383_check⟩

end LatticePathOrders.GeneratedMinimality_11_10

