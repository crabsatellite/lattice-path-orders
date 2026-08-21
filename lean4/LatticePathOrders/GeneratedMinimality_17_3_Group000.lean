import LatticePathOrders.GeneratedMinimality_17_3_Part000

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_17_3

def regionsGroup000 : List (Path × Nat × AssignmentTree) := regionsPart000

theorem regionsGroup000_valid : ∀ region ∈ regionsGroup000,
    region.1.length + region.2.1 = 20 ∧
      region.2.2.check 17 3 classes region.2.1 region.1 = true := by
  intro region h
  exact regionsPart000_valid region h

end LatticePathOrders.GeneratedMinimality_17_3
