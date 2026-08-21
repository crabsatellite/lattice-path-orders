import LatticePathOrders.GeneratedMinimality_13_12_Part704
import LatticePathOrders.GeneratedMinimality_13_12_Part705
import LatticePathOrders.GeneratedMinimality_13_12_Part706
import LatticePathOrders.GeneratedMinimality_13_12_Part707
import LatticePathOrders.GeneratedMinimality_13_12_Part708
import LatticePathOrders.GeneratedMinimality_13_12_Part709
import LatticePathOrders.GeneratedMinimality_13_12_Part710
import LatticePathOrders.GeneratedMinimality_13_12_Part711
import LatticePathOrders.GeneratedMinimality_13_12_Part712
import LatticePathOrders.GeneratedMinimality_13_12_Part713
import LatticePathOrders.GeneratedMinimality_13_12_Part714
import LatticePathOrders.GeneratedMinimality_13_12_Part715
import LatticePathOrders.GeneratedMinimality_13_12_Part716
import LatticePathOrders.GeneratedMinimality_13_12_Part717
import LatticePathOrders.GeneratedMinimality_13_12_Part718
import LatticePathOrders.GeneratedMinimality_13_12_Part719

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_13_12

def regionsGroup044 : List (Path × Nat × AssignmentTree) :=
  regionsPart704 ++ (regionsPart705 ++ (regionsPart706 ++ (regionsPart707 ++ (regionsPart708 ++ (regionsPart709 ++ (regionsPart710 ++ (regionsPart711 ++ (regionsPart712 ++ (regionsPart713 ++ (regionsPart714 ++ (regionsPart715 ++ (regionsPart716 ++ (regionsPart717 ++ (regionsPart718 ++ (regionsPart719)))))))))))))))

theorem regionsGroup044_valid : ∀ region ∈ regionsGroup044,
    region.1.length + region.2.1 = 25 ∧
      region.2.2.check 13 12 classes region.2.1 region.1 = true := by
  intro region h
  simp only [regionsGroup044, List.mem_append] at h
  rcases h with h | h | h | h | h | h | h | h | h | h | h | h | h | h | h | h
  · exact regionsPart704_valid region h
  · exact regionsPart705_valid region h
  · exact regionsPart706_valid region h
  · exact regionsPart707_valid region h
  · exact regionsPart708_valid region h
  · exact regionsPart709_valid region h
  · exact regionsPart710_valid region h
  · exact regionsPart711_valid region h
  · exact regionsPart712_valid region h
  · exact regionsPart713_valid region h
  · exact regionsPart714_valid region h
  · exact regionsPart715_valid region h
  · exact regionsPart716_valid region h
  · exact regionsPart717_valid region h
  · exact regionsPart718_valid region h
  · exact regionsPart719_valid region h

end LatticePathOrders.GeneratedMinimality_13_12
