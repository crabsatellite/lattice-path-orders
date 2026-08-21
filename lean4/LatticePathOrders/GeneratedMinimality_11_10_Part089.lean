import LatticePathOrders.GeneratedMinimality_11_10_Part089_Region0356
import LatticePathOrders.GeneratedMinimality_11_10_Part089_Region0357
import LatticePathOrders.GeneratedMinimality_11_10_Part089_Region0358
import LatticePathOrders.GeneratedMinimality_11_10_Part089_Region0359

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_11_10

def regionsPart089 : List (Path × Nat × AssignmentTree) := [
  (mustParsePath "RRURRURURRUU", 9, region_0356),
  (mustParsePath "RRURRURURURR", 9, region_0357),
  (mustParsePath "RRURRURURURU", 9, region_0358),
  (mustParsePath "RRURRURURUU", 10, region_0359)
]

theorem regionsPart089_valid : ∀ region ∈ regionsPart089,
    region.1.length + region.2.1 = 21 ∧
      region.2.2.check 11 10 classes region.2.1 region.1 = true := by
  intro region h
  simp only [regionsPart089, List.mem_cons, List.mem_nil_iff, or_false] at h
  rcases h with rfl | rfl | rfl | rfl
  · exact ⟨by decide, region_0356_check⟩
  · exact ⟨by decide, region_0357_check⟩
  · exact ⟨by decide, region_0358_check⟩
  · exact ⟨by decide, region_0359_check⟩

end LatticePathOrders.GeneratedMinimality_11_10

