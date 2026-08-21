import LatticePathOrders.GeneratedMinimality_17_7_Part096

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_17_7

def regionsGroup006 : List (Path × Nat × AssignmentTree) := regionsPart096

theorem regionsGroup006_valid : ∀ region ∈ regionsGroup006,
    region.1.length + region.2.1 = 24 ∧
      region.2.2.check 17 7 classes region.2.1 region.1 = true := by
  intro region h
  exact regionsPart096_valid region h

end LatticePathOrders.GeneratedMinimality_17_7
