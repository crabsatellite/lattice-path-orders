import LatticePathOrders.GeneratedMinimality_11_10_Part059_Region0236
import LatticePathOrders.GeneratedMinimality_11_10_Part059_Region0237
import LatticePathOrders.GeneratedMinimality_11_10_Part059_Region0238
import LatticePathOrders.GeneratedMinimality_11_10_Part059_Region0239

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_11_10

def regionsPart059 : List (Path × Nat × AssignmentTree) := [
  (mustParsePath "RRRURURURRRR", 9, region_0236),
  (mustParsePath "RRRURURURRRU", 9, region_0237),
  (mustParsePath "RRRURURURRUR", 9, region_0238),
  (mustParsePath "RRRURURURRUU", 9, region_0239)
]

theorem regionsPart059_valid : ∀ region ∈ regionsPart059,
    region.1.length + region.2.1 = 21 ∧
      region.2.2.check 11 10 classes region.2.1 region.1 = true := by
  intro region h
  simp only [regionsPart059, List.mem_cons, List.mem_nil_iff, or_false] at h
  rcases h with rfl | rfl | rfl | rfl
  · exact ⟨by decide, region_0236_check⟩
  · exact ⟨by decide, region_0237_check⟩
  · exact ⟨by decide, region_0238_check⟩
  · exact ⟨by decide, region_0239_check⟩

end LatticePathOrders.GeneratedMinimality_11_10

