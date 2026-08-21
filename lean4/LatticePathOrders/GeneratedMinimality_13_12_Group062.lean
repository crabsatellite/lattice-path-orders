import LatticePathOrders.GeneratedMinimality_13_12_Part992
import LatticePathOrders.GeneratedMinimality_13_12_Part993
import LatticePathOrders.GeneratedMinimality_13_12_Part994
import LatticePathOrders.GeneratedMinimality_13_12_Part995
import LatticePathOrders.GeneratedMinimality_13_12_Part996
import LatticePathOrders.GeneratedMinimality_13_12_Part997
import LatticePathOrders.GeneratedMinimality_13_12_Part998
import LatticePathOrders.GeneratedMinimality_13_12_Part999
import LatticePathOrders.GeneratedMinimality_13_12_Part1000
import LatticePathOrders.GeneratedMinimality_13_12_Part1001
import LatticePathOrders.GeneratedMinimality_13_12_Part1002
import LatticePathOrders.GeneratedMinimality_13_12_Part1003
import LatticePathOrders.GeneratedMinimality_13_12_Part1004
import LatticePathOrders.GeneratedMinimality_13_12_Part1005
import LatticePathOrders.GeneratedMinimality_13_12_Part1006
import LatticePathOrders.GeneratedMinimality_13_12_Part1007

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_13_12

def regionsGroup062 : List (Path × Nat × AssignmentTree) :=
  regionsPart992 ++ (regionsPart993 ++ (regionsPart994 ++ (regionsPart995 ++ (regionsPart996 ++ (regionsPart997 ++ (regionsPart998 ++ (regionsPart999 ++ (regionsPart1000 ++ (regionsPart1001 ++ (regionsPart1002 ++ (regionsPart1003 ++ (regionsPart1004 ++ (regionsPart1005 ++ (regionsPart1006 ++ (regionsPart1007)))))))))))))))

theorem regionsGroup062_valid : ∀ region ∈ regionsGroup062,
    region.1.length + region.2.1 = 25 ∧
      region.2.2.check 13 12 classes region.2.1 region.1 = true := by
  intro region h
  simp only [regionsGroup062, List.mem_append] at h
  rcases h with h | h | h | h | h | h | h | h | h | h | h | h | h | h | h | h
  · exact regionsPart992_valid region h
  · exact regionsPart993_valid region h
  · exact regionsPart994_valid region h
  · exact regionsPart995_valid region h
  · exact regionsPart996_valid region h
  · exact regionsPart997_valid region h
  · exact regionsPart998_valid region h
  · exact regionsPart999_valid region h
  · exact regionsPart1000_valid region h
  · exact regionsPart1001_valid region h
  · exact regionsPart1002_valid region h
  · exact regionsPart1003_valid region h
  · exact regionsPart1004_valid region h
  · exact regionsPart1005_valid region h
  · exact regionsPart1006_valid region h
  · exact regionsPart1007_valid region h

end LatticePathOrders.GeneratedMinimality_13_12
