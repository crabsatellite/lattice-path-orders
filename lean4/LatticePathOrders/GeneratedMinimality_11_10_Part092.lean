import LatticePathOrders.GeneratedMinimality_11_10_Part092_Region0368
import LatticePathOrders.GeneratedMinimality_11_10_Part092_Region0369
import LatticePathOrders.GeneratedMinimality_11_10_Part092_Region0370
import LatticePathOrders.GeneratedMinimality_11_10_Part092_Region0371

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_11_10

def regionsPart092 : List (Path × Nat × AssignmentTree) := [
  (mustParsePath "RRURRUURRURU", 9, region_0368),
  (mustParsePath "RRURRUURRUU", 10, region_0369),
  (mustParsePath "RRURRUURURRR", 9, region_0370),
  (mustParsePath "RRURRUURURRU", 9, region_0371)
]

theorem regionsPart092_valid : ∀ region ∈ regionsPart092,
    region.1.length + region.2.1 = 21 ∧
      region.2.2.check 11 10 classes region.2.1 region.1 = true := by
  intro region h
  simp only [regionsPart092, List.mem_cons, List.mem_nil_iff, or_false] at h
  rcases h with rfl | rfl | rfl | rfl
  · exact ⟨by decide, region_0368_check⟩
  · exact ⟨by decide, region_0369_check⟩
  · exact ⟨by decide, region_0370_check⟩
  · exact ⟨by decide, region_0371_check⟩

end LatticePathOrders.GeneratedMinimality_11_10

