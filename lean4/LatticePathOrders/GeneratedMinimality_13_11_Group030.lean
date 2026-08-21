import LatticePathOrders.GeneratedMinimality_13_11_Part480
import LatticePathOrders.GeneratedMinimality_13_11_Part481
import LatticePathOrders.GeneratedMinimality_13_11_Part482
import LatticePathOrders.GeneratedMinimality_13_11_Part483
import LatticePathOrders.GeneratedMinimality_13_11_Part484
import LatticePathOrders.GeneratedMinimality_13_11_Part485
import LatticePathOrders.GeneratedMinimality_13_11_Part486
import LatticePathOrders.GeneratedMinimality_13_11_Part487
import LatticePathOrders.GeneratedMinimality_13_11_Part488
import LatticePathOrders.GeneratedMinimality_13_11_Part489
import LatticePathOrders.GeneratedMinimality_13_11_Part490
import LatticePathOrders.GeneratedMinimality_13_11_Part491
import LatticePathOrders.GeneratedMinimality_13_11_Part492
import LatticePathOrders.GeneratedMinimality_13_11_Part493
import LatticePathOrders.GeneratedMinimality_13_11_Part494
import LatticePathOrders.GeneratedMinimality_13_11_Part495

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_13_11

def regionsGroup030 : List (Path × Nat × AssignmentTree) :=
  regionsPart480 ++ (regionsPart481 ++ (regionsPart482 ++ (regionsPart483 ++ (regionsPart484 ++ (regionsPart485 ++ (regionsPart486 ++ (regionsPart487 ++ (regionsPart488 ++ (regionsPart489 ++ (regionsPart490 ++ (regionsPart491 ++ (regionsPart492 ++ (regionsPart493 ++ (regionsPart494 ++ (regionsPart495)))))))))))))))

theorem regionsGroup030_valid : ∀ region ∈ regionsGroup030,
    region.1.length + region.2.1 = 24 ∧
      region.2.2.check 13 11 classes region.2.1 region.1 = true := by
  intro region h
  simp only [regionsGroup030, List.mem_append] at h
  rcases h with h | h | h | h | h | h | h | h | h | h | h | h | h | h | h | h
  · exact regionsPart480_valid region h
  · exact regionsPart481_valid region h
  · exact regionsPart482_valid region h
  · exact regionsPart483_valid region h
  · exact regionsPart484_valid region h
  · exact regionsPart485_valid region h
  · exact regionsPart486_valid region h
  · exact regionsPart487_valid region h
  · exact regionsPart488_valid region h
  · exact regionsPart489_valid region h
  · exact regionsPart490_valid region h
  · exact regionsPart491_valid region h
  · exact regionsPart492_valid region h
  · exact regionsPart493_valid region h
  · exact regionsPart494_valid region h
  · exact regionsPart495_valid region h

end LatticePathOrders.GeneratedMinimality_13_11
