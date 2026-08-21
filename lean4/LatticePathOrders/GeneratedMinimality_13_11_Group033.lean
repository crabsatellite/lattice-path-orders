import LatticePathOrders.GeneratedMinimality_13_11_Part528
import LatticePathOrders.GeneratedMinimality_13_11_Part529
import LatticePathOrders.GeneratedMinimality_13_11_Part530
import LatticePathOrders.GeneratedMinimality_13_11_Part531
import LatticePathOrders.GeneratedMinimality_13_11_Part532
import LatticePathOrders.GeneratedMinimality_13_11_Part533
import LatticePathOrders.GeneratedMinimality_13_11_Part534
import LatticePathOrders.GeneratedMinimality_13_11_Part535
import LatticePathOrders.GeneratedMinimality_13_11_Part536
import LatticePathOrders.GeneratedMinimality_13_11_Part537
import LatticePathOrders.GeneratedMinimality_13_11_Part538
import LatticePathOrders.GeneratedMinimality_13_11_Part539
import LatticePathOrders.GeneratedMinimality_13_11_Part540
import LatticePathOrders.GeneratedMinimality_13_11_Part541
import LatticePathOrders.GeneratedMinimality_13_11_Part542
import LatticePathOrders.GeneratedMinimality_13_11_Part543

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_13_11

def regionsGroup033 : List (Path × Nat × AssignmentTree) :=
  regionsPart528 ++ (regionsPart529 ++ (regionsPart530 ++ (regionsPart531 ++ (regionsPart532 ++ (regionsPart533 ++ (regionsPart534 ++ (regionsPart535 ++ (regionsPart536 ++ (regionsPart537 ++ (regionsPart538 ++ (regionsPart539 ++ (regionsPart540 ++ (regionsPart541 ++ (regionsPart542 ++ (regionsPart543)))))))))))))))

theorem regionsGroup033_valid : ∀ region ∈ regionsGroup033,
    region.1.length + region.2.1 = 24 ∧
      region.2.2.check 13 11 classes region.2.1 region.1 = true := by
  intro region h
  simp only [regionsGroup033, List.mem_append] at h
  rcases h with h | h | h | h | h | h | h | h | h | h | h | h | h | h | h | h
  · exact regionsPart528_valid region h
  · exact regionsPart529_valid region h
  · exact regionsPart530_valid region h
  · exact regionsPart531_valid region h
  · exact regionsPart532_valid region h
  · exact regionsPart533_valid region h
  · exact regionsPart534_valid region h
  · exact regionsPart535_valid region h
  · exact regionsPart536_valid region h
  · exact regionsPart537_valid region h
  · exact regionsPart538_valid region h
  · exact regionsPart539_valid region h
  · exact regionsPart540_valid region h
  · exact regionsPart541_valid region h
  · exact regionsPart542_valid region h
  · exact regionsPart543_valid region h

end LatticePathOrders.GeneratedMinimality_13_11
