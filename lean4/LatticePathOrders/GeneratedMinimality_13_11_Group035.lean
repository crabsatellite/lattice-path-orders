import LatticePathOrders.GeneratedMinimality_13_11_Part560
import LatticePathOrders.GeneratedMinimality_13_11_Part561
import LatticePathOrders.GeneratedMinimality_13_11_Part562
import LatticePathOrders.GeneratedMinimality_13_11_Part563
import LatticePathOrders.GeneratedMinimality_13_11_Part564
import LatticePathOrders.GeneratedMinimality_13_11_Part565
import LatticePathOrders.GeneratedMinimality_13_11_Part566
import LatticePathOrders.GeneratedMinimality_13_11_Part567
import LatticePathOrders.GeneratedMinimality_13_11_Part568
import LatticePathOrders.GeneratedMinimality_13_11_Part569
import LatticePathOrders.GeneratedMinimality_13_11_Part570
import LatticePathOrders.GeneratedMinimality_13_11_Part571
import LatticePathOrders.GeneratedMinimality_13_11_Part572
import LatticePathOrders.GeneratedMinimality_13_11_Part573
import LatticePathOrders.GeneratedMinimality_13_11_Part574
import LatticePathOrders.GeneratedMinimality_13_11_Part575

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_13_11

def regionsGroup035 : List (Path × Nat × AssignmentTree) :=
  regionsPart560 ++ (regionsPart561 ++ (regionsPart562 ++ (regionsPart563 ++ (regionsPart564 ++ (regionsPart565 ++ (regionsPart566 ++ (regionsPart567 ++ (regionsPart568 ++ (regionsPart569 ++ (regionsPart570 ++ (regionsPart571 ++ (regionsPart572 ++ (regionsPart573 ++ (regionsPart574 ++ (regionsPart575)))))))))))))))

theorem regionsGroup035_valid : ∀ region ∈ regionsGroup035,
    region.1.length + region.2.1 = 24 ∧
      region.2.2.check 13 11 classes region.2.1 region.1 = true := by
  intro region h
  simp only [regionsGroup035, List.mem_append] at h
  rcases h with h | h | h | h | h | h | h | h | h | h | h | h | h | h | h | h
  · exact regionsPart560_valid region h
  · exact regionsPart561_valid region h
  · exact regionsPart562_valid region h
  · exact regionsPart563_valid region h
  · exact regionsPart564_valid region h
  · exact regionsPart565_valid region h
  · exact regionsPart566_valid region h
  · exact regionsPart567_valid region h
  · exact regionsPart568_valid region h
  · exact regionsPart569_valid region h
  · exact regionsPart570_valid region h
  · exact regionsPart571_valid region h
  · exact regionsPart572_valid region h
  · exact regionsPart573_valid region h
  · exact regionsPart574_valid region h
  · exact regionsPart575_valid region h

end LatticePathOrders.GeneratedMinimality_13_11
