import LatticePathOrders.GeneratedMinimality_13_12_Part672
import LatticePathOrders.GeneratedMinimality_13_12_Part673
import LatticePathOrders.GeneratedMinimality_13_12_Part674
import LatticePathOrders.GeneratedMinimality_13_12_Part675
import LatticePathOrders.GeneratedMinimality_13_12_Part676
import LatticePathOrders.GeneratedMinimality_13_12_Part677
import LatticePathOrders.GeneratedMinimality_13_12_Part678
import LatticePathOrders.GeneratedMinimality_13_12_Part679
import LatticePathOrders.GeneratedMinimality_13_12_Part680
import LatticePathOrders.GeneratedMinimality_13_12_Part681
import LatticePathOrders.GeneratedMinimality_13_12_Part682
import LatticePathOrders.GeneratedMinimality_13_12_Part683
import LatticePathOrders.GeneratedMinimality_13_12_Part684
import LatticePathOrders.GeneratedMinimality_13_12_Part685
import LatticePathOrders.GeneratedMinimality_13_12_Part686
import LatticePathOrders.GeneratedMinimality_13_12_Part687

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_13_12

def regionsGroup042 : List (Path × Nat × AssignmentTree) :=
  regionsPart672 ++ (regionsPart673 ++ (regionsPart674 ++ (regionsPart675 ++ (regionsPart676 ++ (regionsPart677 ++ (regionsPart678 ++ (regionsPart679 ++ (regionsPart680 ++ (regionsPart681 ++ (regionsPart682 ++ (regionsPart683 ++ (regionsPart684 ++ (regionsPart685 ++ (regionsPart686 ++ (regionsPart687)))))))))))))))

theorem regionsGroup042_valid : ∀ region ∈ regionsGroup042,
    region.1.length + region.2.1 = 25 ∧
      region.2.2.check 13 12 classes region.2.1 region.1 = true := by
  intro region h
  simp only [regionsGroup042, List.mem_append] at h
  rcases h with h | h | h | h | h | h | h | h | h | h | h | h | h | h | h | h
  · exact regionsPart672_valid region h
  · exact regionsPart673_valid region h
  · exact regionsPart674_valid region h
  · exact regionsPart675_valid region h
  · exact regionsPart676_valid region h
  · exact regionsPart677_valid region h
  · exact regionsPart678_valid region h
  · exact regionsPart679_valid region h
  · exact regionsPart680_valid region h
  · exact regionsPart681_valid region h
  · exact regionsPart682_valid region h
  · exact regionsPart683_valid region h
  · exact regionsPart684_valid region h
  · exact regionsPart685_valid region h
  · exact regionsPart686_valid region h
  · exact regionsPart687_valid region h

end LatticePathOrders.GeneratedMinimality_13_12
