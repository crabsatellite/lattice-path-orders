import LatticePathOrders.GeneratedMinimality_13_12_Part1072
import LatticePathOrders.GeneratedMinimality_13_12_Part1073
import LatticePathOrders.GeneratedMinimality_13_12_Part1074
import LatticePathOrders.GeneratedMinimality_13_12_Part1075
import LatticePathOrders.GeneratedMinimality_13_12_Part1076
import LatticePathOrders.GeneratedMinimality_13_12_Part1077
import LatticePathOrders.GeneratedMinimality_13_12_Part1078
import LatticePathOrders.GeneratedMinimality_13_12_Part1079
import LatticePathOrders.GeneratedMinimality_13_12_Part1080
import LatticePathOrders.GeneratedMinimality_13_12_Part1081
import LatticePathOrders.GeneratedMinimality_13_12_Part1082
import LatticePathOrders.GeneratedMinimality_13_12_Part1083
import LatticePathOrders.GeneratedMinimality_13_12_Part1084
import LatticePathOrders.GeneratedMinimality_13_12_Part1085
import LatticePathOrders.GeneratedMinimality_13_12_Part1086
import LatticePathOrders.GeneratedMinimality_13_12_Part1087

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_13_12

def regionsGroup067 : List (Path × Nat × AssignmentTree) :=
  regionsPart1072 ++ (regionsPart1073 ++ (regionsPart1074 ++ (regionsPart1075 ++ (regionsPart1076 ++ (regionsPart1077 ++ (regionsPart1078 ++ (regionsPart1079 ++ (regionsPart1080 ++ (regionsPart1081 ++ (regionsPart1082 ++ (regionsPart1083 ++ (regionsPart1084 ++ (regionsPart1085 ++ (regionsPart1086 ++ (regionsPart1087)))))))))))))))

theorem regionsGroup067_valid : ∀ region ∈ regionsGroup067,
    region.1.length + region.2.1 = 25 ∧
      region.2.2.check 13 12 classes region.2.1 region.1 = true := by
  intro region h
  simp only [regionsGroup067, List.mem_append] at h
  rcases h with h | h | h | h | h | h | h | h | h | h | h | h | h | h | h | h
  · exact regionsPart1072_valid region h
  · exact regionsPart1073_valid region h
  · exact regionsPart1074_valid region h
  · exact regionsPart1075_valid region h
  · exact regionsPart1076_valid region h
  · exact regionsPart1077_valid region h
  · exact regionsPart1078_valid region h
  · exact regionsPart1079_valid region h
  · exact regionsPart1080_valid region h
  · exact regionsPart1081_valid region h
  · exact regionsPart1082_valid region h
  · exact regionsPart1083_valid region h
  · exact regionsPart1084_valid region h
  · exact regionsPart1085_valid region h
  · exact regionsPart1086_valid region h
  · exact regionsPart1087_valid region h

end LatticePathOrders.GeneratedMinimality_13_12
