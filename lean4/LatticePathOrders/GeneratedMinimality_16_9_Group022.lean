import LatticePathOrders.GeneratedMinimality_16_9_Part352
import LatticePathOrders.GeneratedMinimality_16_9_Part353
import LatticePathOrders.GeneratedMinimality_16_9_Part354
import LatticePathOrders.GeneratedMinimality_16_9_Part355
import LatticePathOrders.GeneratedMinimality_16_9_Part356
import LatticePathOrders.GeneratedMinimality_16_9_Part357
import LatticePathOrders.GeneratedMinimality_16_9_Part358
import LatticePathOrders.GeneratedMinimality_16_9_Part359
import LatticePathOrders.GeneratedMinimality_16_9_Part360
import LatticePathOrders.GeneratedMinimality_16_9_Part361
import LatticePathOrders.GeneratedMinimality_16_9_Part362
import LatticePathOrders.GeneratedMinimality_16_9_Part363
import LatticePathOrders.GeneratedMinimality_16_9_Part364
import LatticePathOrders.GeneratedMinimality_16_9_Part365
import LatticePathOrders.GeneratedMinimality_16_9_Part366
import LatticePathOrders.GeneratedMinimality_16_9_Part367

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_16_9

def regionsGroup022 : List (Path × Nat × AssignmentTree) :=
  regionsPart352 ++ (regionsPart353 ++ (regionsPart354 ++ (regionsPart355 ++ (regionsPart356 ++ (regionsPart357 ++ (regionsPart358 ++ (regionsPart359 ++ (regionsPart360 ++ (regionsPart361 ++ (regionsPart362 ++ (regionsPart363 ++ (regionsPart364 ++ (regionsPart365 ++ (regionsPart366 ++ (regionsPart367)))))))))))))))

theorem regionsGroup022_valid : ∀ region ∈ regionsGroup022,
    region.1.length + region.2.1 = 25 ∧
      region.2.2.check 16 9 classes region.2.1 region.1 = true := by
  intro region h
  simp only [regionsGroup022, List.mem_append] at h
  rcases h with h | h | h | h | h | h | h | h | h | h | h | h | h | h | h | h
  · exact regionsPart352_valid region h
  · exact regionsPart353_valid region h
  · exact regionsPart354_valid region h
  · exact regionsPart355_valid region h
  · exact regionsPart356_valid region h
  · exact regionsPart357_valid region h
  · exact regionsPart358_valid region h
  · exact regionsPart359_valid region h
  · exact regionsPart360_valid region h
  · exact regionsPart361_valid region h
  · exact regionsPart362_valid region h
  · exact regionsPart363_valid region h
  · exact regionsPart364_valid region h
  · exact regionsPart365_valid region h
  · exact regionsPart366_valid region h
  · exact regionsPart367_valid region h

end LatticePathOrders.GeneratedMinimality_16_9
