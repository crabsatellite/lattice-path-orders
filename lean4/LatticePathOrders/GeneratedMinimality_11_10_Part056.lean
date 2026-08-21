import LatticePathOrders.GeneratedMinimality_11_10_Part056_Region0224
import LatticePathOrders.GeneratedMinimality_11_10_Part056_Region0225
import LatticePathOrders.GeneratedMinimality_11_10_Part056_Region0226
import LatticePathOrders.GeneratedMinimality_11_10_Part056_Region0227

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_11_10

def regionsPart056 : List (Path × Nat × AssignmentTree) := [
  (mustParsePath "RRRURURRRRUU", 9, region_0224),
  (mustParsePath "RRRURURRRURR", 9, region_0225),
  (mustParsePath "RRRURURRRURU", 9, region_0226),
  (mustParsePath "RRRURURRRUUR", 9, region_0227)
]

theorem regionsPart056_valid : ∀ region ∈ regionsPart056,
    region.1.length + region.2.1 = 21 ∧
      region.2.2.check 11 10 classes region.2.1 region.1 = true := by
  intro region h
  simp only [regionsPart056, List.mem_cons, List.mem_nil_iff, or_false] at h
  rcases h with rfl | rfl | rfl | rfl
  · exact ⟨by decide, region_0224_check⟩
  · exact ⟨by decide, region_0225_check⟩
  · exact ⟨by decide, region_0226_check⟩
  · exact ⟨by decide, region_0227_check⟩

end LatticePathOrders.GeneratedMinimality_11_10

