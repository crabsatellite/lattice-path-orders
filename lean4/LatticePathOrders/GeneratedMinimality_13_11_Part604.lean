import LatticePathOrders.GeneratedMinimality_13_11_Part604_Region2416
import LatticePathOrders.GeneratedMinimality_13_11_Part604_Region2417
import LatticePathOrders.GeneratedMinimality_13_11_Part604_Region2418
import LatticePathOrders.GeneratedMinimality_13_11_Part604_Region2419

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_13_11

def regionsPart604 : List (Path × Nat × AssignmentTree) := [
  (mustParsePath "RRURURRURRRURRU", 9, region_2416),
  (mustParsePath "RRURURRURRRURUR", 9, region_2417),
  (mustParsePath "RRURURRURRRURUU", 9, region_2418),
  (mustParsePath "RRURURRURRRUURR", 9, region_2419)
]

theorem regionsPart604_valid : ∀ region ∈ regionsPart604,
    region.1.length + region.2.1 = 24 ∧
      region.2.2.check 13 11 classes region.2.1 region.1 = true := by
  intro region h
  simp only [regionsPart604, List.mem_cons, List.mem_nil_iff, or_false] at h
  rcases h with rfl | rfl | rfl | rfl
  · exact ⟨by decide, region_2416_check⟩
  · exact ⟨by decide, region_2417_check⟩
  · exact ⟨by decide, region_2418_check⟩
  · exact ⟨by decide, region_2419_check⟩

end LatticePathOrders.GeneratedMinimality_13_11

