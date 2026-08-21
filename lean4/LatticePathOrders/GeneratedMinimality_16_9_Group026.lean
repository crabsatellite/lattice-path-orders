import LatticePathOrders.GeneratedMinimality_16_9_Part416
import LatticePathOrders.GeneratedMinimality_16_9_Part417
import LatticePathOrders.GeneratedMinimality_16_9_Part418
import LatticePathOrders.GeneratedMinimality_16_9_Part419
import LatticePathOrders.GeneratedMinimality_16_9_Part420
import LatticePathOrders.GeneratedMinimality_16_9_Part421
import LatticePathOrders.GeneratedMinimality_16_9_Part422
import LatticePathOrders.GeneratedMinimality_16_9_Part423
import LatticePathOrders.GeneratedMinimality_16_9_Part424
import LatticePathOrders.GeneratedMinimality_16_9_Part425
import LatticePathOrders.GeneratedMinimality_16_9_Part426
import LatticePathOrders.GeneratedMinimality_16_9_Part427
import LatticePathOrders.GeneratedMinimality_16_9_Part428
import LatticePathOrders.GeneratedMinimality_16_9_Part429
import LatticePathOrders.GeneratedMinimality_16_9_Part430
import LatticePathOrders.GeneratedMinimality_16_9_Part431

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_16_9

def regionsGroup026 : List (Path × Nat × AssignmentTree) :=
  regionsPart416 ++ (regionsPart417 ++ (regionsPart418 ++ (regionsPart419 ++ (regionsPart420 ++ (regionsPart421 ++ (regionsPart422 ++ (regionsPart423 ++ (regionsPart424 ++ (regionsPart425 ++ (regionsPart426 ++ (regionsPart427 ++ (regionsPart428 ++ (regionsPart429 ++ (regionsPart430 ++ (regionsPart431)))))))))))))))

theorem regionsGroup026_valid : ∀ region ∈ regionsGroup026,
    region.1.length + region.2.1 = 25 ∧
      region.2.2.check 16 9 classes region.2.1 region.1 = true := by
  intro region h
  simp only [regionsGroup026, List.mem_append] at h
  rcases h with h | h | h | h | h | h | h | h | h | h | h | h | h | h | h | h
  · exact regionsPart416_valid region h
  · exact regionsPart417_valid region h
  · exact regionsPart418_valid region h
  · exact regionsPart419_valid region h
  · exact regionsPart420_valid region h
  · exact regionsPart421_valid region h
  · exact regionsPart422_valid region h
  · exact regionsPart423_valid region h
  · exact regionsPart424_valid region h
  · exact regionsPart425_valid region h
  · exact regionsPart426_valid region h
  · exact regionsPart427_valid region h
  · exact regionsPart428_valid region h
  · exact regionsPart429_valid region h
  · exact regionsPart430_valid region h
  · exact regionsPart431_valid region h

end LatticePathOrders.GeneratedMinimality_16_9
