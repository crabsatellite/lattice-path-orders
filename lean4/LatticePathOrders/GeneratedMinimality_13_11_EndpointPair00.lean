import LatticePathOrders.GeneratedMinimality_13_11_GroupBridge000
import LatticePathOrders.GeneratedMinimality_13_11_GroupBridge001

namespace LatticePathOrders.GeneratedMinimality_13_11

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def regionsPair00 : List (Path × Nat × AssignmentTree) :=
  regionsGroup000 ++ regionsGroup001

def frontierPair00 : List Path :=
  groupFrontier000 ++ groupFrontier001

theorem frontierPair00_regions :
    frontierPair00 = regionsPair00.map Prod.fst := by
  simp only [frontierPair00, regionsPair00, List.map_append,
    groupFrontier000_regions, groupFrontier001_regions]

theorem regionsPair00_valid : ∀ region ∈ regionsPair00,
    region.1.length + region.2.1 = 24 ∧
      region.2.2.check 13 11 classes region.2.1 region.1 = true := by
  intro region h
  unfold regionsPair00 at h
  rcases List.mem_append.mp h with h | h
  · exact regionsGroup000_valid region h
  · exact regionsGroup001_valid region h

end LatticePathOrders.GeneratedMinimality_13_11

