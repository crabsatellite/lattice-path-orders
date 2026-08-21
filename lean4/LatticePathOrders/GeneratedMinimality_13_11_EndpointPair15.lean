import LatticePathOrders.GeneratedMinimality_13_11_GroupBridge030
import LatticePathOrders.GeneratedMinimality_13_11_GroupBridge031

namespace LatticePathOrders.GeneratedMinimality_13_11

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def regionsPair15 : List (Path × Nat × AssignmentTree) :=
  regionsGroup030 ++ regionsGroup031

def frontierPair15 : List Path :=
  groupFrontier030 ++ groupFrontier031

theorem frontierPair15_regions :
    frontierPair15 = regionsPair15.map Prod.fst := by
  simp only [frontierPair15, regionsPair15, List.map_append,
    groupFrontier030_regions, groupFrontier031_regions]

theorem regionsPair15_valid : ∀ region ∈ regionsPair15,
    region.1.length + region.2.1 = 24 ∧
      region.2.2.check 13 11 classes region.2.1 region.1 = true := by
  intro region h
  unfold regionsPair15 at h
  rcases List.mem_append.mp h with h | h
  · exact regionsGroup030_valid region h
  · exact regionsGroup031_valid region h

end LatticePathOrders.GeneratedMinimality_13_11

