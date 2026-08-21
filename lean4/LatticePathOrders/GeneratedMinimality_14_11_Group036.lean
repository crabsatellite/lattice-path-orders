import LatticePathOrders.GeneratedMinimality_14_11_Part576
import LatticePathOrders.GeneratedMinimality_14_11_Part577
import LatticePathOrders.GeneratedMinimality_14_11_Part578
import LatticePathOrders.GeneratedMinimality_14_11_Part579
import LatticePathOrders.GeneratedMinimality_14_11_Part580
import LatticePathOrders.GeneratedMinimality_14_11_Part581
import LatticePathOrders.GeneratedMinimality_14_11_Part582
import LatticePathOrders.GeneratedMinimality_14_11_Part583
import LatticePathOrders.GeneratedMinimality_14_11_Part584
import LatticePathOrders.GeneratedMinimality_14_11_Part585
import LatticePathOrders.GeneratedMinimality_14_11_Part586
import LatticePathOrders.GeneratedMinimality_14_11_Part587
import LatticePathOrders.GeneratedMinimality_14_11_Part588
import LatticePathOrders.GeneratedMinimality_14_11_Part589
import LatticePathOrders.GeneratedMinimality_14_11_Part590
import LatticePathOrders.GeneratedMinimality_14_11_Part591

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_14_11

def regionsGroup036 : List (Path × Nat × AssignmentTree) :=
  regionsPart576 ++ (regionsPart577 ++ (regionsPart578 ++ (regionsPart579 ++ (regionsPart580 ++ (regionsPart581 ++ (regionsPart582 ++ (regionsPart583 ++ (regionsPart584 ++ (regionsPart585 ++ (regionsPart586 ++ (regionsPart587 ++ (regionsPart588 ++ (regionsPart589 ++ (regionsPart590 ++ (regionsPart591)))))))))))))))

theorem regionsGroup036_valid : ∀ region ∈ regionsGroup036,
    region.1.length + region.2.1 = 25 ∧
      region.2.2.check 14 11 classes region.2.1 region.1 = true := by
  intro region h
  simp only [regionsGroup036, List.mem_append] at h
  rcases h with h | h | h | h | h | h | h | h | h | h | h | h | h | h | h | h
  · exact regionsPart576_valid region h
  · exact regionsPart577_valid region h
  · exact regionsPart578_valid region h
  · exact regionsPart579_valid region h
  · exact regionsPart580_valid region h
  · exact regionsPart581_valid region h
  · exact regionsPart582_valid region h
  · exact regionsPart583_valid region h
  · exact regionsPart584_valid region h
  · exact regionsPart585_valid region h
  · exact regionsPart586_valid region h
  · exact regionsPart587_valid region h
  · exact regionsPart588_valid region h
  · exact regionsPart589_valid region h
  · exact regionsPart590_valid region h
  · exact regionsPart591_valid region h

end LatticePathOrders.GeneratedMinimality_14_11
