import LatticePathOrders.GeneratedMinimality_13_11_GroupBridge012
import LatticePathOrders.GeneratedMinimality_13_11_GroupBridge013

namespace LatticePathOrders.GeneratedMinimality_13_11

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def regionsPair06 : List (Path × Nat × AssignmentTree) :=
  regionsGroup012 ++ regionsGroup013

def frontierPair06 : List Path :=
  groupFrontier012 ++ groupFrontier013

theorem frontierPair06_regions :
    frontierPair06 = regionsPair06.map Prod.fst := by
  simp only [frontierPair06, regionsPair06, List.map_append,
    groupFrontier012_regions, groupFrontier013_regions]

theorem regionsPair06_valid : ∀ region ∈ regionsPair06,
    region.1.length + region.2.1 = 24 ∧
      region.2.2.check 13 11 classes region.2.1 region.1 = true := by
  intro region h
  unfold regionsPair06 at h
  rcases List.mem_append.mp h with h | h
  · exact regionsGroup012_valid region h
  · exact regionsGroup013_valid region h

end LatticePathOrders.GeneratedMinimality_13_11

