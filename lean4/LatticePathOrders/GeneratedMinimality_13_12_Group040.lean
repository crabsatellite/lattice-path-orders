import LatticePathOrders.GeneratedMinimality_13_12_Part640
import LatticePathOrders.GeneratedMinimality_13_12_Part641
import LatticePathOrders.GeneratedMinimality_13_12_Part642
import LatticePathOrders.GeneratedMinimality_13_12_Part643
import LatticePathOrders.GeneratedMinimality_13_12_Part644
import LatticePathOrders.GeneratedMinimality_13_12_Part645
import LatticePathOrders.GeneratedMinimality_13_12_Part646
import LatticePathOrders.GeneratedMinimality_13_12_Part647
import LatticePathOrders.GeneratedMinimality_13_12_Part648
import LatticePathOrders.GeneratedMinimality_13_12_Part649
import LatticePathOrders.GeneratedMinimality_13_12_Part650
import LatticePathOrders.GeneratedMinimality_13_12_Part651
import LatticePathOrders.GeneratedMinimality_13_12_Part652
import LatticePathOrders.GeneratedMinimality_13_12_Part653
import LatticePathOrders.GeneratedMinimality_13_12_Part654
import LatticePathOrders.GeneratedMinimality_13_12_Part655

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_13_12

def regionsGroup040 : List (Path × Nat × AssignmentTree) :=
  regionsPart640 ++ (regionsPart641 ++ (regionsPart642 ++ (regionsPart643 ++ (regionsPart644 ++ (regionsPart645 ++ (regionsPart646 ++ (regionsPart647 ++ (regionsPart648 ++ (regionsPart649 ++ (regionsPart650 ++ (regionsPart651 ++ (regionsPart652 ++ (regionsPart653 ++ (regionsPart654 ++ (regionsPart655)))))))))))))))

theorem regionsGroup040_valid : ∀ region ∈ regionsGroup040,
    region.1.length + region.2.1 = 25 ∧
      region.2.2.check 13 12 classes region.2.1 region.1 = true := by
  intro region h
  simp only [regionsGroup040, List.mem_append] at h
  rcases h with h | h | h | h | h | h | h | h | h | h | h | h | h | h | h | h
  · exact regionsPart640_valid region h
  · exact regionsPart641_valid region h
  · exact regionsPart642_valid region h
  · exact regionsPart643_valid region h
  · exact regionsPart644_valid region h
  · exact regionsPart645_valid region h
  · exact regionsPart646_valid region h
  · exact regionsPart647_valid region h
  · exact regionsPart648_valid region h
  · exact regionsPart649_valid region h
  · exact regionsPart650_valid region h
  · exact regionsPart651_valid region h
  · exact regionsPart652_valid region h
  · exact regionsPart653_valid region h
  · exact regionsPart654_valid region h
  · exact regionsPart655_valid region h

end LatticePathOrders.GeneratedMinimality_13_12
