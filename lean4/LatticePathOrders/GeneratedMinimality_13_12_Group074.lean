import LatticePathOrders.GeneratedMinimality_13_12_Part1184
import LatticePathOrders.GeneratedMinimality_13_12_Part1185
import LatticePathOrders.GeneratedMinimality_13_12_Part1186
import LatticePathOrders.GeneratedMinimality_13_12_Part1187
import LatticePathOrders.GeneratedMinimality_13_12_Part1188
import LatticePathOrders.GeneratedMinimality_13_12_Part1189
import LatticePathOrders.GeneratedMinimality_13_12_Part1190
import LatticePathOrders.GeneratedMinimality_13_12_Part1191
import LatticePathOrders.GeneratedMinimality_13_12_Part1192
import LatticePathOrders.GeneratedMinimality_13_12_Part1193
import LatticePathOrders.GeneratedMinimality_13_12_Part1194
import LatticePathOrders.GeneratedMinimality_13_12_Part1195
import LatticePathOrders.GeneratedMinimality_13_12_Part1196
import LatticePathOrders.GeneratedMinimality_13_12_Part1197
import LatticePathOrders.GeneratedMinimality_13_12_Part1198
import LatticePathOrders.GeneratedMinimality_13_12_Part1199

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_13_12

def regionsGroup074 : List (Path × Nat × AssignmentTree) :=
  regionsPart1184 ++ (regionsPart1185 ++ (regionsPart1186 ++ (regionsPart1187 ++ (regionsPart1188 ++ (regionsPart1189 ++ (regionsPart1190 ++ (regionsPart1191 ++ (regionsPart1192 ++ (regionsPart1193 ++ (regionsPart1194 ++ (regionsPart1195 ++ (regionsPart1196 ++ (regionsPart1197 ++ (regionsPart1198 ++ (regionsPart1199)))))))))))))))

theorem regionsGroup074_valid : ∀ region ∈ regionsGroup074,
    region.1.length + region.2.1 = 25 ∧
      region.2.2.check 13 12 classes region.2.1 region.1 = true := by
  intro region h
  simp only [regionsGroup074, List.mem_append] at h
  rcases h with h | h | h | h | h | h | h | h | h | h | h | h | h | h | h | h
  · exact regionsPart1184_valid region h
  · exact regionsPart1185_valid region h
  · exact regionsPart1186_valid region h
  · exact regionsPart1187_valid region h
  · exact regionsPart1188_valid region h
  · exact regionsPart1189_valid region h
  · exact regionsPart1190_valid region h
  · exact regionsPart1191_valid region h
  · exact regionsPart1192_valid region h
  · exact regionsPart1193_valid region h
  · exact regionsPart1194_valid region h
  · exact regionsPart1195_valid region h
  · exact regionsPart1196_valid region h
  · exact regionsPart1197_valid region h
  · exact regionsPart1198_valid region h
  · exact regionsPart1199_valid region h

end LatticePathOrders.GeneratedMinimality_13_12
