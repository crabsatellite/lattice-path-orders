import LatticePathOrders.GeneratedMinimality_13_12_Part1088
import LatticePathOrders.GeneratedMinimality_13_12_Part1089
import LatticePathOrders.GeneratedMinimality_13_12_Part1090
import LatticePathOrders.GeneratedMinimality_13_12_Part1091
import LatticePathOrders.GeneratedMinimality_13_12_Part1092
import LatticePathOrders.GeneratedMinimality_13_12_Part1093
import LatticePathOrders.GeneratedMinimality_13_12_Part1094
import LatticePathOrders.GeneratedMinimality_13_12_Part1095
import LatticePathOrders.GeneratedMinimality_13_12_Part1096
import LatticePathOrders.GeneratedMinimality_13_12_Part1097
import LatticePathOrders.GeneratedMinimality_13_12_Part1098
import LatticePathOrders.GeneratedMinimality_13_12_Part1099
import LatticePathOrders.GeneratedMinimality_13_12_Part1100
import LatticePathOrders.GeneratedMinimality_13_12_Part1101
import LatticePathOrders.GeneratedMinimality_13_12_Part1102
import LatticePathOrders.GeneratedMinimality_13_12_Part1103

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_13_12

def regionsGroup068 : List (Path × Nat × AssignmentTree) :=
  regionsPart1088 ++ (regionsPart1089 ++ (regionsPart1090 ++ (regionsPart1091 ++ (regionsPart1092 ++ (regionsPart1093 ++ (regionsPart1094 ++ (regionsPart1095 ++ (regionsPart1096 ++ (regionsPart1097 ++ (regionsPart1098 ++ (regionsPart1099 ++ (regionsPart1100 ++ (regionsPart1101 ++ (regionsPart1102 ++ (regionsPart1103)))))))))))))))

theorem regionsGroup068_valid : ∀ region ∈ regionsGroup068,
    region.1.length + region.2.1 = 25 ∧
      region.2.2.check 13 12 classes region.2.1 region.1 = true := by
  intro region h
  simp only [regionsGroup068, List.mem_append] at h
  rcases h with h | h | h | h | h | h | h | h | h | h | h | h | h | h | h | h
  · exact regionsPart1088_valid region h
  · exact regionsPart1089_valid region h
  · exact regionsPart1090_valid region h
  · exact regionsPart1091_valid region h
  · exact regionsPart1092_valid region h
  · exact regionsPart1093_valid region h
  · exact regionsPart1094_valid region h
  · exact regionsPart1095_valid region h
  · exact regionsPart1096_valid region h
  · exact regionsPart1097_valid region h
  · exact regionsPart1098_valid region h
  · exact regionsPart1099_valid region h
  · exact regionsPart1100_valid region h
  · exact regionsPart1101_valid region h
  · exact regionsPart1102_valid region h
  · exact regionsPart1103_valid region h

end LatticePathOrders.GeneratedMinimality_13_12
