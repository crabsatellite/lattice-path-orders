import LatticePathOrders.GeneratedMinimality_16_9_Part112
import LatticePathOrders.GeneratedMinimality_16_9_Part113
import LatticePathOrders.GeneratedMinimality_16_9_Part114
import LatticePathOrders.GeneratedMinimality_16_9_Part115
import LatticePathOrders.GeneratedMinimality_16_9_Part116
import LatticePathOrders.GeneratedMinimality_16_9_Part117
import LatticePathOrders.GeneratedMinimality_16_9_Part118
import LatticePathOrders.GeneratedMinimality_16_9_Part119
import LatticePathOrders.GeneratedMinimality_16_9_Part120
import LatticePathOrders.GeneratedMinimality_16_9_Part121
import LatticePathOrders.GeneratedMinimality_16_9_Part122
import LatticePathOrders.GeneratedMinimality_16_9_Part123
import LatticePathOrders.GeneratedMinimality_16_9_Part124
import LatticePathOrders.GeneratedMinimality_16_9_Part125
import LatticePathOrders.GeneratedMinimality_16_9_Part126
import LatticePathOrders.GeneratedMinimality_16_9_Part127

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_16_9

def regionsGroup007 : List (Path × Nat × AssignmentTree) :=
  regionsPart112 ++ (regionsPart113 ++ (regionsPart114 ++ (regionsPart115 ++ (regionsPart116 ++ (regionsPart117 ++ (regionsPart118 ++ (regionsPart119 ++ (regionsPart120 ++ (regionsPart121 ++ (regionsPart122 ++ (regionsPart123 ++ (regionsPart124 ++ (regionsPart125 ++ (regionsPart126 ++ (regionsPart127)))))))))))))))

theorem regionsGroup007_valid : ∀ region ∈ regionsGroup007,
    region.1.length + region.2.1 = 25 ∧
      region.2.2.check 16 9 classes region.2.1 region.1 = true := by
  intro region h
  simp only [regionsGroup007, List.mem_append] at h
  rcases h with h | h | h | h | h | h | h | h | h | h | h | h | h | h | h | h
  · exact regionsPart112_valid region h
  · exact regionsPart113_valid region h
  · exact regionsPart114_valid region h
  · exact regionsPart115_valid region h
  · exact regionsPart116_valid region h
  · exact regionsPart117_valid region h
  · exact regionsPart118_valid region h
  · exact regionsPart119_valid region h
  · exact regionsPart120_valid region h
  · exact regionsPart121_valid region h
  · exact regionsPart122_valid region h
  · exact regionsPart123_valid region h
  · exact regionsPart124_valid region h
  · exact regionsPart125_valid region h
  · exact regionsPart126_valid region h
  · exact regionsPart127_valid region h

end LatticePathOrders.GeneratedMinimality_16_9
