import LatticePathOrders.GeneratedMinimality_11_10_Part090_Region0360
import LatticePathOrders.GeneratedMinimality_11_10_Part090_Region0361
import LatticePathOrders.GeneratedMinimality_11_10_Part090_Region0362
import LatticePathOrders.GeneratedMinimality_11_10_Part090_Region0363

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_11_10

def regionsPart090 : List (Path × Nat × AssignmentTree) := [
  (mustParsePath "RRURRURUURRR", 9, region_0360),
  (mustParsePath "RRURRURUURRU", 9, region_0361),
  (mustParsePath "RRURRURUURU", 10, region_0362),
  (mustParsePath "RRURRUURRRRR", 9, region_0363)
]

theorem regionsPart090_valid : ∀ region ∈ regionsPart090,
    region.1.length + region.2.1 = 21 ∧
      region.2.2.check 11 10 classes region.2.1 region.1 = true := by
  intro region h
  simp only [regionsPart090, List.mem_cons, List.mem_nil_iff, or_false] at h
  rcases h with rfl | rfl | rfl | rfl
  · exact ⟨by decide, region_0360_check⟩
  · exact ⟨by decide, region_0361_check⟩
  · exact ⟨by decide, region_0362_check⟩
  · exact ⟨by decide, region_0363_check⟩

end LatticePathOrders.GeneratedMinimality_11_10

