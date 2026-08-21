import LatticePathOrders.GeneratedMinimality_13_12_Part784
import LatticePathOrders.GeneratedMinimality_13_12_Part785
import LatticePathOrders.GeneratedMinimality_13_12_Part786
import LatticePathOrders.GeneratedMinimality_13_12_Part787
import LatticePathOrders.GeneratedMinimality_13_12_Part788
import LatticePathOrders.GeneratedMinimality_13_12_Part789
import LatticePathOrders.GeneratedMinimality_13_12_Part790
import LatticePathOrders.GeneratedMinimality_13_12_Part791
import LatticePathOrders.GeneratedMinimality_13_12_Part792
import LatticePathOrders.GeneratedMinimality_13_12_Part793
import LatticePathOrders.GeneratedMinimality_13_12_Part794
import LatticePathOrders.GeneratedMinimality_13_12_Part795
import LatticePathOrders.GeneratedMinimality_13_12_Part796
import LatticePathOrders.GeneratedMinimality_13_12_Part797
import LatticePathOrders.GeneratedMinimality_13_12_Part798
import LatticePathOrders.GeneratedMinimality_13_12_Part799

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_13_12

def regionsGroup049 : List (Path × Nat × AssignmentTree) :=
  regionsPart784 ++ (regionsPart785 ++ (regionsPart786 ++ (regionsPart787 ++ (regionsPart788 ++ (regionsPart789 ++ (regionsPart790 ++ (regionsPart791 ++ (regionsPart792 ++ (regionsPart793 ++ (regionsPart794 ++ (regionsPart795 ++ (regionsPart796 ++ (regionsPart797 ++ (regionsPart798 ++ (regionsPart799)))))))))))))))

theorem regionsGroup049_valid : ∀ region ∈ regionsGroup049,
    region.1.length + region.2.1 = 25 ∧
      region.2.2.check 13 12 classes region.2.1 region.1 = true := by
  intro region h
  simp only [regionsGroup049, List.mem_append] at h
  rcases h with h | h | h | h | h | h | h | h | h | h | h | h | h | h | h | h
  · exact regionsPart784_valid region h
  · exact regionsPart785_valid region h
  · exact regionsPart786_valid region h
  · exact regionsPart787_valid region h
  · exact regionsPart788_valid region h
  · exact regionsPart789_valid region h
  · exact regionsPart790_valid region h
  · exact regionsPart791_valid region h
  · exact regionsPart792_valid region h
  · exact regionsPart793_valid region h
  · exact regionsPart794_valid region h
  · exact regionsPart795_valid region h
  · exact regionsPart796_valid region h
  · exact regionsPart797_valid region h
  · exact regionsPart798_valid region h
  · exact regionsPart799_valid region h

end LatticePathOrders.GeneratedMinimality_13_12
