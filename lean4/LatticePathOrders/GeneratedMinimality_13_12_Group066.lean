import LatticePathOrders.GeneratedMinimality_13_12_Part1056
import LatticePathOrders.GeneratedMinimality_13_12_Part1057
import LatticePathOrders.GeneratedMinimality_13_12_Part1058
import LatticePathOrders.GeneratedMinimality_13_12_Part1059
import LatticePathOrders.GeneratedMinimality_13_12_Part1060
import LatticePathOrders.GeneratedMinimality_13_12_Part1061
import LatticePathOrders.GeneratedMinimality_13_12_Part1062
import LatticePathOrders.GeneratedMinimality_13_12_Part1063
import LatticePathOrders.GeneratedMinimality_13_12_Part1064
import LatticePathOrders.GeneratedMinimality_13_12_Part1065
import LatticePathOrders.GeneratedMinimality_13_12_Part1066
import LatticePathOrders.GeneratedMinimality_13_12_Part1067
import LatticePathOrders.GeneratedMinimality_13_12_Part1068
import LatticePathOrders.GeneratedMinimality_13_12_Part1069
import LatticePathOrders.GeneratedMinimality_13_12_Part1070
import LatticePathOrders.GeneratedMinimality_13_12_Part1071

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_13_12

def regionsGroup066 : List (Path × Nat × AssignmentTree) :=
  regionsPart1056 ++ (regionsPart1057 ++ (regionsPart1058 ++ (regionsPart1059 ++ (regionsPart1060 ++ (regionsPart1061 ++ (regionsPart1062 ++ (regionsPart1063 ++ (regionsPart1064 ++ (regionsPart1065 ++ (regionsPart1066 ++ (regionsPart1067 ++ (regionsPart1068 ++ (regionsPart1069 ++ (regionsPart1070 ++ (regionsPart1071)))))))))))))))

theorem regionsGroup066_valid : ∀ region ∈ regionsGroup066,
    region.1.length + region.2.1 = 25 ∧
      region.2.2.check 13 12 classes region.2.1 region.1 = true := by
  intro region h
  simp only [regionsGroup066, List.mem_append] at h
  rcases h with h | h | h | h | h | h | h | h | h | h | h | h | h | h | h | h
  · exact regionsPart1056_valid region h
  · exact regionsPart1057_valid region h
  · exact regionsPart1058_valid region h
  · exact regionsPart1059_valid region h
  · exact regionsPart1060_valid region h
  · exact regionsPart1061_valid region h
  · exact regionsPart1062_valid region h
  · exact regionsPart1063_valid region h
  · exact regionsPart1064_valid region h
  · exact regionsPart1065_valid region h
  · exact regionsPart1066_valid region h
  · exact regionsPart1067_valid region h
  · exact regionsPart1068_valid region h
  · exact regionsPart1069_valid region h
  · exact regionsPart1070_valid region h
  · exact regionsPart1071_valid region h

end LatticePathOrders.GeneratedMinimality_13_12
