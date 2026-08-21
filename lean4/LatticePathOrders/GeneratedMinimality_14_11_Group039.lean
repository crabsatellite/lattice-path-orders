import LatticePathOrders.GeneratedMinimality_14_11_Part624
import LatticePathOrders.GeneratedMinimality_14_11_Part625
import LatticePathOrders.GeneratedMinimality_14_11_Part626
import LatticePathOrders.GeneratedMinimality_14_11_Part627
import LatticePathOrders.GeneratedMinimality_14_11_Part628
import LatticePathOrders.GeneratedMinimality_14_11_Part629
import LatticePathOrders.GeneratedMinimality_14_11_Part630
import LatticePathOrders.GeneratedMinimality_14_11_Part631
import LatticePathOrders.GeneratedMinimality_14_11_Part632
import LatticePathOrders.GeneratedMinimality_14_11_Part633
import LatticePathOrders.GeneratedMinimality_14_11_Part634
import LatticePathOrders.GeneratedMinimality_14_11_Part635
import LatticePathOrders.GeneratedMinimality_14_11_Part636
import LatticePathOrders.GeneratedMinimality_14_11_Part637
import LatticePathOrders.GeneratedMinimality_14_11_Part638
import LatticePathOrders.GeneratedMinimality_14_11_Part639

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_14_11

def regionsGroup039 : List (Path × Nat × AssignmentTree) :=
  regionsPart624 ++ (regionsPart625 ++ (regionsPart626 ++ (regionsPart627 ++ (regionsPart628 ++ (regionsPart629 ++ (regionsPart630 ++ (regionsPart631 ++ (regionsPart632 ++ (regionsPart633 ++ (regionsPart634 ++ (regionsPart635 ++ (regionsPart636 ++ (regionsPart637 ++ (regionsPart638 ++ (regionsPart639)))))))))))))))

theorem regionsGroup039_valid : ∀ region ∈ regionsGroup039,
    region.1.length + region.2.1 = 25 ∧
      region.2.2.check 14 11 classes region.2.1 region.1 = true := by
  intro region h
  simp only [regionsGroup039, List.mem_append] at h
  rcases h with h | h | h | h | h | h | h | h | h | h | h | h | h | h | h | h
  · exact regionsPart624_valid region h
  · exact regionsPart625_valid region h
  · exact regionsPart626_valid region h
  · exact regionsPart627_valid region h
  · exact regionsPart628_valid region h
  · exact regionsPart629_valid region h
  · exact regionsPart630_valid region h
  · exact regionsPart631_valid region h
  · exact regionsPart632_valid region h
  · exact regionsPart633_valid region h
  · exact regionsPart634_valid region h
  · exact regionsPart635_valid region h
  · exact regionsPart636_valid region h
  · exact regionsPart637_valid region h
  · exact regionsPart638_valid region h
  · exact regionsPart639_valid region h

end LatticePathOrders.GeneratedMinimality_14_11
