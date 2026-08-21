import LatticePathOrders.GeneratedMinimality_13_12_Part368
import LatticePathOrders.GeneratedMinimality_13_12_Part369
import LatticePathOrders.GeneratedMinimality_13_12_Part370
import LatticePathOrders.GeneratedMinimality_13_12_Part371
import LatticePathOrders.GeneratedMinimality_13_12_Part372
import LatticePathOrders.GeneratedMinimality_13_12_Part373
import LatticePathOrders.GeneratedMinimality_13_12_Part374
import LatticePathOrders.GeneratedMinimality_13_12_Part375
import LatticePathOrders.GeneratedMinimality_13_12_Part376
import LatticePathOrders.GeneratedMinimality_13_12_Part377
import LatticePathOrders.GeneratedMinimality_13_12_Part378
import LatticePathOrders.GeneratedMinimality_13_12_Part379
import LatticePathOrders.GeneratedMinimality_13_12_Part380
import LatticePathOrders.GeneratedMinimality_13_12_Part381
import LatticePathOrders.GeneratedMinimality_13_12_Part382
import LatticePathOrders.GeneratedMinimality_13_12_Part383

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_13_12

def regionsGroup023 : List (Path × Nat × AssignmentTree) :=
  regionsPart368 ++ (regionsPart369 ++ (regionsPart370 ++ (regionsPart371 ++ (regionsPart372 ++ (regionsPart373 ++ (regionsPart374 ++ (regionsPart375 ++ (regionsPart376 ++ (regionsPart377 ++ (regionsPart378 ++ (regionsPart379 ++ (regionsPart380 ++ (regionsPart381 ++ (regionsPart382 ++ (regionsPart383)))))))))))))))

theorem regionsGroup023_valid : ∀ region ∈ regionsGroup023,
    region.1.length + region.2.1 = 25 ∧
      region.2.2.check 13 12 classes region.2.1 region.1 = true := by
  intro region h
  simp only [regionsGroup023, List.mem_append] at h
  rcases h with h | h | h | h | h | h | h | h | h | h | h | h | h | h | h | h
  · exact regionsPart368_valid region h
  · exact regionsPart369_valid region h
  · exact regionsPart370_valid region h
  · exact regionsPart371_valid region h
  · exact regionsPart372_valid region h
  · exact regionsPart373_valid region h
  · exact regionsPart374_valid region h
  · exact regionsPart375_valid region h
  · exact regionsPart376_valid region h
  · exact regionsPart377_valid region h
  · exact regionsPart378_valid region h
  · exact regionsPart379_valid region h
  · exact regionsPart380_valid region h
  · exact regionsPart381_valid region h
  · exact regionsPart382_valid region h
  · exact regionsPart383_valid region h

end LatticePathOrders.GeneratedMinimality_13_12
