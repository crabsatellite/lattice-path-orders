import LatticePathOrders.GeneratedMinimality_13_11_Part624
import LatticePathOrders.GeneratedMinimality_13_11_Part625
import LatticePathOrders.GeneratedMinimality_13_11_Part626

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_13_11

def regionsGroup039 : List (Path × Nat × AssignmentTree) :=
  regionsPart624 ++ (regionsPart625 ++ (regionsPart626))

theorem regionsGroup039_valid : ∀ region ∈ regionsGroup039,
    region.1.length + region.2.1 = 24 ∧
      region.2.2.check 13 11 classes region.2.1 region.1 = true := by
  intro region h
  simp only [regionsGroup039, List.mem_append] at h
  rcases h with h | h | h
  · exact regionsPart624_valid region h
  · exact regionsPart625_valid region h
  · exact regionsPart626_valid region h

end LatticePathOrders.GeneratedMinimality_13_11
