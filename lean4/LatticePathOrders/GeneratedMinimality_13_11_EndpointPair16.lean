import LatticePathOrders.GeneratedMinimality_13_11_GroupBridge032
import LatticePathOrders.GeneratedMinimality_13_11_GroupBridge033

namespace LatticePathOrders.GeneratedMinimality_13_11

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def regionsPair16 : List (Path × Nat × AssignmentTree) :=
  regionsGroup032 ++ regionsGroup033

def frontierPair16 : List Path :=
  groupFrontier032 ++ groupFrontier033

theorem frontierPair16_regions :
    frontierPair16 = regionsPair16.map Prod.fst := by
  simp only [frontierPair16, regionsPair16, List.map_append,
    groupFrontier032_regions, groupFrontier033_regions]

theorem regionsPair16_valid : ∀ region ∈ regionsPair16,
    region.1.length + region.2.1 = 24 ∧
      region.2.2.check 13 11 classes region.2.1 region.1 = true := by
  intro region h
  unfold regionsPair16 at h
  rcases List.mem_append.mp h with h | h
  · exact regionsGroup032_valid region h
  · exact regionsGroup033_valid region h

end LatticePathOrders.GeneratedMinimality_13_11

