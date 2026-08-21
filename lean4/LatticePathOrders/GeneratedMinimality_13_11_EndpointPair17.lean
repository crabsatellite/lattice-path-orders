import LatticePathOrders.GeneratedMinimality_13_11_GroupBridge034
import LatticePathOrders.GeneratedMinimality_13_11_GroupBridge035

namespace LatticePathOrders.GeneratedMinimality_13_11

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def regionsPair17 : List (Path × Nat × AssignmentTree) :=
  regionsGroup034 ++ regionsGroup035

def frontierPair17 : List Path :=
  groupFrontier034 ++ groupFrontier035

theorem frontierPair17_regions :
    frontierPair17 = regionsPair17.map Prod.fst := by
  simp only [frontierPair17, regionsPair17, List.map_append,
    groupFrontier034_regions, groupFrontier035_regions]

theorem regionsPair17_valid : ∀ region ∈ regionsPair17,
    region.1.length + region.2.1 = 24 ∧
      region.2.2.check 13 11 classes region.2.1 region.1 = true := by
  intro region h
  unfold regionsPair17 at h
  rcases List.mem_append.mp h with h | h
  · exact regionsGroup034_valid region h
  · exact regionsGroup035_valid region h

end LatticePathOrders.GeneratedMinimality_13_11

