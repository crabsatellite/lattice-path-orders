import LatticePathOrders.GeneratedMinimality_14_11_Part880
import LatticePathOrders.GeneratedMinimality_14_11_Part881
import LatticePathOrders.GeneratedMinimality_14_11_Part882
import LatticePathOrders.GeneratedMinimality_14_11_Part883
import LatticePathOrders.GeneratedMinimality_14_11_Part884
import LatticePathOrders.GeneratedMinimality_14_11_Part885
import LatticePathOrders.GeneratedMinimality_14_11_Part886
import LatticePathOrders.GeneratedMinimality_14_11_Part887
import LatticePathOrders.GeneratedMinimality_14_11_Part888
import LatticePathOrders.GeneratedMinimality_14_11_Part889
import LatticePathOrders.GeneratedMinimality_14_11_Part890
import LatticePathOrders.GeneratedMinimality_14_11_Part891
import LatticePathOrders.GeneratedMinimality_14_11_Part892
import LatticePathOrders.GeneratedMinimality_14_11_Part893
import LatticePathOrders.GeneratedMinimality_14_11_Part894
import LatticePathOrders.GeneratedMinimality_14_11_Part895

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_14_11

def regionsGroup055 : List (Path × Nat × AssignmentTree) :=
  regionsPart880 ++ (regionsPart881 ++ (regionsPart882 ++ (regionsPart883 ++ (regionsPart884 ++ (regionsPart885 ++ (regionsPart886 ++ (regionsPart887 ++ (regionsPart888 ++ (regionsPart889 ++ (regionsPart890 ++ (regionsPart891 ++ (regionsPart892 ++ (regionsPart893 ++ (regionsPart894 ++ (regionsPart895)))))))))))))))

theorem regionsGroup055_valid : ∀ region ∈ regionsGroup055,
    region.1.length + region.2.1 = 25 ∧
      region.2.2.check 14 11 classes region.2.1 region.1 = true := by
  intro region h
  simp only [regionsGroup055, List.mem_append] at h
  rcases h with h | h | h | h | h | h | h | h | h | h | h | h | h | h | h | h
  · exact regionsPart880_valid region h
  · exact regionsPart881_valid region h
  · exact regionsPart882_valid region h
  · exact regionsPart883_valid region h
  · exact regionsPart884_valid region h
  · exact regionsPart885_valid region h
  · exact regionsPart886_valid region h
  · exact regionsPart887_valid region h
  · exact regionsPart888_valid region h
  · exact regionsPart889_valid region h
  · exact regionsPart890_valid region h
  · exact regionsPart891_valid region h
  · exact regionsPart892_valid region h
  · exact regionsPart893_valid region h
  · exact regionsPart894_valid region h
  · exact regionsPart895_valid region h

end LatticePathOrders.GeneratedMinimality_14_11
