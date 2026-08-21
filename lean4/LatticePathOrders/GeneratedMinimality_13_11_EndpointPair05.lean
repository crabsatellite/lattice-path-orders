import LatticePathOrders.GeneratedMinimality_13_11_GroupBridge010
import LatticePathOrders.GeneratedMinimality_13_11_GroupBridge011

namespace LatticePathOrders.GeneratedMinimality_13_11

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def regionsPair05 : List (Path × Nat × AssignmentTree) :=
  regionsGroup010 ++ regionsGroup011

def frontierPair05 : List Path :=
  groupFrontier010 ++ groupFrontier011

theorem frontierPair05_regions :
    frontierPair05 = regionsPair05.map Prod.fst := by
  simp only [frontierPair05, regionsPair05, List.map_append,
    groupFrontier010_regions, groupFrontier011_regions]

theorem regionsPair05_valid : ∀ region ∈ regionsPair05,
    region.1.length + region.2.1 = 24 ∧
      region.2.2.check 13 11 classes region.2.1 region.1 = true := by
  intro region h
  unfold regionsPair05 at h
  rcases List.mem_append.mp h with h | h
  · exact regionsGroup010_valid region h
  · exact regionsGroup011_valid region h

end LatticePathOrders.GeneratedMinimality_13_11

