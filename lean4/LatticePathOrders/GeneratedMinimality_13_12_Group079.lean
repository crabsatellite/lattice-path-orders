import LatticePathOrders.GeneratedMinimality_13_12_Part1264
import LatticePathOrders.GeneratedMinimality_13_12_Part1265
import LatticePathOrders.GeneratedMinimality_13_12_Part1266
import LatticePathOrders.GeneratedMinimality_13_12_Part1267
import LatticePathOrders.GeneratedMinimality_13_12_Part1268
import LatticePathOrders.GeneratedMinimality_13_12_Part1269
import LatticePathOrders.GeneratedMinimality_13_12_Part1270

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_13_12

def regionsGroup079 : List (Path × Nat × AssignmentTree) :=
  regionsPart1264 ++ (regionsPart1265 ++ (regionsPart1266 ++ (regionsPart1267 ++ (regionsPart1268 ++ (regionsPart1269 ++ (regionsPart1270))))))

theorem regionsGroup079_valid : ∀ region ∈ regionsGroup079,
    region.1.length + region.2.1 = 25 ∧
      region.2.2.check 13 12 classes region.2.1 region.1 = true := by
  intro region h
  simp only [regionsGroup079, List.mem_append] at h
  rcases h with h | h | h | h | h | h | h
  · exact regionsPart1264_valid region h
  · exact regionsPart1265_valid region h
  · exact regionsPart1266_valid region h
  · exact regionsPart1267_valid region h
  · exact regionsPart1268_valid region h
  · exact regionsPart1269_valid region h
  · exact regionsPart1270_valid region h

end LatticePathOrders.GeneratedMinimality_13_12
