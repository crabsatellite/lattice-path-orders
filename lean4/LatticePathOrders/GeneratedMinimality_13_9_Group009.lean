import LatticePathOrders.GeneratedMinimality_13_9_Part144

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_13_9

def regionsGroup009 : List (Path × Nat × AssignmentTree) := regionsPart144

theorem regionsGroup009_valid : ∀ region ∈ regionsGroup009,
    region.1.length + region.2.1 = 22 ∧
      region.2.2.check 13 9 classes region.2.1 region.1 = true := by
  intro region h
  exact regionsPart144_valid region h

end LatticePathOrders.GeneratedMinimality_13_9
