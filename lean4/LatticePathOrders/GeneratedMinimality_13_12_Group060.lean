import LatticePathOrders.GeneratedMinimality_13_12_Part960
import LatticePathOrders.GeneratedMinimality_13_12_Part961
import LatticePathOrders.GeneratedMinimality_13_12_Part962
import LatticePathOrders.GeneratedMinimality_13_12_Part963
import LatticePathOrders.GeneratedMinimality_13_12_Part964
import LatticePathOrders.GeneratedMinimality_13_12_Part965
import LatticePathOrders.GeneratedMinimality_13_12_Part966
import LatticePathOrders.GeneratedMinimality_13_12_Part967
import LatticePathOrders.GeneratedMinimality_13_12_Part968
import LatticePathOrders.GeneratedMinimality_13_12_Part969
import LatticePathOrders.GeneratedMinimality_13_12_Part970
import LatticePathOrders.GeneratedMinimality_13_12_Part971
import LatticePathOrders.GeneratedMinimality_13_12_Part972
import LatticePathOrders.GeneratedMinimality_13_12_Part973
import LatticePathOrders.GeneratedMinimality_13_12_Part974
import LatticePathOrders.GeneratedMinimality_13_12_Part975

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_13_12

def regionsGroup060 : List (Path × Nat × AssignmentTree) :=
  regionsPart960 ++ (regionsPart961 ++ (regionsPart962 ++ (regionsPart963 ++ (regionsPart964 ++ (regionsPart965 ++ (regionsPart966 ++ (regionsPart967 ++ (regionsPart968 ++ (regionsPart969 ++ (regionsPart970 ++ (regionsPart971 ++ (regionsPart972 ++ (regionsPart973 ++ (regionsPart974 ++ (regionsPart975)))))))))))))))

theorem regionsGroup060_valid : ∀ region ∈ regionsGroup060,
    region.1.length + region.2.1 = 25 ∧
      region.2.2.check 13 12 classes region.2.1 region.1 = true := by
  intro region h
  simp only [regionsGroup060, List.mem_append] at h
  rcases h with h | h | h | h | h | h | h | h | h | h | h | h | h | h | h | h
  · exact regionsPart960_valid region h
  · exact regionsPart961_valid region h
  · exact regionsPart962_valid region h
  · exact regionsPart963_valid region h
  · exact regionsPart964_valid region h
  · exact regionsPart965_valid region h
  · exact regionsPart966_valid region h
  · exact regionsPart967_valid region h
  · exact regionsPart968_valid region h
  · exact regionsPart969_valid region h
  · exact regionsPart970_valid region h
  · exact regionsPart971_valid region h
  · exact regionsPart972_valid region h
  · exact regionsPart973_valid region h
  · exact regionsPart974_valid region h
  · exact regionsPart975_valid region h

end LatticePathOrders.GeneratedMinimality_13_12
