import LatticePathOrders.GeneratedMinimality_14_11_Part656
import LatticePathOrders.GeneratedMinimality_14_11_Part657
import LatticePathOrders.GeneratedMinimality_14_11_Part658
import LatticePathOrders.GeneratedMinimality_14_11_Part659
import LatticePathOrders.GeneratedMinimality_14_11_Part660
import LatticePathOrders.GeneratedMinimality_14_11_Part661
import LatticePathOrders.GeneratedMinimality_14_11_Part662
import LatticePathOrders.GeneratedMinimality_14_11_Part663
import LatticePathOrders.GeneratedMinimality_14_11_Part664
import LatticePathOrders.GeneratedMinimality_14_11_Part665
import LatticePathOrders.GeneratedMinimality_14_11_Part666
import LatticePathOrders.GeneratedMinimality_14_11_Part667
import LatticePathOrders.GeneratedMinimality_14_11_Part668
import LatticePathOrders.GeneratedMinimality_14_11_Part669
import LatticePathOrders.GeneratedMinimality_14_11_Part670
import LatticePathOrders.GeneratedMinimality_14_11_Part671

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_14_11

def regionsGroup041 : List (Path × Nat × AssignmentTree) :=
  regionsPart656 ++ (regionsPart657 ++ (regionsPart658 ++ (regionsPart659 ++ (regionsPart660 ++ (regionsPart661 ++ (regionsPart662 ++ (regionsPart663 ++ (regionsPart664 ++ (regionsPart665 ++ (regionsPart666 ++ (regionsPart667 ++ (regionsPart668 ++ (regionsPart669 ++ (regionsPart670 ++ (regionsPart671)))))))))))))))

theorem regionsGroup041_valid : ∀ region ∈ regionsGroup041,
    region.1.length + region.2.1 = 25 ∧
      region.2.2.check 14 11 classes region.2.1 region.1 = true := by
  intro region h
  simp only [regionsGroup041, List.mem_append] at h
  rcases h with h | h | h | h | h | h | h | h | h | h | h | h | h | h | h | h
  · exact regionsPart656_valid region h
  · exact regionsPart657_valid region h
  · exact regionsPart658_valid region h
  · exact regionsPart659_valid region h
  · exact regionsPart660_valid region h
  · exact regionsPart661_valid region h
  · exact regionsPart662_valid region h
  · exact regionsPart663_valid region h
  · exact regionsPart664_valid region h
  · exact regionsPart665_valid region h
  · exact regionsPart666_valid region h
  · exact regionsPart667_valid region h
  · exact regionsPart668_valid region h
  · exact regionsPart669_valid region h
  · exact regionsPart670_valid region h
  · exact regionsPart671_valid region h

end LatticePathOrders.GeneratedMinimality_14_11
