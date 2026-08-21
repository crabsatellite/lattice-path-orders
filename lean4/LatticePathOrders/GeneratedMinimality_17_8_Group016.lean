import LatticePathOrders.GeneratedMinimality_17_8_Part256
import LatticePathOrders.GeneratedMinimality_17_8_Part257
import LatticePathOrders.GeneratedMinimality_17_8_Part258

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_17_8

def regionsGroup016 : List (Path × Nat × AssignmentTree) :=
  regionsPart256 ++ (regionsPart257 ++ (regionsPart258))

theorem regionsGroup016_valid : ∀ region ∈ regionsGroup016,
    region.1.length + region.2.1 = 25 ∧
      region.2.2.check 17 8 classes region.2.1 region.1 = true := by
  intro region h
  simp only [regionsGroup016, List.mem_append] at h
  rcases h with h | h | h
  · exact regionsPart256_valid region h
  · exact regionsPart257_valid region h
  · exact regionsPart258_valid region h

end LatticePathOrders.GeneratedMinimality_17_8
