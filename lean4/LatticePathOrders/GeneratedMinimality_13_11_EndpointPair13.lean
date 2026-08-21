import LatticePathOrders.GeneratedMinimality_13_11_GroupBridge026
import LatticePathOrders.GeneratedMinimality_13_11_GroupBridge027

namespace LatticePathOrders.GeneratedMinimality_13_11

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def regionsPair13 : List (Path × Nat × AssignmentTree) :=
  regionsGroup026 ++ regionsGroup027

def frontierPair13 : List Path :=
  groupFrontier026 ++ groupFrontier027

theorem frontierPair13_regions :
    frontierPair13 = regionsPair13.map Prod.fst := by
  simp only [frontierPair13, regionsPair13, List.map_append,
    groupFrontier026_regions, groupFrontier027_regions]

theorem regionsPair13_valid : ∀ region ∈ regionsPair13,
    region.1.length + region.2.1 = 24 ∧
      region.2.2.check 13 11 classes region.2.1 region.1 = true := by
  intro region h
  unfold regionsPair13 at h
  rcases List.mem_append.mp h with h | h
  · exact regionsGroup026_valid region h
  · exact regionsGroup027_valid region h

end LatticePathOrders.GeneratedMinimality_13_11

