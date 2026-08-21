import LatticePathOrders.GeneratedMinimality_13_11_GroupBridge022
import LatticePathOrders.GeneratedMinimality_13_11_GroupBridge023

namespace LatticePathOrders.GeneratedMinimality_13_11

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def regionsPair11 : List (Path × Nat × AssignmentTree) :=
  regionsGroup022 ++ regionsGroup023

def frontierPair11 : List Path :=
  groupFrontier022 ++ groupFrontier023

theorem frontierPair11_regions :
    frontierPair11 = regionsPair11.map Prod.fst := by
  simp only [frontierPair11, regionsPair11, List.map_append,
    groupFrontier022_regions, groupFrontier023_regions]

theorem regionsPair11_valid : ∀ region ∈ regionsPair11,
    region.1.length + region.2.1 = 24 ∧
      region.2.2.check 13 11 classes region.2.1 region.1 = true := by
  intro region h
  unfold regionsPair11 at h
  rcases List.mem_append.mp h with h | h
  · exact regionsGroup022_valid region h
  · exact regionsGroup023_valid region h

end LatticePathOrders.GeneratedMinimality_13_11

