import LatticePathOrders.GeneratedMinimality_11_10_Part068_Region0272
import LatticePathOrders.GeneratedMinimality_11_10_Part068_Region0273
import LatticePathOrders.GeneratedMinimality_11_10_Part068_Region0274
import LatticePathOrders.GeneratedMinimality_11_10_Part068_Region0275

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_11_10

def regionsPart068 : List (Path × Nat × AssignmentTree) := [
  (mustParsePath "RRRUURRURRUR", 9, region_0272),
  (mustParsePath "RRRUURRURRUU", 9, region_0273),
  (mustParsePath "RRRUURRURURR", 9, region_0274),
  (mustParsePath "RRRUURRURURU", 9, region_0275)
]

theorem regionsPart068_valid : ∀ region ∈ regionsPart068,
    region.1.length + region.2.1 = 21 ∧
      region.2.2.check 11 10 classes region.2.1 region.1 = true := by
  intro region h
  simp only [regionsPart068, List.mem_cons, List.mem_nil_iff, or_false] at h
  rcases h with rfl | rfl | rfl | rfl
  · exact ⟨by decide, region_0272_check⟩
  · exact ⟨by decide, region_0273_check⟩
  · exact ⟨by decide, region_0274_check⟩
  · exact ⟨by decide, region_0275_check⟩

end LatticePathOrders.GeneratedMinimality_11_10

