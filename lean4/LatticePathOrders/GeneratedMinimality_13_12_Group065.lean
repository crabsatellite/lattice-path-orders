import LatticePathOrders.GeneratedMinimality_13_12_Part1040
import LatticePathOrders.GeneratedMinimality_13_12_Part1041
import LatticePathOrders.GeneratedMinimality_13_12_Part1042
import LatticePathOrders.GeneratedMinimality_13_12_Part1043
import LatticePathOrders.GeneratedMinimality_13_12_Part1044
import LatticePathOrders.GeneratedMinimality_13_12_Part1045
import LatticePathOrders.GeneratedMinimality_13_12_Part1046
import LatticePathOrders.GeneratedMinimality_13_12_Part1047
import LatticePathOrders.GeneratedMinimality_13_12_Part1048
import LatticePathOrders.GeneratedMinimality_13_12_Part1049
import LatticePathOrders.GeneratedMinimality_13_12_Part1050
import LatticePathOrders.GeneratedMinimality_13_12_Part1051
import LatticePathOrders.GeneratedMinimality_13_12_Part1052
import LatticePathOrders.GeneratedMinimality_13_12_Part1053
import LatticePathOrders.GeneratedMinimality_13_12_Part1054
import LatticePathOrders.GeneratedMinimality_13_12_Part1055

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_13_12

def regionsGroup065 : List (Path × Nat × AssignmentTree) :=
  regionsPart1040 ++ (regionsPart1041 ++ (regionsPart1042 ++ (regionsPart1043 ++ (regionsPart1044 ++ (regionsPart1045 ++ (regionsPart1046 ++ (regionsPart1047 ++ (regionsPart1048 ++ (regionsPart1049 ++ (regionsPart1050 ++ (regionsPart1051 ++ (regionsPart1052 ++ (regionsPart1053 ++ (regionsPart1054 ++ (regionsPart1055)))))))))))))))

theorem regionsGroup065_valid : ∀ region ∈ regionsGroup065,
    region.1.length + region.2.1 = 25 ∧
      region.2.2.check 13 12 classes region.2.1 region.1 = true := by
  intro region h
  simp only [regionsGroup065, List.mem_append] at h
  rcases h with h | h | h | h | h | h | h | h | h | h | h | h | h | h | h | h
  · exact regionsPart1040_valid region h
  · exact regionsPart1041_valid region h
  · exact regionsPart1042_valid region h
  · exact regionsPart1043_valid region h
  · exact regionsPart1044_valid region h
  · exact regionsPart1045_valid region h
  · exact regionsPart1046_valid region h
  · exact regionsPart1047_valid region h
  · exact regionsPart1048_valid region h
  · exact regionsPart1049_valid region h
  · exact regionsPart1050_valid region h
  · exact regionsPart1051_valid region h
  · exact regionsPart1052_valid region h
  · exact regionsPart1053_valid region h
  · exact regionsPart1054_valid region h
  · exact regionsPart1055_valid region h

end LatticePathOrders.GeneratedMinimality_13_12
