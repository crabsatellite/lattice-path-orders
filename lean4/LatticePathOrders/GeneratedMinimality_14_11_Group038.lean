import LatticePathOrders.GeneratedMinimality_14_11_Part608
import LatticePathOrders.GeneratedMinimality_14_11_Part609
import LatticePathOrders.GeneratedMinimality_14_11_Part610
import LatticePathOrders.GeneratedMinimality_14_11_Part611
import LatticePathOrders.GeneratedMinimality_14_11_Part612
import LatticePathOrders.GeneratedMinimality_14_11_Part613
import LatticePathOrders.GeneratedMinimality_14_11_Part614
import LatticePathOrders.GeneratedMinimality_14_11_Part615
import LatticePathOrders.GeneratedMinimality_14_11_Part616
import LatticePathOrders.GeneratedMinimality_14_11_Part617
import LatticePathOrders.GeneratedMinimality_14_11_Part618
import LatticePathOrders.GeneratedMinimality_14_11_Part619
import LatticePathOrders.GeneratedMinimality_14_11_Part620
import LatticePathOrders.GeneratedMinimality_14_11_Part621
import LatticePathOrders.GeneratedMinimality_14_11_Part622
import LatticePathOrders.GeneratedMinimality_14_11_Part623

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_14_11

def regionsGroup038 : List (Path × Nat × AssignmentTree) :=
  regionsPart608 ++ (regionsPart609 ++ (regionsPart610 ++ (regionsPart611 ++ (regionsPart612 ++ (regionsPart613 ++ (regionsPart614 ++ (regionsPart615 ++ (regionsPart616 ++ (regionsPart617 ++ (regionsPart618 ++ (regionsPart619 ++ (regionsPart620 ++ (regionsPart621 ++ (regionsPart622 ++ (regionsPart623)))))))))))))))

theorem regionsGroup038_valid : ∀ region ∈ regionsGroup038,
    region.1.length + region.2.1 = 25 ∧
      region.2.2.check 14 11 classes region.2.1 region.1 = true := by
  intro region h
  simp only [regionsGroup038, List.mem_append] at h
  rcases h with h | h | h | h | h | h | h | h | h | h | h | h | h | h | h | h
  · exact regionsPart608_valid region h
  · exact regionsPart609_valid region h
  · exact regionsPart610_valid region h
  · exact regionsPart611_valid region h
  · exact regionsPart612_valid region h
  · exact regionsPart613_valid region h
  · exact regionsPart614_valid region h
  · exact regionsPart615_valid region h
  · exact regionsPart616_valid region h
  · exact regionsPart617_valid region h
  · exact regionsPart618_valid region h
  · exact regionsPart619_valid region h
  · exact regionsPart620_valid region h
  · exact regionsPart621_valid region h
  · exact regionsPart622_valid region h
  · exact regionsPart623_valid region h

end LatticePathOrders.GeneratedMinimality_14_11
