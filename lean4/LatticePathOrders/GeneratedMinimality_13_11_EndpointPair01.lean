import LatticePathOrders.GeneratedMinimality_13_11_GroupBridge002
import LatticePathOrders.GeneratedMinimality_13_11_GroupBridge003

namespace LatticePathOrders.GeneratedMinimality_13_11

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def regionsPair01 : List (Path × Nat × AssignmentTree) :=
  regionsGroup002 ++ regionsGroup003

def frontierPair01 : List Path :=
  groupFrontier002 ++ groupFrontier003

theorem frontierPair01_regions :
    frontierPair01 = regionsPair01.map Prod.fst := by
  simp only [frontierPair01, regionsPair01, List.map_append,
    groupFrontier002_regions, groupFrontier003_regions]

theorem regionsPair01_valid : ∀ region ∈ regionsPair01,
    region.1.length + region.2.1 = 24 ∧
      region.2.2.check 13 11 classes region.2.1 region.1 = true := by
  intro region h
  unfold regionsPair01 at h
  rcases List.mem_append.mp h with h | h
  · exact regionsGroup002_valid region h
  · exact regionsGroup003_valid region h

end LatticePathOrders.GeneratedMinimality_13_11

