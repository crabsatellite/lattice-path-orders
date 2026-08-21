import LatticePathOrders.GeneratedMinimality_13_11_GroupBridge014
import LatticePathOrders.GeneratedMinimality_13_11_GroupBridge015

namespace LatticePathOrders.GeneratedMinimality_13_11

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def regionsPair07 : List (Path × Nat × AssignmentTree) :=
  regionsGroup014 ++ regionsGroup015

def frontierPair07 : List Path :=
  groupFrontier014 ++ groupFrontier015

theorem frontierPair07_regions :
    frontierPair07 = regionsPair07.map Prod.fst := by
  simp only [frontierPair07, regionsPair07, List.map_append,
    groupFrontier014_regions, groupFrontier015_regions]

theorem regionsPair07_valid : ∀ region ∈ regionsPair07,
    region.1.length + region.2.1 = 24 ∧
      region.2.2.check 13 11 classes region.2.1 region.1 = true := by
  intro region h
  unfold regionsPair07 at h
  rcases List.mem_append.mp h with h | h
  · exact regionsGroup014_valid region h
  · exact regionsGroup015_valid region h

end LatticePathOrders.GeneratedMinimality_13_11

