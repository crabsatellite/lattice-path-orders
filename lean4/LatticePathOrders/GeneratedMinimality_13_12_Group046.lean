import LatticePathOrders.GeneratedMinimality_13_12_Part736
import LatticePathOrders.GeneratedMinimality_13_12_Part737
import LatticePathOrders.GeneratedMinimality_13_12_Part738
import LatticePathOrders.GeneratedMinimality_13_12_Part739
import LatticePathOrders.GeneratedMinimality_13_12_Part740
import LatticePathOrders.GeneratedMinimality_13_12_Part741
import LatticePathOrders.GeneratedMinimality_13_12_Part742
import LatticePathOrders.GeneratedMinimality_13_12_Part743
import LatticePathOrders.GeneratedMinimality_13_12_Part744
import LatticePathOrders.GeneratedMinimality_13_12_Part745
import LatticePathOrders.GeneratedMinimality_13_12_Part746
import LatticePathOrders.GeneratedMinimality_13_12_Part747
import LatticePathOrders.GeneratedMinimality_13_12_Part748
import LatticePathOrders.GeneratedMinimality_13_12_Part749
import LatticePathOrders.GeneratedMinimality_13_12_Part750
import LatticePathOrders.GeneratedMinimality_13_12_Part751

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_13_12

def regionsGroup046 : List (Path × Nat × AssignmentTree) :=
  regionsPart736 ++ (regionsPart737 ++ (regionsPart738 ++ (regionsPart739 ++ (regionsPart740 ++ (regionsPart741 ++ (regionsPart742 ++ (regionsPart743 ++ (regionsPart744 ++ (regionsPart745 ++ (regionsPart746 ++ (regionsPart747 ++ (regionsPart748 ++ (regionsPart749 ++ (regionsPart750 ++ (regionsPart751)))))))))))))))

theorem regionsGroup046_valid : ∀ region ∈ regionsGroup046,
    region.1.length + region.2.1 = 25 ∧
      region.2.2.check 13 12 classes region.2.1 region.1 = true := by
  intro region h
  simp only [regionsGroup046, List.mem_append] at h
  rcases h with h | h | h | h | h | h | h | h | h | h | h | h | h | h | h | h
  · exact regionsPart736_valid region h
  · exact regionsPart737_valid region h
  · exact regionsPart738_valid region h
  · exact regionsPart739_valid region h
  · exact regionsPart740_valid region h
  · exact regionsPart741_valid region h
  · exact regionsPart742_valid region h
  · exact regionsPart743_valid region h
  · exact regionsPart744_valid region h
  · exact regionsPart745_valid region h
  · exact regionsPart746_valid region h
  · exact regionsPart747_valid region h
  · exact regionsPart748_valid region h
  · exact regionsPart749_valid region h
  · exact regionsPart750_valid region h
  · exact regionsPart751_valid region h

end LatticePathOrders.GeneratedMinimality_13_12
