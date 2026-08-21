import LatticePathOrders.GeneratedMinimality_13_12_Part544
import LatticePathOrders.GeneratedMinimality_13_12_Part545
import LatticePathOrders.GeneratedMinimality_13_12_Part546
import LatticePathOrders.GeneratedMinimality_13_12_Part547
import LatticePathOrders.GeneratedMinimality_13_12_Part548
import LatticePathOrders.GeneratedMinimality_13_12_Part549
import LatticePathOrders.GeneratedMinimality_13_12_Part550
import LatticePathOrders.GeneratedMinimality_13_12_Part551
import LatticePathOrders.GeneratedMinimality_13_12_Part552
import LatticePathOrders.GeneratedMinimality_13_12_Part553
import LatticePathOrders.GeneratedMinimality_13_12_Part554
import LatticePathOrders.GeneratedMinimality_13_12_Part555
import LatticePathOrders.GeneratedMinimality_13_12_Part556
import LatticePathOrders.GeneratedMinimality_13_12_Part557
import LatticePathOrders.GeneratedMinimality_13_12_Part558
import LatticePathOrders.GeneratedMinimality_13_12_Part559

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_13_12

def regionsGroup034 : List (Path × Nat × AssignmentTree) :=
  regionsPart544 ++ (regionsPart545 ++ (regionsPart546 ++ (regionsPart547 ++ (regionsPart548 ++ (regionsPart549 ++ (regionsPart550 ++ (regionsPart551 ++ (regionsPart552 ++ (regionsPart553 ++ (regionsPart554 ++ (regionsPart555 ++ (regionsPart556 ++ (regionsPart557 ++ (regionsPart558 ++ (regionsPart559)))))))))))))))

theorem regionsGroup034_valid : ∀ region ∈ regionsGroup034,
    region.1.length + region.2.1 = 25 ∧
      region.2.2.check 13 12 classes region.2.1 region.1 = true := by
  intro region h
  simp only [regionsGroup034, List.mem_append] at h
  rcases h with h | h | h | h | h | h | h | h | h | h | h | h | h | h | h | h
  · exact regionsPart544_valid region h
  · exact regionsPart545_valid region h
  · exact regionsPart546_valid region h
  · exact regionsPart547_valid region h
  · exact regionsPart548_valid region h
  · exact regionsPart549_valid region h
  · exact regionsPart550_valid region h
  · exact regionsPart551_valid region h
  · exact regionsPart552_valid region h
  · exact regionsPart553_valid region h
  · exact regionsPart554_valid region h
  · exact regionsPart555_valid region h
  · exact regionsPart556_valid region h
  · exact regionsPart557_valid region h
  · exact regionsPart558_valid region h
  · exact regionsPart559_valid region h

end LatticePathOrders.GeneratedMinimality_13_12
