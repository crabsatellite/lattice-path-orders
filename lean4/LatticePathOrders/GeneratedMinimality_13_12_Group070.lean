import LatticePathOrders.GeneratedMinimality_13_12_Part1120
import LatticePathOrders.GeneratedMinimality_13_12_Part1121
import LatticePathOrders.GeneratedMinimality_13_12_Part1122
import LatticePathOrders.GeneratedMinimality_13_12_Part1123
import LatticePathOrders.GeneratedMinimality_13_12_Part1124
import LatticePathOrders.GeneratedMinimality_13_12_Part1125
import LatticePathOrders.GeneratedMinimality_13_12_Part1126
import LatticePathOrders.GeneratedMinimality_13_12_Part1127
import LatticePathOrders.GeneratedMinimality_13_12_Part1128
import LatticePathOrders.GeneratedMinimality_13_12_Part1129
import LatticePathOrders.GeneratedMinimality_13_12_Part1130
import LatticePathOrders.GeneratedMinimality_13_12_Part1131
import LatticePathOrders.GeneratedMinimality_13_12_Part1132
import LatticePathOrders.GeneratedMinimality_13_12_Part1133
import LatticePathOrders.GeneratedMinimality_13_12_Part1134
import LatticePathOrders.GeneratedMinimality_13_12_Part1135

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_13_12

def regionsGroup070 : List (Path × Nat × AssignmentTree) :=
  regionsPart1120 ++ (regionsPart1121 ++ (regionsPart1122 ++ (regionsPart1123 ++ (regionsPart1124 ++ (regionsPart1125 ++ (regionsPart1126 ++ (regionsPart1127 ++ (regionsPart1128 ++ (regionsPart1129 ++ (regionsPart1130 ++ (regionsPart1131 ++ (regionsPart1132 ++ (regionsPart1133 ++ (regionsPart1134 ++ (regionsPart1135)))))))))))))))

theorem regionsGroup070_valid : ∀ region ∈ regionsGroup070,
    region.1.length + region.2.1 = 25 ∧
      region.2.2.check 13 12 classes region.2.1 region.1 = true := by
  intro region h
  simp only [regionsGroup070, List.mem_append] at h
  rcases h with h | h | h | h | h | h | h | h | h | h | h | h | h | h | h | h
  · exact regionsPart1120_valid region h
  · exact regionsPart1121_valid region h
  · exact regionsPart1122_valid region h
  · exact regionsPart1123_valid region h
  · exact regionsPart1124_valid region h
  · exact regionsPart1125_valid region h
  · exact regionsPart1126_valid region h
  · exact regionsPart1127_valid region h
  · exact regionsPart1128_valid region h
  · exact regionsPart1129_valid region h
  · exact regionsPart1130_valid region h
  · exact regionsPart1131_valid region h
  · exact regionsPart1132_valid region h
  · exact regionsPart1133_valid region h
  · exact regionsPart1134_valid region h
  · exact regionsPart1135_valid region h

end LatticePathOrders.GeneratedMinimality_13_12
