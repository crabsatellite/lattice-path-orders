import LatticePathOrders.GeneratedMinimality_10_9_Part016_Region0064
import LatticePathOrders.GeneratedMinimality_10_9_Part016_Region0065
import LatticePathOrders.GeneratedMinimality_10_9_Part016_Region0066
import LatticePathOrders.GeneratedMinimality_10_9_Part016_Region0067

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_10_9

def regionsPart016 : List (Path × Nat × AssignmentTree) := [
  (mustParsePath "RRRURURRRU", 9, region_0064),
  (mustParsePath "RRRURURRUR", 9, region_0065),
  (mustParsePath "RRRURURRUU", 9, region_0066),
  (mustParsePath "RRRURURURR", 9, region_0067)
]

theorem regionsPart016_valid : ∀ region ∈ regionsPart016,
    region.1.length + region.2.1 = 19 ∧
      region.2.2.check 10 9 classes region.2.1 region.1 = true := by
  intro region h
  simp only [regionsPart016, List.mem_cons, List.mem_nil_iff, or_false] at h
  rcases h with rfl | rfl | rfl | rfl
  · exact ⟨by decide, region_0064_check⟩
  · exact ⟨by decide, region_0065_check⟩
  · exact ⟨by decide, region_0066_check⟩
  · exact ⟨by decide, region_0067_check⟩

end LatticePathOrders.GeneratedMinimality_10_9

