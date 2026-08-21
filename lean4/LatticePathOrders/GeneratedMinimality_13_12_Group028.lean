import LatticePathOrders.GeneratedMinimality_13_12_Part448
import LatticePathOrders.GeneratedMinimality_13_12_Part449
import LatticePathOrders.GeneratedMinimality_13_12_Part450
import LatticePathOrders.GeneratedMinimality_13_12_Part451
import LatticePathOrders.GeneratedMinimality_13_12_Part452
import LatticePathOrders.GeneratedMinimality_13_12_Part453
import LatticePathOrders.GeneratedMinimality_13_12_Part454
import LatticePathOrders.GeneratedMinimality_13_12_Part455
import LatticePathOrders.GeneratedMinimality_13_12_Part456
import LatticePathOrders.GeneratedMinimality_13_12_Part457
import LatticePathOrders.GeneratedMinimality_13_12_Part458
import LatticePathOrders.GeneratedMinimality_13_12_Part459
import LatticePathOrders.GeneratedMinimality_13_12_Part460
import LatticePathOrders.GeneratedMinimality_13_12_Part461
import LatticePathOrders.GeneratedMinimality_13_12_Part462
import LatticePathOrders.GeneratedMinimality_13_12_Part463

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_13_12

def regionsGroup028 : List (Path × Nat × AssignmentTree) :=
  regionsPart448 ++ (regionsPart449 ++ (regionsPart450 ++ (regionsPart451 ++ (regionsPart452 ++ (regionsPart453 ++ (regionsPart454 ++ (regionsPart455 ++ (regionsPart456 ++ (regionsPart457 ++ (regionsPart458 ++ (regionsPart459 ++ (regionsPart460 ++ (regionsPart461 ++ (regionsPart462 ++ (regionsPart463)))))))))))))))

theorem regionsGroup028_valid : ∀ region ∈ regionsGroup028,
    region.1.length + region.2.1 = 25 ∧
      region.2.2.check 13 12 classes region.2.1 region.1 = true := by
  intro region h
  simp only [regionsGroup028, List.mem_append] at h
  rcases h with h | h | h | h | h | h | h | h | h | h | h | h | h | h | h | h
  · exact regionsPart448_valid region h
  · exact regionsPart449_valid region h
  · exact regionsPart450_valid region h
  · exact regionsPart451_valid region h
  · exact regionsPart452_valid region h
  · exact regionsPart453_valid region h
  · exact regionsPart454_valid region h
  · exact regionsPart455_valid region h
  · exact regionsPart456_valid region h
  · exact regionsPart457_valid region h
  · exact regionsPart458_valid region h
  · exact regionsPart459_valid region h
  · exact regionsPart460_valid region h
  · exact regionsPart461_valid region h
  · exact regionsPart462_valid region h
  · exact regionsPart463_valid region h

end LatticePathOrders.GeneratedMinimality_13_12
