import LatticePathOrders.GeneratedMinimality_13_12_Part1232
import LatticePathOrders.GeneratedMinimality_13_12_Part1233
import LatticePathOrders.GeneratedMinimality_13_12_Part1234
import LatticePathOrders.GeneratedMinimality_13_12_Part1235
import LatticePathOrders.GeneratedMinimality_13_12_Part1236
import LatticePathOrders.GeneratedMinimality_13_12_Part1237
import LatticePathOrders.GeneratedMinimality_13_12_Part1238
import LatticePathOrders.GeneratedMinimality_13_12_Part1239
import LatticePathOrders.GeneratedMinimality_13_12_Part1240
import LatticePathOrders.GeneratedMinimality_13_12_Part1241
import LatticePathOrders.GeneratedMinimality_13_12_Part1242
import LatticePathOrders.GeneratedMinimality_13_12_Part1243
import LatticePathOrders.GeneratedMinimality_13_12_Part1244
import LatticePathOrders.GeneratedMinimality_13_12_Part1245
import LatticePathOrders.GeneratedMinimality_13_12_Part1246
import LatticePathOrders.GeneratedMinimality_13_12_Part1247

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_13_12

def regionsGroup077 : List (Path × Nat × AssignmentTree) :=
  regionsPart1232 ++ (regionsPart1233 ++ (regionsPart1234 ++ (regionsPart1235 ++ (regionsPart1236 ++ (regionsPart1237 ++ (regionsPart1238 ++ (regionsPart1239 ++ (regionsPart1240 ++ (regionsPart1241 ++ (regionsPart1242 ++ (regionsPart1243 ++ (regionsPart1244 ++ (regionsPart1245 ++ (regionsPart1246 ++ (regionsPart1247)))))))))))))))

theorem regionsGroup077_valid : ∀ region ∈ regionsGroup077,
    region.1.length + region.2.1 = 25 ∧
      region.2.2.check 13 12 classes region.2.1 region.1 = true := by
  intro region h
  simp only [regionsGroup077, List.mem_append] at h
  rcases h with h | h | h | h | h | h | h | h | h | h | h | h | h | h | h | h
  · exact regionsPart1232_valid region h
  · exact regionsPart1233_valid region h
  · exact regionsPart1234_valid region h
  · exact regionsPart1235_valid region h
  · exact regionsPart1236_valid region h
  · exact regionsPart1237_valid region h
  · exact regionsPart1238_valid region h
  · exact regionsPart1239_valid region h
  · exact regionsPart1240_valid region h
  · exact regionsPart1241_valid region h
  · exact regionsPart1242_valid region h
  · exact regionsPart1243_valid region h
  · exact regionsPart1244_valid region h
  · exact regionsPart1245_valid region h
  · exact regionsPart1246_valid region h
  · exact regionsPart1247_valid region h

end LatticePathOrders.GeneratedMinimality_13_12
