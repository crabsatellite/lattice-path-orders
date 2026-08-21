import LatticePathOrders.GeneratedMinimality_16_9_Part384
import LatticePathOrders.GeneratedMinimality_16_9_Part385
import LatticePathOrders.GeneratedMinimality_16_9_Part386
import LatticePathOrders.GeneratedMinimality_16_9_Part387
import LatticePathOrders.GeneratedMinimality_16_9_Part388
import LatticePathOrders.GeneratedMinimality_16_9_Part389
import LatticePathOrders.GeneratedMinimality_16_9_Part390
import LatticePathOrders.GeneratedMinimality_16_9_Part391
import LatticePathOrders.GeneratedMinimality_16_9_Part392
import LatticePathOrders.GeneratedMinimality_16_9_Part393
import LatticePathOrders.GeneratedMinimality_16_9_Part394
import LatticePathOrders.GeneratedMinimality_16_9_Part395
import LatticePathOrders.GeneratedMinimality_16_9_Part396
import LatticePathOrders.GeneratedMinimality_16_9_Part397
import LatticePathOrders.GeneratedMinimality_16_9_Part398
import LatticePathOrders.GeneratedMinimality_16_9_Part399

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_16_9

def regionsGroup024 : List (Path × Nat × AssignmentTree) :=
  regionsPart384 ++ (regionsPart385 ++ (regionsPart386 ++ (regionsPart387 ++ (regionsPart388 ++ (regionsPart389 ++ (regionsPart390 ++ (regionsPart391 ++ (regionsPart392 ++ (regionsPart393 ++ (regionsPart394 ++ (regionsPart395 ++ (regionsPart396 ++ (regionsPart397 ++ (regionsPart398 ++ (regionsPart399)))))))))))))))

theorem regionsGroup024_valid : ∀ region ∈ regionsGroup024,
    region.1.length + region.2.1 = 25 ∧
      region.2.2.check 16 9 classes region.2.1 region.1 = true := by
  intro region h
  simp only [regionsGroup024, List.mem_append] at h
  rcases h with h | h | h | h | h | h | h | h | h | h | h | h | h | h | h | h
  · exact regionsPart384_valid region h
  · exact regionsPart385_valid region h
  · exact regionsPart386_valid region h
  · exact regionsPart387_valid region h
  · exact regionsPart388_valid region h
  · exact regionsPart389_valid region h
  · exact regionsPart390_valid region h
  · exact regionsPart391_valid region h
  · exact regionsPart392_valid region h
  · exact regionsPart393_valid region h
  · exact regionsPart394_valid region h
  · exact regionsPart395_valid region h
  · exact regionsPart396_valid region h
  · exact regionsPart397_valid region h
  · exact regionsPart398_valid region h
  · exact regionsPart399_valid region h

end LatticePathOrders.GeneratedMinimality_16_9
