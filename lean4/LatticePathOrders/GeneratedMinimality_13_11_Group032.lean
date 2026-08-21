import LatticePathOrders.GeneratedMinimality_13_11_Part512
import LatticePathOrders.GeneratedMinimality_13_11_Part513
import LatticePathOrders.GeneratedMinimality_13_11_Part514
import LatticePathOrders.GeneratedMinimality_13_11_Part515
import LatticePathOrders.GeneratedMinimality_13_11_Part516
import LatticePathOrders.GeneratedMinimality_13_11_Part517
import LatticePathOrders.GeneratedMinimality_13_11_Part518
import LatticePathOrders.GeneratedMinimality_13_11_Part519
import LatticePathOrders.GeneratedMinimality_13_11_Part520
import LatticePathOrders.GeneratedMinimality_13_11_Part521
import LatticePathOrders.GeneratedMinimality_13_11_Part522
import LatticePathOrders.GeneratedMinimality_13_11_Part523
import LatticePathOrders.GeneratedMinimality_13_11_Part524
import LatticePathOrders.GeneratedMinimality_13_11_Part525
import LatticePathOrders.GeneratedMinimality_13_11_Part526
import LatticePathOrders.GeneratedMinimality_13_11_Part527

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_13_11

def regionsGroup032 : List (Path × Nat × AssignmentTree) :=
  regionsPart512 ++ (regionsPart513 ++ (regionsPart514 ++ (regionsPart515 ++ (regionsPart516 ++ (regionsPart517 ++ (regionsPart518 ++ (regionsPart519 ++ (regionsPart520 ++ (regionsPart521 ++ (regionsPart522 ++ (regionsPart523 ++ (regionsPart524 ++ (regionsPart525 ++ (regionsPart526 ++ (regionsPart527)))))))))))))))

theorem regionsGroup032_valid : ∀ region ∈ regionsGroup032,
    region.1.length + region.2.1 = 24 ∧
      region.2.2.check 13 11 classes region.2.1 region.1 = true := by
  intro region h
  simp only [regionsGroup032, List.mem_append] at h
  rcases h with h | h | h | h | h | h | h | h | h | h | h | h | h | h | h | h
  · exact regionsPart512_valid region h
  · exact regionsPart513_valid region h
  · exact regionsPart514_valid region h
  · exact regionsPart515_valid region h
  · exact regionsPart516_valid region h
  · exact regionsPart517_valid region h
  · exact regionsPart518_valid region h
  · exact regionsPart519_valid region h
  · exact regionsPart520_valid region h
  · exact regionsPart521_valid region h
  · exact regionsPart522_valid region h
  · exact regionsPart523_valid region h
  · exact regionsPart524_valid region h
  · exact regionsPart525_valid region h
  · exact regionsPart526_valid region h
  · exact regionsPart527_valid region h

end LatticePathOrders.GeneratedMinimality_13_11
