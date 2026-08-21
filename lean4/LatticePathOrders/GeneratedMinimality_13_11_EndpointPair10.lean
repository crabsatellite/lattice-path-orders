import LatticePathOrders.GeneratedMinimality_13_11_GroupBridge020
import LatticePathOrders.GeneratedMinimality_13_11_GroupBridge021

namespace LatticePathOrders.GeneratedMinimality_13_11

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def regionsPair10 : List (Path × Nat × AssignmentTree) :=
  regionsGroup020 ++ regionsGroup021

def frontierPair10 : List Path :=
  groupFrontier020 ++ groupFrontier021

theorem frontierPair10_regions :
    frontierPair10 = regionsPair10.map Prod.fst := by
  simp only [frontierPair10, regionsPair10, List.map_append,
    groupFrontier020_regions, groupFrontier021_regions]

theorem regionsPair10_valid : ∀ region ∈ regionsPair10,
    region.1.length + region.2.1 = 24 ∧
      region.2.2.check 13 11 classes region.2.1 region.1 = true := by
  intro region h
  unfold regionsPair10 at h
  rcases List.mem_append.mp h with h | h
  · exact regionsGroup020_valid region h
  · exact regionsGroup021_valid region h

end LatticePathOrders.GeneratedMinimality_13_11

