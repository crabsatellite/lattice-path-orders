import LatticePathOrders.GeneratedMinimality_13_11_GroupBridge036
import LatticePathOrders.GeneratedMinimality_13_11_GroupBridge037

namespace LatticePathOrders.GeneratedMinimality_13_11

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def regionsPair18 : List (Path × Nat × AssignmentTree) :=
  regionsGroup036 ++ regionsGroup037

def frontierPair18 : List Path :=
  groupFrontier036 ++ groupFrontier037

theorem frontierPair18_regions :
    frontierPair18 = regionsPair18.map Prod.fst := by
  simp only [frontierPair18, regionsPair18, List.map_append,
    groupFrontier036_regions, groupFrontier037_regions]

theorem regionsPair18_valid : ∀ region ∈ regionsPair18,
    region.1.length + region.2.1 = 24 ∧
      region.2.2.check 13 11 classes region.2.1 region.1 = true := by
  intro region h
  unfold regionsPair18 at h
  rcases List.mem_append.mp h with h | h
  · exact regionsGroup036_valid region h
  · exact regionsGroup037_valid region h

end LatticePathOrders.GeneratedMinimality_13_11

