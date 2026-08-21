import LatticePathOrders.GeneratedMinimality_13_11_Part595_Region2380
import LatticePathOrders.GeneratedMinimality_13_11_Part595_Region2381
import LatticePathOrders.GeneratedMinimality_13_11_Part595_Region2382
import LatticePathOrders.GeneratedMinimality_13_11_Part595_Region2383

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_13_11

def regionsPart595 : List (Path × Nat × AssignmentTree) := [
  (mustParsePath "RRURURRRURRURUR", 9, region_2380),
  (mustParsePath "RRURURRRURRURUU", 9, region_2381),
  (mustParsePath "RRURURRRURRUURR", 9, region_2382),
  (mustParsePath "RRURURRRURRUURU", 9, region_2383)
]

theorem regionsPart595_valid : ∀ region ∈ regionsPart595,
    region.1.length + region.2.1 = 24 ∧
      region.2.2.check 13 11 classes region.2.1 region.1 = true := by
  intro region h
  simp only [regionsPart595, List.mem_cons, List.mem_nil_iff, or_false] at h
  rcases h with rfl | rfl | rfl | rfl
  · exact ⟨by decide, region_2380_check⟩
  · exact ⟨by decide, region_2381_check⟩
  · exact ⟨by decide, region_2382_check⟩
  · exact ⟨by decide, region_2383_check⟩

end LatticePathOrders.GeneratedMinimality_13_11

