import LatticePathOrders.GeneratedMinimality_14_11_Part800
import LatticePathOrders.GeneratedMinimality_14_11_Part801
import LatticePathOrders.GeneratedMinimality_14_11_Part802
import LatticePathOrders.GeneratedMinimality_14_11_Part803
import LatticePathOrders.GeneratedMinimality_14_11_Part804
import LatticePathOrders.GeneratedMinimality_14_11_Part805
import LatticePathOrders.GeneratedMinimality_14_11_Part806
import LatticePathOrders.GeneratedMinimality_14_11_Part807
import LatticePathOrders.GeneratedMinimality_14_11_Part808
import LatticePathOrders.GeneratedMinimality_14_11_Part809
import LatticePathOrders.GeneratedMinimality_14_11_Part810
import LatticePathOrders.GeneratedMinimality_14_11_Part811
import LatticePathOrders.GeneratedMinimality_14_11_Part812
import LatticePathOrders.GeneratedMinimality_14_11_Part813
import LatticePathOrders.GeneratedMinimality_14_11_Part814
import LatticePathOrders.GeneratedMinimality_14_11_Part815

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_14_11

def regionsGroup050 : List (Path × Nat × AssignmentTree) :=
  regionsPart800 ++ (regionsPart801 ++ (regionsPart802 ++ (regionsPart803 ++ (regionsPart804 ++ (regionsPart805 ++ (regionsPart806 ++ (regionsPart807 ++ (regionsPart808 ++ (regionsPart809 ++ (regionsPart810 ++ (regionsPart811 ++ (regionsPart812 ++ (regionsPart813 ++ (regionsPart814 ++ (regionsPart815)))))))))))))))

theorem regionsGroup050_valid : ∀ region ∈ regionsGroup050,
    region.1.length + region.2.1 = 25 ∧
      region.2.2.check 14 11 classes region.2.1 region.1 = true := by
  intro region h
  simp only [regionsGroup050, List.mem_append] at h
  rcases h with h | h | h | h | h | h | h | h | h | h | h | h | h | h | h | h
  · exact regionsPart800_valid region h
  · exact regionsPart801_valid region h
  · exact regionsPart802_valid region h
  · exact regionsPart803_valid region h
  · exact regionsPart804_valid region h
  · exact regionsPart805_valid region h
  · exact regionsPart806_valid region h
  · exact regionsPart807_valid region h
  · exact regionsPart808_valid region h
  · exact regionsPart809_valid region h
  · exact regionsPart810_valid region h
  · exact regionsPart811_valid region h
  · exact regionsPart812_valid region h
  · exact regionsPart813_valid region h
  · exact regionsPart814_valid region h
  · exact regionsPart815_valid region h

end LatticePathOrders.GeneratedMinimality_14_11
