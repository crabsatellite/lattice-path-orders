import LatticePathOrders.GeneratedMinimality_13_11_GroupBridge028
import LatticePathOrders.GeneratedMinimality_13_11_GroupBridge029

namespace LatticePathOrders.GeneratedMinimality_13_11

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def regionsPair14 : List (Path × Nat × AssignmentTree) :=
  regionsGroup028 ++ regionsGroup029

def frontierPair14 : List Path :=
  groupFrontier028 ++ groupFrontier029

theorem frontierPair14_regions :
    frontierPair14 = regionsPair14.map Prod.fst := by
  simp only [frontierPair14, regionsPair14, List.map_append,
    groupFrontier028_regions, groupFrontier029_regions]

theorem regionsPair14_valid : ∀ region ∈ regionsPair14,
    region.1.length + region.2.1 = 24 ∧
      region.2.2.check 13 11 classes region.2.1 region.1 = true := by
  intro region h
  unfold regionsPair14 at h
  rcases List.mem_append.mp h with h | h
  · exact regionsGroup028_valid region h
  · exact regionsGroup029_valid region h

end LatticePathOrders.GeneratedMinimality_13_11

