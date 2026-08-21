import LatticePathOrders.GeneratedMinimality_14_11_Part496
import LatticePathOrders.GeneratedMinimality_14_11_Part497
import LatticePathOrders.GeneratedMinimality_14_11_Part498
import LatticePathOrders.GeneratedMinimality_14_11_Part499
import LatticePathOrders.GeneratedMinimality_14_11_Part500
import LatticePathOrders.GeneratedMinimality_14_11_Part501
import LatticePathOrders.GeneratedMinimality_14_11_Part502
import LatticePathOrders.GeneratedMinimality_14_11_Part503
import LatticePathOrders.GeneratedMinimality_14_11_Part504
import LatticePathOrders.GeneratedMinimality_14_11_Part505
import LatticePathOrders.GeneratedMinimality_14_11_Part506
import LatticePathOrders.GeneratedMinimality_14_11_Part507
import LatticePathOrders.GeneratedMinimality_14_11_Part508
import LatticePathOrders.GeneratedMinimality_14_11_Part509
import LatticePathOrders.GeneratedMinimality_14_11_Part510
import LatticePathOrders.GeneratedMinimality_14_11_Part511

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_14_11

def regionsGroup031 : List (Path × Nat × AssignmentTree) :=
  regionsPart496 ++ (regionsPart497 ++ (regionsPart498 ++ (regionsPart499 ++ (regionsPart500 ++ (regionsPart501 ++ (regionsPart502 ++ (regionsPart503 ++ (regionsPart504 ++ (regionsPart505 ++ (regionsPart506 ++ (regionsPart507 ++ (regionsPart508 ++ (regionsPart509 ++ (regionsPart510 ++ (regionsPart511)))))))))))))))

theorem regionsGroup031_valid : ∀ region ∈ regionsGroup031,
    region.1.length + region.2.1 = 25 ∧
      region.2.2.check 14 11 classes region.2.1 region.1 = true := by
  intro region h
  simp only [regionsGroup031, List.mem_append] at h
  rcases h with h | h | h | h | h | h | h | h | h | h | h | h | h | h | h | h
  · exact regionsPart496_valid region h
  · exact regionsPart497_valid region h
  · exact regionsPart498_valid region h
  · exact regionsPart499_valid region h
  · exact regionsPart500_valid region h
  · exact regionsPart501_valid region h
  · exact regionsPart502_valid region h
  · exact regionsPart503_valid region h
  · exact regionsPart504_valid region h
  · exact regionsPart505_valid region h
  · exact regionsPart506_valid region h
  · exact regionsPart507_valid region h
  · exact regionsPart508_valid region h
  · exact regionsPart509_valid region h
  · exact regionsPart510_valid region h
  · exact regionsPart511_valid region h

end LatticePathOrders.GeneratedMinimality_14_11
