import LatticePathOrders.GeneratedMinimality_13_12_Part1216
import LatticePathOrders.GeneratedMinimality_13_12_Part1217
import LatticePathOrders.GeneratedMinimality_13_12_Part1218
import LatticePathOrders.GeneratedMinimality_13_12_Part1219
import LatticePathOrders.GeneratedMinimality_13_12_Part1220
import LatticePathOrders.GeneratedMinimality_13_12_Part1221
import LatticePathOrders.GeneratedMinimality_13_12_Part1222
import LatticePathOrders.GeneratedMinimality_13_12_Part1223
import LatticePathOrders.GeneratedMinimality_13_12_Part1224
import LatticePathOrders.GeneratedMinimality_13_12_Part1225
import LatticePathOrders.GeneratedMinimality_13_12_Part1226
import LatticePathOrders.GeneratedMinimality_13_12_Part1227
import LatticePathOrders.GeneratedMinimality_13_12_Part1228
import LatticePathOrders.GeneratedMinimality_13_12_Part1229
import LatticePathOrders.GeneratedMinimality_13_12_Part1230
import LatticePathOrders.GeneratedMinimality_13_12_Part1231

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_13_12

def regionsGroup076 : List (Path × Nat × AssignmentTree) :=
  regionsPart1216 ++ (regionsPart1217 ++ (regionsPart1218 ++ (regionsPart1219 ++ (regionsPart1220 ++ (regionsPart1221 ++ (regionsPart1222 ++ (regionsPart1223 ++ (regionsPart1224 ++ (regionsPart1225 ++ (regionsPart1226 ++ (regionsPart1227 ++ (regionsPart1228 ++ (regionsPart1229 ++ (regionsPart1230 ++ (regionsPart1231)))))))))))))))

theorem regionsGroup076_valid : ∀ region ∈ regionsGroup076,
    region.1.length + region.2.1 = 25 ∧
      region.2.2.check 13 12 classes region.2.1 region.1 = true := by
  intro region h
  simp only [regionsGroup076, List.mem_append] at h
  rcases h with h | h | h | h | h | h | h | h | h | h | h | h | h | h | h | h
  · exact regionsPart1216_valid region h
  · exact regionsPart1217_valid region h
  · exact regionsPart1218_valid region h
  · exact regionsPart1219_valid region h
  · exact regionsPart1220_valid region h
  · exact regionsPart1221_valid region h
  · exact regionsPart1222_valid region h
  · exact regionsPart1223_valid region h
  · exact regionsPart1224_valid region h
  · exact regionsPart1225_valid region h
  · exact regionsPart1226_valid region h
  · exact regionsPart1227_valid region h
  · exact regionsPart1228_valid region h
  · exact regionsPart1229_valid region h
  · exact regionsPart1230_valid region h
  · exact regionsPart1231_valid region h

end LatticePathOrders.GeneratedMinimality_13_12
