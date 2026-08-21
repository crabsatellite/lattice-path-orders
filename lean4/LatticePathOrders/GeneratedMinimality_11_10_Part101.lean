import LatticePathOrders.GeneratedMinimality_11_10_Part101_Region0404
import LatticePathOrders.GeneratedMinimality_11_10_Part101_Region0405
import LatticePathOrders.GeneratedMinimality_11_10_Part101_Region0406

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_11_10

def regionsPart101 : List (Path × Nat × AssignmentTree) := [
  (mustParsePath "RRURURURURRR", 9, region_0404),
  (mustParsePath "RRURURURURRU", 9, region_0405),
  (mustParsePath "RRURURURURU", 10, region_0406)
]

theorem regionsPart101_valid : ∀ region ∈ regionsPart101,
    region.1.length + region.2.1 = 21 ∧
      region.2.2.check 11 10 classes region.2.1 region.1 = true := by
  intro region h
  simp only [regionsPart101, List.mem_cons, List.mem_nil_iff, or_false] at h
  rcases h with rfl | rfl | rfl
  · exact ⟨by decide, region_0404_check⟩
  · exact ⟨by decide, region_0405_check⟩
  · exact ⟨by decide, region_0406_check⟩

end LatticePathOrders.GeneratedMinimality_11_10

