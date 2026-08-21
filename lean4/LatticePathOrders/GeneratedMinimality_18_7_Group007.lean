import LatticePathOrders.GeneratedMinimality_18_7_Part112
import LatticePathOrders.GeneratedMinimality_18_7_Part113
import LatticePathOrders.GeneratedMinimality_18_7_Part114
import LatticePathOrders.GeneratedMinimality_18_7_Part115
import LatticePathOrders.GeneratedMinimality_18_7_Part116
import LatticePathOrders.GeneratedMinimality_18_7_Part117
import LatticePathOrders.GeneratedMinimality_18_7_Part118
import LatticePathOrders.GeneratedMinimality_18_7_Part119

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_18_7

def regionsGroup007 : List (Path × Nat × AssignmentTree) :=
  regionsPart112 ++ (regionsPart113 ++ (regionsPart114 ++ (regionsPart115 ++ (regionsPart116 ++ (regionsPart117 ++ (regionsPart118 ++ (regionsPart119)))))))

theorem regionsGroup007_valid : ∀ region ∈ regionsGroup007,
    region.1.length + region.2.1 = 25 ∧
      region.2.2.check 18 7 classes region.2.1 region.1 = true := by
  intro region h
  simp only [regionsGroup007, List.mem_append] at h
  rcases h with h | h | h | h | h | h | h | h
  · exact regionsPart112_valid region h
  · exact regionsPart113_valid region h
  · exact regionsPart114_valid region h
  · exact regionsPart115_valid region h
  · exact regionsPart116_valid region h
  · exact regionsPart117_valid region h
  · exact regionsPart118_valid region h
  · exact regionsPart119_valid region h

end LatticePathOrders.GeneratedMinimality_18_7
