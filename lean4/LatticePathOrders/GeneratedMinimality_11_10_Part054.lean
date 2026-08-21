import LatticePathOrders.GeneratedMinimality_11_10_Part054_Region0216
import LatticePathOrders.GeneratedMinimality_11_10_Part054_Region0217
import LatticePathOrders.GeneratedMinimality_11_10_Part054_Region0218
import LatticePathOrders.GeneratedMinimality_11_10_Part054_Region0219

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_11_10

def regionsPart054 : List (Path × Nat × AssignmentTree) := [
  (mustParsePath "RRRURRUURURR", 9, region_0216),
  (mustParsePath "RRRURRUURURU", 9, region_0217),
  (mustParsePath "RRRURRUURUU", 10, region_0218),
  (mustParsePath "RRRURRUUURRR", 9, region_0219)
]

theorem regionsPart054_valid : ∀ region ∈ regionsPart054,
    region.1.length + region.2.1 = 21 ∧
      region.2.2.check 11 10 classes region.2.1 region.1 = true := by
  intro region h
  simp only [regionsPart054, List.mem_cons, List.mem_nil_iff, or_false] at h
  rcases h with rfl | rfl | rfl | rfl
  · exact ⟨by decide, region_0216_check⟩
  · exact ⟨by decide, region_0217_check⟩
  · exact ⟨by decide, region_0218_check⟩
  · exact ⟨by decide, region_0219_check⟩

end LatticePathOrders.GeneratedMinimality_11_10

