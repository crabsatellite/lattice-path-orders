import LatticePathOrders.GeneratedMinimality_13_12_Part816
import LatticePathOrders.GeneratedMinimality_13_12_Part817
import LatticePathOrders.GeneratedMinimality_13_12_Part818
import LatticePathOrders.GeneratedMinimality_13_12_Part819
import LatticePathOrders.GeneratedMinimality_13_12_Part820
import LatticePathOrders.GeneratedMinimality_13_12_Part821
import LatticePathOrders.GeneratedMinimality_13_12_Part822
import LatticePathOrders.GeneratedMinimality_13_12_Part823
import LatticePathOrders.GeneratedMinimality_13_12_Part824
import LatticePathOrders.GeneratedMinimality_13_12_Part825
import LatticePathOrders.GeneratedMinimality_13_12_Part826
import LatticePathOrders.GeneratedMinimality_13_12_Part827
import LatticePathOrders.GeneratedMinimality_13_12_Part828
import LatticePathOrders.GeneratedMinimality_13_12_Part829
import LatticePathOrders.GeneratedMinimality_13_12_Part830
import LatticePathOrders.GeneratedMinimality_13_12_Part831

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_13_12

def regionsGroup051 : List (Path × Nat × AssignmentTree) :=
  regionsPart816 ++ (regionsPart817 ++ (regionsPart818 ++ (regionsPart819 ++ (regionsPart820 ++ (regionsPart821 ++ (regionsPart822 ++ (regionsPart823 ++ (regionsPart824 ++ (regionsPart825 ++ (regionsPart826 ++ (regionsPart827 ++ (regionsPart828 ++ (regionsPart829 ++ (regionsPart830 ++ (regionsPart831)))))))))))))))

theorem regionsGroup051_valid : ∀ region ∈ regionsGroup051,
    region.1.length + region.2.1 = 25 ∧
      region.2.2.check 13 12 classes region.2.1 region.1 = true := by
  intro region h
  simp only [regionsGroup051, List.mem_append] at h
  rcases h with h | h | h | h | h | h | h | h | h | h | h | h | h | h | h | h
  · exact regionsPart816_valid region h
  · exact regionsPart817_valid region h
  · exact regionsPart818_valid region h
  · exact regionsPart819_valid region h
  · exact regionsPart820_valid region h
  · exact regionsPart821_valid region h
  · exact regionsPart822_valid region h
  · exact regionsPart823_valid region h
  · exact regionsPart824_valid region h
  · exact regionsPart825_valid region h
  · exact regionsPart826_valid region h
  · exact regionsPart827_valid region h
  · exact regionsPart828_valid region h
  · exact regionsPart829_valid region h
  · exact regionsPart830_valid region h
  · exact regionsPart831_valid region h

end LatticePathOrders.GeneratedMinimality_13_12
