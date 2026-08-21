import LatticePathOrders.GeneratedMinimality_14_11_Part752
import LatticePathOrders.GeneratedMinimality_14_11_Part753
import LatticePathOrders.GeneratedMinimality_14_11_Part754
import LatticePathOrders.GeneratedMinimality_14_11_Part755
import LatticePathOrders.GeneratedMinimality_14_11_Part756
import LatticePathOrders.GeneratedMinimality_14_11_Part757
import LatticePathOrders.GeneratedMinimality_14_11_Part758
import LatticePathOrders.GeneratedMinimality_14_11_Part759
import LatticePathOrders.GeneratedMinimality_14_11_Part760
import LatticePathOrders.GeneratedMinimality_14_11_Part761
import LatticePathOrders.GeneratedMinimality_14_11_Part762
import LatticePathOrders.GeneratedMinimality_14_11_Part763
import LatticePathOrders.GeneratedMinimality_14_11_Part764
import LatticePathOrders.GeneratedMinimality_14_11_Part765
import LatticePathOrders.GeneratedMinimality_14_11_Part766
import LatticePathOrders.GeneratedMinimality_14_11_Part767

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_14_11

def regionsGroup047 : List (Path × Nat × AssignmentTree) :=
  regionsPart752 ++ (regionsPart753 ++ (regionsPart754 ++ (regionsPart755 ++ (regionsPart756 ++ (regionsPart757 ++ (regionsPart758 ++ (regionsPart759 ++ (regionsPart760 ++ (regionsPart761 ++ (regionsPart762 ++ (regionsPart763 ++ (regionsPart764 ++ (regionsPart765 ++ (regionsPart766 ++ (regionsPart767)))))))))))))))

theorem regionsGroup047_valid : ∀ region ∈ regionsGroup047,
    region.1.length + region.2.1 = 25 ∧
      region.2.2.check 14 11 classes region.2.1 region.1 = true := by
  intro region h
  simp only [regionsGroup047, List.mem_append] at h
  rcases h with h | h | h | h | h | h | h | h | h | h | h | h | h | h | h | h
  · exact regionsPart752_valid region h
  · exact regionsPart753_valid region h
  · exact regionsPart754_valid region h
  · exact regionsPart755_valid region h
  · exact regionsPart756_valid region h
  · exact regionsPart757_valid region h
  · exact regionsPart758_valid region h
  · exact regionsPart759_valid region h
  · exact regionsPart760_valid region h
  · exact regionsPart761_valid region h
  · exact regionsPart762_valid region h
  · exact regionsPart763_valid region h
  · exact regionsPart764_valid region h
  · exact regionsPart765_valid region h
  · exact regionsPart766_valid region h
  · exact regionsPart767_valid region h

end LatticePathOrders.GeneratedMinimality_14_11
