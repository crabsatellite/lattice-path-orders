import LatticePathOrders.GeneratedMinimality_13_11_GroupBridge008
import LatticePathOrders.GeneratedMinimality_13_11_GroupBridge009

namespace LatticePathOrders.GeneratedMinimality_13_11

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def regionsPair04 : List (Path × Nat × AssignmentTree) :=
  regionsGroup008 ++ regionsGroup009

def frontierPair04 : List Path :=
  groupFrontier008 ++ groupFrontier009

theorem frontierPair04_regions :
    frontierPair04 = regionsPair04.map Prod.fst := by
  simp only [frontierPair04, regionsPair04, List.map_append,
    groupFrontier008_regions, groupFrontier009_regions]

theorem regionsPair04_valid : ∀ region ∈ regionsPair04,
    region.1.length + region.2.1 = 24 ∧
      region.2.2.check 13 11 classes region.2.1 region.1 = true := by
  intro region h
  unfold regionsPair04 at h
  rcases List.mem_append.mp h with h | h
  · exact regionsGroup008_valid region h
  · exact regionsGroup009_valid region h

end LatticePathOrders.GeneratedMinimality_13_11

