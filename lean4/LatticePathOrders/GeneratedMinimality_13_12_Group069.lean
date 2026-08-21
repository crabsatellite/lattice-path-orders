import LatticePathOrders.GeneratedMinimality_13_12_Part1104
import LatticePathOrders.GeneratedMinimality_13_12_Part1105
import LatticePathOrders.GeneratedMinimality_13_12_Part1106
import LatticePathOrders.GeneratedMinimality_13_12_Part1107
import LatticePathOrders.GeneratedMinimality_13_12_Part1108
import LatticePathOrders.GeneratedMinimality_13_12_Part1109
import LatticePathOrders.GeneratedMinimality_13_12_Part1110
import LatticePathOrders.GeneratedMinimality_13_12_Part1111
import LatticePathOrders.GeneratedMinimality_13_12_Part1112
import LatticePathOrders.GeneratedMinimality_13_12_Part1113
import LatticePathOrders.GeneratedMinimality_13_12_Part1114
import LatticePathOrders.GeneratedMinimality_13_12_Part1115
import LatticePathOrders.GeneratedMinimality_13_12_Part1116
import LatticePathOrders.GeneratedMinimality_13_12_Part1117
import LatticePathOrders.GeneratedMinimality_13_12_Part1118
import LatticePathOrders.GeneratedMinimality_13_12_Part1119

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_13_12

def regionsGroup069 : List (Path × Nat × AssignmentTree) :=
  regionsPart1104 ++ (regionsPart1105 ++ (regionsPart1106 ++ (regionsPart1107 ++ (regionsPart1108 ++ (regionsPart1109 ++ (regionsPart1110 ++ (regionsPart1111 ++ (regionsPart1112 ++ (regionsPart1113 ++ (regionsPart1114 ++ (regionsPart1115 ++ (regionsPart1116 ++ (regionsPart1117 ++ (regionsPart1118 ++ (regionsPart1119)))))))))))))))

theorem regionsGroup069_valid : ∀ region ∈ regionsGroup069,
    region.1.length + region.2.1 = 25 ∧
      region.2.2.check 13 12 classes region.2.1 region.1 = true := by
  intro region h
  simp only [regionsGroup069, List.mem_append] at h
  rcases h with h | h | h | h | h | h | h | h | h | h | h | h | h | h | h | h
  · exact regionsPart1104_valid region h
  · exact regionsPart1105_valid region h
  · exact regionsPart1106_valid region h
  · exact regionsPart1107_valid region h
  · exact regionsPart1108_valid region h
  · exact regionsPart1109_valid region h
  · exact regionsPart1110_valid region h
  · exact regionsPart1111_valid region h
  · exact regionsPart1112_valid region h
  · exact regionsPart1113_valid region h
  · exact regionsPart1114_valid region h
  · exact regionsPart1115_valid region h
  · exact regionsPart1116_valid region h
  · exact regionsPart1117_valid region h
  · exact regionsPart1118_valid region h
  · exact regionsPart1119_valid region h

end LatticePathOrders.GeneratedMinimality_13_12
