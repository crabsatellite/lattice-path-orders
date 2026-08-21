import LatticePathOrders.GeneratedMinimality_14_11_Part768
import LatticePathOrders.GeneratedMinimality_14_11_Part769
import LatticePathOrders.GeneratedMinimality_14_11_Part770
import LatticePathOrders.GeneratedMinimality_14_11_Part771
import LatticePathOrders.GeneratedMinimality_14_11_Part772
import LatticePathOrders.GeneratedMinimality_14_11_Part773
import LatticePathOrders.GeneratedMinimality_14_11_Part774
import LatticePathOrders.GeneratedMinimality_14_11_Part775
import LatticePathOrders.GeneratedMinimality_14_11_Part776
import LatticePathOrders.GeneratedMinimality_14_11_Part777
import LatticePathOrders.GeneratedMinimality_14_11_Part778
import LatticePathOrders.GeneratedMinimality_14_11_Part779
import LatticePathOrders.GeneratedMinimality_14_11_Part780
import LatticePathOrders.GeneratedMinimality_14_11_Part781
import LatticePathOrders.GeneratedMinimality_14_11_Part782
import LatticePathOrders.GeneratedMinimality_14_11_Part783

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_14_11

def regionsGroup048 : List (Path × Nat × AssignmentTree) :=
  regionsPart768 ++ (regionsPart769 ++ (regionsPart770 ++ (regionsPart771 ++ (regionsPart772 ++ (regionsPart773 ++ (regionsPart774 ++ (regionsPart775 ++ (regionsPart776 ++ (regionsPart777 ++ (regionsPart778 ++ (regionsPart779 ++ (regionsPart780 ++ (regionsPart781 ++ (regionsPart782 ++ (regionsPart783)))))))))))))))

theorem regionsGroup048_valid : ∀ region ∈ regionsGroup048,
    region.1.length + region.2.1 = 25 ∧
      region.2.2.check 14 11 classes region.2.1 region.1 = true := by
  intro region h
  simp only [regionsGroup048, List.mem_append] at h
  rcases h with h | h | h | h | h | h | h | h | h | h | h | h | h | h | h | h
  · exact regionsPart768_valid region h
  · exact regionsPart769_valid region h
  · exact regionsPart770_valid region h
  · exact regionsPart771_valid region h
  · exact regionsPart772_valid region h
  · exact regionsPart773_valid region h
  · exact regionsPart774_valid region h
  · exact regionsPart775_valid region h
  · exact regionsPart776_valid region h
  · exact regionsPart777_valid region h
  · exact regionsPart778_valid region h
  · exact regionsPart779_valid region h
  · exact regionsPart780_valid region h
  · exact regionsPart781_valid region h
  · exact regionsPart782_valid region h
  · exact regionsPart783_valid region h

end LatticePathOrders.GeneratedMinimality_14_11
