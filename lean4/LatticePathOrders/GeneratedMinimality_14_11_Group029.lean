import LatticePathOrders.GeneratedMinimality_14_11_Part464
import LatticePathOrders.GeneratedMinimality_14_11_Part465
import LatticePathOrders.GeneratedMinimality_14_11_Part466
import LatticePathOrders.GeneratedMinimality_14_11_Part467
import LatticePathOrders.GeneratedMinimality_14_11_Part468
import LatticePathOrders.GeneratedMinimality_14_11_Part469
import LatticePathOrders.GeneratedMinimality_14_11_Part470
import LatticePathOrders.GeneratedMinimality_14_11_Part471
import LatticePathOrders.GeneratedMinimality_14_11_Part472
import LatticePathOrders.GeneratedMinimality_14_11_Part473
import LatticePathOrders.GeneratedMinimality_14_11_Part474
import LatticePathOrders.GeneratedMinimality_14_11_Part475
import LatticePathOrders.GeneratedMinimality_14_11_Part476
import LatticePathOrders.GeneratedMinimality_14_11_Part477
import LatticePathOrders.GeneratedMinimality_14_11_Part478
import LatticePathOrders.GeneratedMinimality_14_11_Part479

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_14_11

def regionsGroup029 : List (Path × Nat × AssignmentTree) :=
  regionsPart464 ++ (regionsPart465 ++ (regionsPart466 ++ (regionsPart467 ++ (regionsPart468 ++ (regionsPart469 ++ (regionsPart470 ++ (regionsPart471 ++ (regionsPart472 ++ (regionsPart473 ++ (regionsPart474 ++ (regionsPart475 ++ (regionsPart476 ++ (regionsPart477 ++ (regionsPart478 ++ (regionsPart479)))))))))))))))

theorem regionsGroup029_valid : ∀ region ∈ regionsGroup029,
    region.1.length + region.2.1 = 25 ∧
      region.2.2.check 14 11 classes region.2.1 region.1 = true := by
  intro region h
  simp only [regionsGroup029, List.mem_append] at h
  rcases h with h | h | h | h | h | h | h | h | h | h | h | h | h | h | h | h
  · exact regionsPart464_valid region h
  · exact regionsPart465_valid region h
  · exact regionsPart466_valid region h
  · exact regionsPart467_valid region h
  · exact regionsPart468_valid region h
  · exact regionsPart469_valid region h
  · exact regionsPart470_valid region h
  · exact regionsPart471_valid region h
  · exact regionsPart472_valid region h
  · exact regionsPart473_valid region h
  · exact regionsPart474_valid region h
  · exact regionsPart475_valid region h
  · exact regionsPart476_valid region h
  · exact regionsPart477_valid region h
  · exact regionsPart478_valid region h
  · exact regionsPart479_valid region h

end LatticePathOrders.GeneratedMinimality_14_11
