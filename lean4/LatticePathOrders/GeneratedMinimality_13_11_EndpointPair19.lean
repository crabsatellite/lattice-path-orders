import LatticePathOrders.GeneratedMinimality_13_11_GroupBridge038
import LatticePathOrders.GeneratedMinimality_13_11_GroupBridge039

namespace LatticePathOrders.GeneratedMinimality_13_11

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def regionsPair19 : List (Path × Nat × AssignmentTree) :=
  regionsGroup038 ++ regionsGroup039

def frontierPair19 : List Path :=
  groupFrontier038 ++ groupFrontier039

theorem frontierPair19_regions :
    frontierPair19 = regionsPair19.map Prod.fst := by
  simp only [frontierPair19, regionsPair19, List.map_append,
    groupFrontier038_regions, groupFrontier039_regions]

theorem regionsPair19_valid : ∀ region ∈ regionsPair19,
    region.1.length + region.2.1 = 24 ∧
      region.2.2.check 13 11 classes region.2.1 region.1 = true := by
  intro region h
  unfold regionsPair19 at h
  rcases List.mem_append.mp h with h | h
  · exact regionsGroup038_valid region h
  · exact regionsGroup039_valid region h

end LatticePathOrders.GeneratedMinimality_13_11

