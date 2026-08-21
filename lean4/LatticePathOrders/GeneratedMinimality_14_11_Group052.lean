import LatticePathOrders.GeneratedMinimality_14_11_Part832
import LatticePathOrders.GeneratedMinimality_14_11_Part833
import LatticePathOrders.GeneratedMinimality_14_11_Part834
import LatticePathOrders.GeneratedMinimality_14_11_Part835
import LatticePathOrders.GeneratedMinimality_14_11_Part836
import LatticePathOrders.GeneratedMinimality_14_11_Part837
import LatticePathOrders.GeneratedMinimality_14_11_Part838
import LatticePathOrders.GeneratedMinimality_14_11_Part839
import LatticePathOrders.GeneratedMinimality_14_11_Part840
import LatticePathOrders.GeneratedMinimality_14_11_Part841
import LatticePathOrders.GeneratedMinimality_14_11_Part842
import LatticePathOrders.GeneratedMinimality_14_11_Part843
import LatticePathOrders.GeneratedMinimality_14_11_Part844
import LatticePathOrders.GeneratedMinimality_14_11_Part845
import LatticePathOrders.GeneratedMinimality_14_11_Part846
import LatticePathOrders.GeneratedMinimality_14_11_Part847

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_14_11

def regionsGroup052 : List (Path × Nat × AssignmentTree) :=
  regionsPart832 ++ (regionsPart833 ++ (regionsPart834 ++ (regionsPart835 ++ (regionsPart836 ++ (regionsPart837 ++ (regionsPart838 ++ (regionsPart839 ++ (regionsPart840 ++ (regionsPart841 ++ (regionsPart842 ++ (regionsPart843 ++ (regionsPart844 ++ (regionsPart845 ++ (regionsPart846 ++ (regionsPart847)))))))))))))))

theorem regionsGroup052_valid : ∀ region ∈ regionsGroup052,
    region.1.length + region.2.1 = 25 ∧
      region.2.2.check 14 11 classes region.2.1 region.1 = true := by
  intro region h
  simp only [regionsGroup052, List.mem_append] at h
  rcases h with h | h | h | h | h | h | h | h | h | h | h | h | h | h | h | h
  · exact regionsPart832_valid region h
  · exact regionsPart833_valid region h
  · exact regionsPart834_valid region h
  · exact regionsPart835_valid region h
  · exact regionsPart836_valid region h
  · exact regionsPart837_valid region h
  · exact regionsPart838_valid region h
  · exact regionsPart839_valid region h
  · exact regionsPart840_valid region h
  · exact regionsPart841_valid region h
  · exact regionsPart842_valid region h
  · exact regionsPart843_valid region h
  · exact regionsPart844_valid region h
  · exact regionsPart845_valid region h
  · exact regionsPart846_valid region h
  · exact regionsPart847_valid region h

end LatticePathOrders.GeneratedMinimality_14_11
