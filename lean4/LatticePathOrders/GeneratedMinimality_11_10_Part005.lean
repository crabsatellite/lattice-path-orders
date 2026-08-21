import LatticePathOrders.GeneratedMinimality_11_10_Part005_Region0020
import LatticePathOrders.GeneratedMinimality_11_10_Part005_Region0021
import LatticePathOrders.GeneratedMinimality_11_10_Part005_Region0022
import LatticePathOrders.GeneratedMinimality_11_10_Part005_Region0023

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_11_10

def regionsPart005 : List (Path × Nat × AssignmentTree) := [
  (mustParsePath "RRRRRRURURR", 10, region_0020),
  (mustParsePath "RRRRRRURURUR", 9, region_0021),
  (mustParsePath "RRRRRRURURUU", 9, region_0022),
  (mustParsePath "RRRRRRURUURR", 9, region_0023)
]

theorem regionsPart005_valid : ∀ region ∈ regionsPart005,
    region.1.length + region.2.1 = 21 ∧
      region.2.2.check 11 10 classes region.2.1 region.1 = true := by
  intro region h
  simp only [regionsPart005, List.mem_cons, List.mem_nil_iff, or_false] at h
  rcases h with rfl | rfl | rfl | rfl
  · exact ⟨by decide, region_0020_check⟩
  · exact ⟨by decide, region_0021_check⟩
  · exact ⟨by decide, region_0022_check⟩
  · exact ⟨by decide, region_0023_check⟩

end LatticePathOrders.GeneratedMinimality_11_10

