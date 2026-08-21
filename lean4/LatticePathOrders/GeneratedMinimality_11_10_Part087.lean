import LatticePathOrders.GeneratedMinimality_11_10_Part087_Region0348
import LatticePathOrders.GeneratedMinimality_11_10_Part087_Region0349
import LatticePathOrders.GeneratedMinimality_11_10_Part087_Region0350
import LatticePathOrders.GeneratedMinimality_11_10_Part087_Region0351

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_11_10

def regionsPart087 : List (Path × Nat × AssignmentTree) := [
  (mustParsePath "RRURRURRURUR", 9, region_0348),
  (mustParsePath "RRURRURRURUU", 9, region_0349),
  (mustParsePath "RRURRURRUURR", 9, region_0350),
  (mustParsePath "RRURRURRUURU", 9, region_0351)
]

theorem regionsPart087_valid : ∀ region ∈ regionsPart087,
    region.1.length + region.2.1 = 21 ∧
      region.2.2.check 11 10 classes region.2.1 region.1 = true := by
  intro region h
  simp only [regionsPart087, List.mem_cons, List.mem_nil_iff, or_false] at h
  rcases h with rfl | rfl | rfl | rfl
  · exact ⟨by decide, region_0348_check⟩
  · exact ⟨by decide, region_0349_check⟩
  · exact ⟨by decide, region_0350_check⟩
  · exact ⟨by decide, region_0351_check⟩

end LatticePathOrders.GeneratedMinimality_11_10

