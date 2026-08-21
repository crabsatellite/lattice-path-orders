import LatticePathOrders.GeneratedMinimality_13_12_Part688
import LatticePathOrders.GeneratedMinimality_13_12_Part689
import LatticePathOrders.GeneratedMinimality_13_12_Part690
import LatticePathOrders.GeneratedMinimality_13_12_Part691
import LatticePathOrders.GeneratedMinimality_13_12_Part692
import LatticePathOrders.GeneratedMinimality_13_12_Part693
import LatticePathOrders.GeneratedMinimality_13_12_Part694
import LatticePathOrders.GeneratedMinimality_13_12_Part695
import LatticePathOrders.GeneratedMinimality_13_12_Part696
import LatticePathOrders.GeneratedMinimality_13_12_Part697
import LatticePathOrders.GeneratedMinimality_13_12_Part698
import LatticePathOrders.GeneratedMinimality_13_12_Part699
import LatticePathOrders.GeneratedMinimality_13_12_Part700
import LatticePathOrders.GeneratedMinimality_13_12_Part701
import LatticePathOrders.GeneratedMinimality_13_12_Part702
import LatticePathOrders.GeneratedMinimality_13_12_Part703

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_13_12

def regionsGroup043 : List (Path × Nat × AssignmentTree) :=
  regionsPart688 ++ (regionsPart689 ++ (regionsPart690 ++ (regionsPart691 ++ (regionsPart692 ++ (regionsPart693 ++ (regionsPart694 ++ (regionsPart695 ++ (regionsPart696 ++ (regionsPart697 ++ (regionsPart698 ++ (regionsPart699 ++ (regionsPart700 ++ (regionsPart701 ++ (regionsPart702 ++ (regionsPart703)))))))))))))))

theorem regionsGroup043_valid : ∀ region ∈ regionsGroup043,
    region.1.length + region.2.1 = 25 ∧
      region.2.2.check 13 12 classes region.2.1 region.1 = true := by
  intro region h
  simp only [regionsGroup043, List.mem_append] at h
  rcases h with h | h | h | h | h | h | h | h | h | h | h | h | h | h | h | h
  · exact regionsPart688_valid region h
  · exact regionsPart689_valid region h
  · exact regionsPart690_valid region h
  · exact regionsPart691_valid region h
  · exact regionsPart692_valid region h
  · exact regionsPart693_valid region h
  · exact regionsPart694_valid region h
  · exact regionsPart695_valid region h
  · exact regionsPart696_valid region h
  · exact regionsPart697_valid region h
  · exact regionsPart698_valid region h
  · exact regionsPart699_valid region h
  · exact regionsPart700_valid region h
  · exact regionsPart701_valid region h
  · exact regionsPart702_valid region h
  · exact regionsPart703_valid region h

end LatticePathOrders.GeneratedMinimality_13_12
