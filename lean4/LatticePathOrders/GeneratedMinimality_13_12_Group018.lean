import LatticePathOrders.GeneratedMinimality_13_12_Part288
import LatticePathOrders.GeneratedMinimality_13_12_Part289
import LatticePathOrders.GeneratedMinimality_13_12_Part290
import LatticePathOrders.GeneratedMinimality_13_12_Part291
import LatticePathOrders.GeneratedMinimality_13_12_Part292
import LatticePathOrders.GeneratedMinimality_13_12_Part293
import LatticePathOrders.GeneratedMinimality_13_12_Part294
import LatticePathOrders.GeneratedMinimality_13_12_Part295
import LatticePathOrders.GeneratedMinimality_13_12_Part296
import LatticePathOrders.GeneratedMinimality_13_12_Part297
import LatticePathOrders.GeneratedMinimality_13_12_Part298
import LatticePathOrders.GeneratedMinimality_13_12_Part299
import LatticePathOrders.GeneratedMinimality_13_12_Part300
import LatticePathOrders.GeneratedMinimality_13_12_Part301
import LatticePathOrders.GeneratedMinimality_13_12_Part302
import LatticePathOrders.GeneratedMinimality_13_12_Part303

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_13_12

def regionsGroup018 : List (Path × Nat × AssignmentTree) :=
  regionsPart288 ++ (regionsPart289 ++ (regionsPart290 ++ (regionsPart291 ++ (regionsPart292 ++ (regionsPart293 ++ (regionsPart294 ++ (regionsPart295 ++ (regionsPart296 ++ (regionsPart297 ++ (regionsPart298 ++ (regionsPart299 ++ (regionsPart300 ++ (regionsPart301 ++ (regionsPart302 ++ (regionsPart303)))))))))))))))

theorem regionsGroup018_valid : ∀ region ∈ regionsGroup018,
    region.1.length + region.2.1 = 25 ∧
      region.2.2.check 13 12 classes region.2.1 region.1 = true := by
  intro region h
  simp only [regionsGroup018, List.mem_append] at h
  rcases h with h | h | h | h | h | h | h | h | h | h | h | h | h | h | h | h
  · exact regionsPart288_valid region h
  · exact regionsPart289_valid region h
  · exact regionsPart290_valid region h
  · exact regionsPart291_valid region h
  · exact regionsPart292_valid region h
  · exact regionsPart293_valid region h
  · exact regionsPart294_valid region h
  · exact regionsPart295_valid region h
  · exact regionsPart296_valid region h
  · exact regionsPart297_valid region h
  · exact regionsPart298_valid region h
  · exact regionsPart299_valid region h
  · exact regionsPart300_valid region h
  · exact regionsPart301_valid region h
  · exact regionsPart302_valid region h
  · exact regionsPart303_valid region h

end LatticePathOrders.GeneratedMinimality_13_12
