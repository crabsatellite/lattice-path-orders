import LatticePathOrders.GeneratedMinimality_13_11_GroupBridge024
import LatticePathOrders.GeneratedMinimality_13_11_GroupBridge025

namespace LatticePathOrders.GeneratedMinimality_13_11

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def regionsPair12 : List (Path × Nat × AssignmentTree) :=
  regionsGroup024 ++ regionsGroup025

def frontierPair12 : List Path :=
  groupFrontier024 ++ groupFrontier025

theorem frontierPair12_regions :
    frontierPair12 = regionsPair12.map Prod.fst := by
  simp only [frontierPair12, regionsPair12, List.map_append,
    groupFrontier024_regions, groupFrontier025_regions]

theorem regionsPair12_valid : ∀ region ∈ regionsPair12,
    region.1.length + region.2.1 = 24 ∧
      region.2.2.check 13 11 classes region.2.1 region.1 = true := by
  intro region h
  unfold regionsPair12 at h
  rcases List.mem_append.mp h with h | h
  · exact regionsGroup024_valid region h
  · exact regionsGroup025_valid region h

end LatticePathOrders.GeneratedMinimality_13_11

