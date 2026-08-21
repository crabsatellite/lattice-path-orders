import LatticePathOrders.GeneratedMinimality_13_11_Part596_Region2384
import LatticePathOrders.GeneratedMinimality_13_11_Part596_Region2385
import LatticePathOrders.GeneratedMinimality_13_11_Part596_Region2386
import LatticePathOrders.GeneratedMinimality_13_11_Part596_Region2387

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_13_11

def regionsPart596 : List (Path × Nat × AssignmentTree) := [
  (mustParsePath "RRURURRRURRUUU", 10, region_2384),
  (mustParsePath "RRURURRRURURRRR", 9, region_2385),
  (mustParsePath "RRURURRRURURRRU", 9, region_2386),
  (mustParsePath "RRURURRRURURRUR", 9, region_2387)
]

theorem regionsPart596_valid : ∀ region ∈ regionsPart596,
    region.1.length + region.2.1 = 24 ∧
      region.2.2.check 13 11 classes region.2.1 region.1 = true := by
  intro region h
  simp only [regionsPart596, List.mem_cons, List.mem_nil_iff, or_false] at h
  rcases h with rfl | rfl | rfl | rfl
  · exact ⟨by decide, region_2384_check⟩
  · exact ⟨by decide, region_2385_check⟩
  · exact ⟨by decide, region_2386_check⟩
  · exact ⟨by decide, region_2387_check⟩

end LatticePathOrders.GeneratedMinimality_13_11

