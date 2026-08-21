import LatticePathOrders.GeneratedMinimality_13_11_GroupBridge016
import LatticePathOrders.GeneratedMinimality_13_11_GroupBridge017

namespace LatticePathOrders.GeneratedMinimality_13_11

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def regionsPair08 : List (Path × Nat × AssignmentTree) :=
  regionsGroup016 ++ regionsGroup017

def frontierPair08 : List Path :=
  groupFrontier016 ++ groupFrontier017

theorem frontierPair08_regions :
    frontierPair08 = regionsPair08.map Prod.fst := by
  simp only [frontierPair08, regionsPair08, List.map_append,
    groupFrontier016_regions, groupFrontier017_regions]

theorem regionsPair08_valid : ∀ region ∈ regionsPair08,
    region.1.length + region.2.1 = 24 ∧
      region.2.2.check 13 11 classes region.2.1 region.1 = true := by
  intro region h
  unfold regionsPair08 at h
  rcases List.mem_append.mp h with h | h
  · exact regionsGroup016_valid region h
  · exact regionsGroup017_valid region h

end LatticePathOrders.GeneratedMinimality_13_11

