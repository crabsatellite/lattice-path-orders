import LatticePathOrders.GeneratedMinimality_13_4_Part000
import LatticePathOrders.GeneratedMinimality_13_4_Part001

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_13_4

def regionsGroup000 : List (Path × Nat × AssignmentTree) :=
  regionsPart000 ++ (regionsPart001)

theorem regionsGroup000_valid : ∀ region ∈ regionsGroup000,
    region.1.length + region.2.1 = 17 ∧
      region.2.2.check 13 4 classes region.2.1 region.1 = true := by
  intro region h
  simp only [regionsGroup000, List.mem_append] at h
  rcases h with h | h
  · exact regionsPart000_valid region h
  · exact regionsPart001_valid region h

end LatticePathOrders.GeneratedMinimality_13_4
