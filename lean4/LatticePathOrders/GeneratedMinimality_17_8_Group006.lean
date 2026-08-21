import LatticePathOrders.GeneratedMinimality_17_8_Part096
import LatticePathOrders.GeneratedMinimality_17_8_Part097
import LatticePathOrders.GeneratedMinimality_17_8_Part098
import LatticePathOrders.GeneratedMinimality_17_8_Part099
import LatticePathOrders.GeneratedMinimality_17_8_Part100
import LatticePathOrders.GeneratedMinimality_17_8_Part101
import LatticePathOrders.GeneratedMinimality_17_8_Part102
import LatticePathOrders.GeneratedMinimality_17_8_Part103
import LatticePathOrders.GeneratedMinimality_17_8_Part104
import LatticePathOrders.GeneratedMinimality_17_8_Part105
import LatticePathOrders.GeneratedMinimality_17_8_Part106
import LatticePathOrders.GeneratedMinimality_17_8_Part107
import LatticePathOrders.GeneratedMinimality_17_8_Part108
import LatticePathOrders.GeneratedMinimality_17_8_Part109
import LatticePathOrders.GeneratedMinimality_17_8_Part110
import LatticePathOrders.GeneratedMinimality_17_8_Part111

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_17_8

def regionsGroup006 : List (Path × Nat × AssignmentTree) :=
  regionsPart096 ++ (regionsPart097 ++ (regionsPart098 ++ (regionsPart099 ++ (regionsPart100 ++ (regionsPart101 ++ (regionsPart102 ++ (regionsPart103 ++ (regionsPart104 ++ (regionsPart105 ++ (regionsPart106 ++ (regionsPart107 ++ (regionsPart108 ++ (regionsPart109 ++ (regionsPart110 ++ (regionsPart111)))))))))))))))

theorem regionsGroup006_valid : ∀ region ∈ regionsGroup006,
    region.1.length + region.2.1 = 25 ∧
      region.2.2.check 17 8 classes region.2.1 region.1 = true := by
  intro region h
  simp only [regionsGroup006, List.mem_append] at h
  rcases h with h | h | h | h | h | h | h | h | h | h | h | h | h | h | h | h
  · exact regionsPart096_valid region h
  · exact regionsPart097_valid region h
  · exact regionsPart098_valid region h
  · exact regionsPart099_valid region h
  · exact regionsPart100_valid region h
  · exact regionsPart101_valid region h
  · exact regionsPart102_valid region h
  · exact regionsPart103_valid region h
  · exact regionsPart104_valid region h
  · exact regionsPart105_valid region h
  · exact regionsPart106_valid region h
  · exact regionsPart107_valid region h
  · exact regionsPart108_valid region h
  · exact regionsPart109_valid region h
  · exact regionsPart110_valid region h
  · exact regionsPart111_valid region h

end LatticePathOrders.GeneratedMinimality_17_8
