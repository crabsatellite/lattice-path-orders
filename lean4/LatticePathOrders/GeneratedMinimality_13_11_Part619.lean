import LatticePathOrders.GeneratedMinimality_13_11_Part619_Region2476
import LatticePathOrders.GeneratedMinimality_13_11_Part619_Region2477
import LatticePathOrders.GeneratedMinimality_13_11_Part619_Region2478
import LatticePathOrders.GeneratedMinimality_13_11_Part619_Region2479

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_13_11

def regionsPart619 : List (Path × Nat × AssignmentTree) := [
  (mustParsePath "RRURURURRRURURR", 9, region_2476),
  (mustParsePath "RRURURURRRURURU", 9, region_2477),
  (mustParsePath "RRURURURRRURUU", 10, region_2478),
  (mustParsePath "RRURURURRRUURRR", 9, region_2479)
]

theorem regionsPart619_valid : ∀ region ∈ regionsPart619,
    region.1.length + region.2.1 = 24 ∧
      region.2.2.check 13 11 classes region.2.1 region.1 = true := by
  intro region h
  simp only [regionsPart619, List.mem_cons, List.mem_nil_iff, or_false] at h
  rcases h with rfl | rfl | rfl | rfl
  · exact ⟨by decide, region_2476_check⟩
  · exact ⟨by decide, region_2477_check⟩
  · exact ⟨by decide, region_2478_check⟩
  · exact ⟨by decide, region_2479_check⟩

end LatticePathOrders.GeneratedMinimality_13_11

