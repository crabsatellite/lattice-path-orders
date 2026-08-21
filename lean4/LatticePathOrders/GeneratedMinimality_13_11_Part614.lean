import LatticePathOrders.GeneratedMinimality_13_11_Part614_Region2456
import LatticePathOrders.GeneratedMinimality_13_11_Part614_Region2457
import LatticePathOrders.GeneratedMinimality_13_11_Part614_Region2458
import LatticePathOrders.GeneratedMinimality_13_11_Part614_Region2459

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_13_11

def regionsPart614 : List (Path × Nat × AssignmentTree) := [
  (mustParsePath "RRURURRUURURRRU", 9, region_2456),
  (mustParsePath "RRURURRUURURRU", 10, region_2457),
  (mustParsePath "RRURURURRRRRRR", 10, region_2458),
  (mustParsePath "RRURURURRRRRRUR", 9, region_2459)
]

theorem regionsPart614_valid : ∀ region ∈ regionsPart614,
    region.1.length + region.2.1 = 24 ∧
      region.2.2.check 13 11 classes region.2.1 region.1 = true := by
  intro region h
  simp only [regionsPart614, List.mem_cons, List.mem_nil_iff, or_false] at h
  rcases h with rfl | rfl | rfl | rfl
  · exact ⟨by decide, region_2456_check⟩
  · exact ⟨by decide, region_2457_check⟩
  · exact ⟨by decide, region_2458_check⟩
  · exact ⟨by decide, region_2459_check⟩

end LatticePathOrders.GeneratedMinimality_13_11

