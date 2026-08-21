import LatticePathOrders.GeneratedMinimality_13_12_Part1248
import LatticePathOrders.GeneratedMinimality_13_12_Part1249
import LatticePathOrders.GeneratedMinimality_13_12_Part1250
import LatticePathOrders.GeneratedMinimality_13_12_Part1251
import LatticePathOrders.GeneratedMinimality_13_12_Part1252
import LatticePathOrders.GeneratedMinimality_13_12_Part1253
import LatticePathOrders.GeneratedMinimality_13_12_Part1254
import LatticePathOrders.GeneratedMinimality_13_12_Part1255
import LatticePathOrders.GeneratedMinimality_13_12_Part1256
import LatticePathOrders.GeneratedMinimality_13_12_Part1257
import LatticePathOrders.GeneratedMinimality_13_12_Part1258
import LatticePathOrders.GeneratedMinimality_13_12_Part1259
import LatticePathOrders.GeneratedMinimality_13_12_Part1260
import LatticePathOrders.GeneratedMinimality_13_12_Part1261
import LatticePathOrders.GeneratedMinimality_13_12_Part1262
import LatticePathOrders.GeneratedMinimality_13_12_Part1263

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_13_12

def regionsGroup078 : List (Path × Nat × AssignmentTree) :=
  regionsPart1248 ++ (regionsPart1249 ++ (regionsPart1250 ++ (regionsPart1251 ++ (regionsPart1252 ++ (regionsPart1253 ++ (regionsPart1254 ++ (regionsPart1255 ++ (regionsPart1256 ++ (regionsPart1257 ++ (regionsPart1258 ++ (regionsPart1259 ++ (regionsPart1260 ++ (regionsPart1261 ++ (regionsPart1262 ++ (regionsPart1263)))))))))))))))

theorem regionsGroup078_valid : ∀ region ∈ regionsGroup078,
    region.1.length + region.2.1 = 25 ∧
      region.2.2.check 13 12 classes region.2.1 region.1 = true := by
  intro region h
  simp only [regionsGroup078, List.mem_append] at h
  rcases h with h | h | h | h | h | h | h | h | h | h | h | h | h | h | h | h
  · exact regionsPart1248_valid region h
  · exact regionsPart1249_valid region h
  · exact regionsPart1250_valid region h
  · exact regionsPart1251_valid region h
  · exact regionsPart1252_valid region h
  · exact regionsPart1253_valid region h
  · exact regionsPart1254_valid region h
  · exact regionsPart1255_valid region h
  · exact regionsPart1256_valid region h
  · exact regionsPart1257_valid region h
  · exact regionsPart1258_valid region h
  · exact regionsPart1259_valid region h
  · exact regionsPart1260_valid region h
  · exact regionsPart1261_valid region h
  · exact regionsPart1262_valid region h
  · exact regionsPart1263_valid region h

end LatticePathOrders.GeneratedMinimality_13_12
