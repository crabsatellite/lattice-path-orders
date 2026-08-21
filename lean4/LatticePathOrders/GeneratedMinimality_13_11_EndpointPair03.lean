import LatticePathOrders.GeneratedMinimality_13_11_GroupBridge006
import LatticePathOrders.GeneratedMinimality_13_11_GroupBridge007

namespace LatticePathOrders.GeneratedMinimality_13_11

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def regionsPair03 : List (Path × Nat × AssignmentTree) :=
  regionsGroup006 ++ regionsGroup007

def frontierPair03 : List Path :=
  groupFrontier006 ++ groupFrontier007

theorem frontierPair03_regions :
    frontierPair03 = regionsPair03.map Prod.fst := by
  simp only [frontierPair03, regionsPair03, List.map_append,
    groupFrontier006_regions, groupFrontier007_regions]

theorem regionsPair03_valid : ∀ region ∈ regionsPair03,
    region.1.length + region.2.1 = 24 ∧
      region.2.2.check 13 11 classes region.2.1 region.1 = true := by
  intro region h
  unfold regionsPair03 at h
  rcases List.mem_append.mp h with h | h
  · exact regionsGroup006_valid region h
  · exact regionsGroup007_valid region h

end LatticePathOrders.GeneratedMinimality_13_11

