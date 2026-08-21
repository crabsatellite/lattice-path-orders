import LatticePathOrders.GeneratedMinimality_13_12_Part1200
import LatticePathOrders.GeneratedMinimality_13_12_Part1201
import LatticePathOrders.GeneratedMinimality_13_12_Part1202
import LatticePathOrders.GeneratedMinimality_13_12_Part1203
import LatticePathOrders.GeneratedMinimality_13_12_Part1204
import LatticePathOrders.GeneratedMinimality_13_12_Part1205
import LatticePathOrders.GeneratedMinimality_13_12_Part1206
import LatticePathOrders.GeneratedMinimality_13_12_Part1207
import LatticePathOrders.GeneratedMinimality_13_12_Part1208
import LatticePathOrders.GeneratedMinimality_13_12_Part1209
import LatticePathOrders.GeneratedMinimality_13_12_Part1210
import LatticePathOrders.GeneratedMinimality_13_12_Part1211
import LatticePathOrders.GeneratedMinimality_13_12_Part1212
import LatticePathOrders.GeneratedMinimality_13_12_Part1213
import LatticePathOrders.GeneratedMinimality_13_12_Part1214
import LatticePathOrders.GeneratedMinimality_13_12_Part1215

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_13_12

def regionsGroup075 : List (Path × Nat × AssignmentTree) :=
  regionsPart1200 ++ (regionsPart1201 ++ (regionsPart1202 ++ (regionsPart1203 ++ (regionsPart1204 ++ (regionsPart1205 ++ (regionsPart1206 ++ (regionsPart1207 ++ (regionsPart1208 ++ (regionsPart1209 ++ (regionsPart1210 ++ (regionsPart1211 ++ (regionsPart1212 ++ (regionsPart1213 ++ (regionsPart1214 ++ (regionsPart1215)))))))))))))))

theorem regionsGroup075_valid : ∀ region ∈ regionsGroup075,
    region.1.length + region.2.1 = 25 ∧
      region.2.2.check 13 12 classes region.2.1 region.1 = true := by
  intro region h
  simp only [regionsGroup075, List.mem_append] at h
  rcases h with h | h | h | h | h | h | h | h | h | h | h | h | h | h | h | h
  · exact regionsPart1200_valid region h
  · exact regionsPart1201_valid region h
  · exact regionsPart1202_valid region h
  · exact regionsPart1203_valid region h
  · exact regionsPart1204_valid region h
  · exact regionsPart1205_valid region h
  · exact regionsPart1206_valid region h
  · exact regionsPart1207_valid region h
  · exact regionsPart1208_valid region h
  · exact regionsPart1209_valid region h
  · exact regionsPart1210_valid region h
  · exact regionsPart1211_valid region h
  · exact regionsPart1212_valid region h
  · exact regionsPart1213_valid region h
  · exact regionsPart1214_valid region h
  · exact regionsPart1215_valid region h

end LatticePathOrders.GeneratedMinimality_13_12
