import LatticePathOrders.GeneratedMinimality_13_11_GroupBridge004
import LatticePathOrders.GeneratedMinimality_13_11_GroupBridge005

namespace LatticePathOrders.GeneratedMinimality_13_11

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def regionsPair02 : List (Path × Nat × AssignmentTree) :=
  regionsGroup004 ++ regionsGroup005

def frontierPair02 : List Path :=
  groupFrontier004 ++ groupFrontier005

theorem frontierPair02_regions :
    frontierPair02 = regionsPair02.map Prod.fst := by
  simp only [frontierPair02, regionsPair02, List.map_append,
    groupFrontier004_regions, groupFrontier005_regions]

theorem regionsPair02_valid : ∀ region ∈ regionsPair02,
    region.1.length + region.2.1 = 24 ∧
      region.2.2.check 13 11 classes region.2.1 region.1 = true := by
  intro region h
  unfold regionsPair02 at h
  rcases List.mem_append.mp h with h | h
  · exact regionsGroup004_valid region h
  · exact regionsGroup005_valid region h

end LatticePathOrders.GeneratedMinimality_13_11

