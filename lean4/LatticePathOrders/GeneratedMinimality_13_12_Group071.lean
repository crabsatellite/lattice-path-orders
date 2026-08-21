import LatticePathOrders.GeneratedMinimality_13_12_Part1136
import LatticePathOrders.GeneratedMinimality_13_12_Part1137
import LatticePathOrders.GeneratedMinimality_13_12_Part1138
import LatticePathOrders.GeneratedMinimality_13_12_Part1139
import LatticePathOrders.GeneratedMinimality_13_12_Part1140
import LatticePathOrders.GeneratedMinimality_13_12_Part1141
import LatticePathOrders.GeneratedMinimality_13_12_Part1142
import LatticePathOrders.GeneratedMinimality_13_12_Part1143
import LatticePathOrders.GeneratedMinimality_13_12_Part1144
import LatticePathOrders.GeneratedMinimality_13_12_Part1145
import LatticePathOrders.GeneratedMinimality_13_12_Part1146
import LatticePathOrders.GeneratedMinimality_13_12_Part1147
import LatticePathOrders.GeneratedMinimality_13_12_Part1148
import LatticePathOrders.GeneratedMinimality_13_12_Part1149
import LatticePathOrders.GeneratedMinimality_13_12_Part1150
import LatticePathOrders.GeneratedMinimality_13_12_Part1151

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_13_12

def regionsGroup071 : List (Path × Nat × AssignmentTree) :=
  regionsPart1136 ++ (regionsPart1137 ++ (regionsPart1138 ++ (regionsPart1139 ++ (regionsPart1140 ++ (regionsPart1141 ++ (regionsPart1142 ++ (regionsPart1143 ++ (regionsPart1144 ++ (regionsPart1145 ++ (regionsPart1146 ++ (regionsPart1147 ++ (regionsPart1148 ++ (regionsPart1149 ++ (regionsPart1150 ++ (regionsPart1151)))))))))))))))

theorem regionsGroup071_valid : ∀ region ∈ regionsGroup071,
    region.1.length + region.2.1 = 25 ∧
      region.2.2.check 13 12 classes region.2.1 region.1 = true := by
  intro region h
  simp only [regionsGroup071, List.mem_append] at h
  rcases h with h | h | h | h | h | h | h | h | h | h | h | h | h | h | h | h
  · exact regionsPart1136_valid region h
  · exact regionsPart1137_valid region h
  · exact regionsPart1138_valid region h
  · exact regionsPart1139_valid region h
  · exact regionsPart1140_valid region h
  · exact regionsPart1141_valid region h
  · exact regionsPart1142_valid region h
  · exact regionsPart1143_valid region h
  · exact regionsPart1144_valid region h
  · exact regionsPart1145_valid region h
  · exact regionsPart1146_valid region h
  · exact regionsPart1147_valid region h
  · exact regionsPart1148_valid region h
  · exact regionsPart1149_valid region h
  · exact regionsPart1150_valid region h
  · exact regionsPart1151_valid region h

end LatticePathOrders.GeneratedMinimality_13_12
