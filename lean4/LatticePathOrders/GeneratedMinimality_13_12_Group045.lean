import LatticePathOrders.GeneratedMinimality_13_12_Part720
import LatticePathOrders.GeneratedMinimality_13_12_Part721
import LatticePathOrders.GeneratedMinimality_13_12_Part722
import LatticePathOrders.GeneratedMinimality_13_12_Part723
import LatticePathOrders.GeneratedMinimality_13_12_Part724
import LatticePathOrders.GeneratedMinimality_13_12_Part725
import LatticePathOrders.GeneratedMinimality_13_12_Part726
import LatticePathOrders.GeneratedMinimality_13_12_Part727
import LatticePathOrders.GeneratedMinimality_13_12_Part728
import LatticePathOrders.GeneratedMinimality_13_12_Part729
import LatticePathOrders.GeneratedMinimality_13_12_Part730
import LatticePathOrders.GeneratedMinimality_13_12_Part731
import LatticePathOrders.GeneratedMinimality_13_12_Part732
import LatticePathOrders.GeneratedMinimality_13_12_Part733
import LatticePathOrders.GeneratedMinimality_13_12_Part734
import LatticePathOrders.GeneratedMinimality_13_12_Part735

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_13_12

def regionsGroup045 : List (Path × Nat × AssignmentTree) :=
  regionsPart720 ++ (regionsPart721 ++ (regionsPart722 ++ (regionsPart723 ++ (regionsPart724 ++ (regionsPart725 ++ (regionsPart726 ++ (regionsPart727 ++ (regionsPart728 ++ (regionsPart729 ++ (regionsPart730 ++ (regionsPart731 ++ (regionsPart732 ++ (regionsPart733 ++ (regionsPart734 ++ (regionsPart735)))))))))))))))

theorem regionsGroup045_valid : ∀ region ∈ regionsGroup045,
    region.1.length + region.2.1 = 25 ∧
      region.2.2.check 13 12 classes region.2.1 region.1 = true := by
  intro region h
  simp only [regionsGroup045, List.mem_append] at h
  rcases h with h | h | h | h | h | h | h | h | h | h | h | h | h | h | h | h
  · exact regionsPart720_valid region h
  · exact regionsPart721_valid region h
  · exact regionsPart722_valid region h
  · exact regionsPart723_valid region h
  · exact regionsPart724_valid region h
  · exact regionsPart725_valid region h
  · exact regionsPart726_valid region h
  · exact regionsPart727_valid region h
  · exact regionsPart728_valid region h
  · exact regionsPart729_valid region h
  · exact regionsPart730_valid region h
  · exact regionsPart731_valid region h
  · exact regionsPart732_valid region h
  · exact regionsPart733_valid region h
  · exact regionsPart734_valid region h
  · exact regionsPart735_valid region h

end LatticePathOrders.GeneratedMinimality_13_12
