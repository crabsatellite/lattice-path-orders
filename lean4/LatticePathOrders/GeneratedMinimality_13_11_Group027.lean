import LatticePathOrders.GeneratedMinimality_13_11_Part432
import LatticePathOrders.GeneratedMinimality_13_11_Part433
import LatticePathOrders.GeneratedMinimality_13_11_Part434
import LatticePathOrders.GeneratedMinimality_13_11_Part435
import LatticePathOrders.GeneratedMinimality_13_11_Part436
import LatticePathOrders.GeneratedMinimality_13_11_Part437
import LatticePathOrders.GeneratedMinimality_13_11_Part438
import LatticePathOrders.GeneratedMinimality_13_11_Part439
import LatticePathOrders.GeneratedMinimality_13_11_Part440
import LatticePathOrders.GeneratedMinimality_13_11_Part441
import LatticePathOrders.GeneratedMinimality_13_11_Part442
import LatticePathOrders.GeneratedMinimality_13_11_Part443
import LatticePathOrders.GeneratedMinimality_13_11_Part444
import LatticePathOrders.GeneratedMinimality_13_11_Part445
import LatticePathOrders.GeneratedMinimality_13_11_Part446
import LatticePathOrders.GeneratedMinimality_13_11_Part447

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_13_11

def regionsGroup027 : List (Path × Nat × AssignmentTree) :=
  regionsPart432 ++ (regionsPart433 ++ (regionsPart434 ++ (regionsPart435 ++ (regionsPart436 ++ (regionsPart437 ++ (regionsPart438 ++ (regionsPart439 ++ (regionsPart440 ++ (regionsPart441 ++ (regionsPart442 ++ (regionsPart443 ++ (regionsPart444 ++ (regionsPart445 ++ (regionsPart446 ++ (regionsPart447)))))))))))))))

theorem regionsGroup027_valid : ∀ region ∈ regionsGroup027,
    region.1.length + region.2.1 = 24 ∧
      region.2.2.check 13 11 classes region.2.1 region.1 = true := by
  intro region h
  simp only [regionsGroup027, List.mem_append] at h
  rcases h with h | h | h | h | h | h | h | h | h | h | h | h | h | h | h | h
  · exact regionsPart432_valid region h
  · exact regionsPart433_valid region h
  · exact regionsPart434_valid region h
  · exact regionsPart435_valid region h
  · exact regionsPart436_valid region h
  · exact regionsPart437_valid region h
  · exact regionsPart438_valid region h
  · exact regionsPart439_valid region h
  · exact regionsPart440_valid region h
  · exact regionsPart441_valid region h
  · exact regionsPart442_valid region h
  · exact regionsPart443_valid region h
  · exact regionsPart444_valid region h
  · exact regionsPart445_valid region h
  · exact regionsPart446_valid region h
  · exact regionsPart447_valid region h

end LatticePathOrders.GeneratedMinimality_13_11
