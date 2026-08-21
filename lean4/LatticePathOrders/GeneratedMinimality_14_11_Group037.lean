import LatticePathOrders.GeneratedMinimality_14_11_Part592
import LatticePathOrders.GeneratedMinimality_14_11_Part593
import LatticePathOrders.GeneratedMinimality_14_11_Part594
import LatticePathOrders.GeneratedMinimality_14_11_Part595
import LatticePathOrders.GeneratedMinimality_14_11_Part596
import LatticePathOrders.GeneratedMinimality_14_11_Part597
import LatticePathOrders.GeneratedMinimality_14_11_Part598
import LatticePathOrders.GeneratedMinimality_14_11_Part599
import LatticePathOrders.GeneratedMinimality_14_11_Part600
import LatticePathOrders.GeneratedMinimality_14_11_Part601
import LatticePathOrders.GeneratedMinimality_14_11_Part602
import LatticePathOrders.GeneratedMinimality_14_11_Part603
import LatticePathOrders.GeneratedMinimality_14_11_Part604
import LatticePathOrders.GeneratedMinimality_14_11_Part605
import LatticePathOrders.GeneratedMinimality_14_11_Part606
import LatticePathOrders.GeneratedMinimality_14_11_Part607

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_14_11

def regionsGroup037 : List (Path × Nat × AssignmentTree) :=
  regionsPart592 ++ (regionsPart593 ++ (regionsPart594 ++ (regionsPart595 ++ (regionsPart596 ++ (regionsPart597 ++ (regionsPart598 ++ (regionsPart599 ++ (regionsPart600 ++ (regionsPart601 ++ (regionsPart602 ++ (regionsPart603 ++ (regionsPart604 ++ (regionsPart605 ++ (regionsPart606 ++ (regionsPart607)))))))))))))))

theorem regionsGroup037_valid : ∀ region ∈ regionsGroup037,
    region.1.length + region.2.1 = 25 ∧
      region.2.2.check 14 11 classes region.2.1 region.1 = true := by
  intro region h
  simp only [regionsGroup037, List.mem_append] at h
  rcases h with h | h | h | h | h | h | h | h | h | h | h | h | h | h | h | h
  · exact regionsPart592_valid region h
  · exact regionsPart593_valid region h
  · exact regionsPart594_valid region h
  · exact regionsPart595_valid region h
  · exact regionsPart596_valid region h
  · exact regionsPart597_valid region h
  · exact regionsPart598_valid region h
  · exact regionsPart599_valid region h
  · exact regionsPart600_valid region h
  · exact regionsPart601_valid region h
  · exact regionsPart602_valid region h
  · exact regionsPart603_valid region h
  · exact regionsPart604_valid region h
  · exact regionsPart605_valid region h
  · exact regionsPart606_valid region h
  · exact regionsPart607_valid region h

end LatticePathOrders.GeneratedMinimality_14_11
