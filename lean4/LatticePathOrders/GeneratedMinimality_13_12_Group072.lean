import LatticePathOrders.GeneratedMinimality_13_12_Part1152
import LatticePathOrders.GeneratedMinimality_13_12_Part1153
import LatticePathOrders.GeneratedMinimality_13_12_Part1154
import LatticePathOrders.GeneratedMinimality_13_12_Part1155
import LatticePathOrders.GeneratedMinimality_13_12_Part1156
import LatticePathOrders.GeneratedMinimality_13_12_Part1157
import LatticePathOrders.GeneratedMinimality_13_12_Part1158
import LatticePathOrders.GeneratedMinimality_13_12_Part1159
import LatticePathOrders.GeneratedMinimality_13_12_Part1160
import LatticePathOrders.GeneratedMinimality_13_12_Part1161
import LatticePathOrders.GeneratedMinimality_13_12_Part1162
import LatticePathOrders.GeneratedMinimality_13_12_Part1163
import LatticePathOrders.GeneratedMinimality_13_12_Part1164
import LatticePathOrders.GeneratedMinimality_13_12_Part1165
import LatticePathOrders.GeneratedMinimality_13_12_Part1166
import LatticePathOrders.GeneratedMinimality_13_12_Part1167

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_13_12

def regionsGroup072 : List (Path × Nat × AssignmentTree) :=
  regionsPart1152 ++ (regionsPart1153 ++ (regionsPart1154 ++ (regionsPart1155 ++ (regionsPart1156 ++ (regionsPart1157 ++ (regionsPart1158 ++ (regionsPart1159 ++ (regionsPart1160 ++ (regionsPart1161 ++ (regionsPart1162 ++ (regionsPart1163 ++ (regionsPart1164 ++ (regionsPart1165 ++ (regionsPart1166 ++ (regionsPart1167)))))))))))))))

theorem regionsGroup072_valid : ∀ region ∈ regionsGroup072,
    region.1.length + region.2.1 = 25 ∧
      region.2.2.check 13 12 classes region.2.1 region.1 = true := by
  intro region h
  simp only [regionsGroup072, List.mem_append] at h
  rcases h with h | h | h | h | h | h | h | h | h | h | h | h | h | h | h | h
  · exact regionsPart1152_valid region h
  · exact regionsPart1153_valid region h
  · exact regionsPart1154_valid region h
  · exact regionsPart1155_valid region h
  · exact regionsPart1156_valid region h
  · exact regionsPart1157_valid region h
  · exact regionsPart1158_valid region h
  · exact regionsPart1159_valid region h
  · exact regionsPart1160_valid region h
  · exact regionsPart1161_valid region h
  · exact regionsPart1162_valid region h
  · exact regionsPart1163_valid region h
  · exact regionsPart1164_valid region h
  · exact regionsPart1165_valid region h
  · exact regionsPart1166_valid region h
  · exact regionsPart1167_valid region h

end LatticePathOrders.GeneratedMinimality_13_12
