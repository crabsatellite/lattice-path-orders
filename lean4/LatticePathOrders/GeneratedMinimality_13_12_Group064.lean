import LatticePathOrders.GeneratedMinimality_13_12_Part1024
import LatticePathOrders.GeneratedMinimality_13_12_Part1025
import LatticePathOrders.GeneratedMinimality_13_12_Part1026
import LatticePathOrders.GeneratedMinimality_13_12_Part1027
import LatticePathOrders.GeneratedMinimality_13_12_Part1028
import LatticePathOrders.GeneratedMinimality_13_12_Part1029
import LatticePathOrders.GeneratedMinimality_13_12_Part1030
import LatticePathOrders.GeneratedMinimality_13_12_Part1031
import LatticePathOrders.GeneratedMinimality_13_12_Part1032
import LatticePathOrders.GeneratedMinimality_13_12_Part1033
import LatticePathOrders.GeneratedMinimality_13_12_Part1034
import LatticePathOrders.GeneratedMinimality_13_12_Part1035
import LatticePathOrders.GeneratedMinimality_13_12_Part1036
import LatticePathOrders.GeneratedMinimality_13_12_Part1037
import LatticePathOrders.GeneratedMinimality_13_12_Part1038
import LatticePathOrders.GeneratedMinimality_13_12_Part1039

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_13_12

def regionsGroup064 : List (Path × Nat × AssignmentTree) :=
  regionsPart1024 ++ (regionsPart1025 ++ (regionsPart1026 ++ (regionsPart1027 ++ (regionsPart1028 ++ (regionsPart1029 ++ (regionsPart1030 ++ (regionsPart1031 ++ (regionsPart1032 ++ (regionsPart1033 ++ (regionsPart1034 ++ (regionsPart1035 ++ (regionsPart1036 ++ (regionsPart1037 ++ (regionsPart1038 ++ (regionsPart1039)))))))))))))))

theorem regionsGroup064_valid : ∀ region ∈ regionsGroup064,
    region.1.length + region.2.1 = 25 ∧
      region.2.2.check 13 12 classes region.2.1 region.1 = true := by
  intro region h
  simp only [regionsGroup064, List.mem_append] at h
  rcases h with h | h | h | h | h | h | h | h | h | h | h | h | h | h | h | h
  · exact regionsPart1024_valid region h
  · exact regionsPart1025_valid region h
  · exact regionsPart1026_valid region h
  · exact regionsPart1027_valid region h
  · exact regionsPart1028_valid region h
  · exact regionsPart1029_valid region h
  · exact regionsPart1030_valid region h
  · exact regionsPart1031_valid region h
  · exact regionsPart1032_valid region h
  · exact regionsPart1033_valid region h
  · exact regionsPart1034_valid region h
  · exact regionsPart1035_valid region h
  · exact regionsPart1036_valid region h
  · exact regionsPart1037_valid region h
  · exact regionsPart1038_valid region h
  · exact regionsPart1039_valid region h

end LatticePathOrders.GeneratedMinimality_13_12
