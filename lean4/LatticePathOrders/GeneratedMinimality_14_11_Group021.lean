import LatticePathOrders.GeneratedMinimality_14_11_Part336
import LatticePathOrders.GeneratedMinimality_14_11_Part337
import LatticePathOrders.GeneratedMinimality_14_11_Part338
import LatticePathOrders.GeneratedMinimality_14_11_Part339
import LatticePathOrders.GeneratedMinimality_14_11_Part340
import LatticePathOrders.GeneratedMinimality_14_11_Part341
import LatticePathOrders.GeneratedMinimality_14_11_Part342
import LatticePathOrders.GeneratedMinimality_14_11_Part343
import LatticePathOrders.GeneratedMinimality_14_11_Part344
import LatticePathOrders.GeneratedMinimality_14_11_Part345
import LatticePathOrders.GeneratedMinimality_14_11_Part346
import LatticePathOrders.GeneratedMinimality_14_11_Part347
import LatticePathOrders.GeneratedMinimality_14_11_Part348
import LatticePathOrders.GeneratedMinimality_14_11_Part349
import LatticePathOrders.GeneratedMinimality_14_11_Part350
import LatticePathOrders.GeneratedMinimality_14_11_Part351

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_14_11

def regionsGroup021 : List (Path × Nat × AssignmentTree) :=
  regionsPart336 ++ (regionsPart337 ++ (regionsPart338 ++ (regionsPart339 ++ (regionsPart340 ++ (regionsPart341 ++ (regionsPart342 ++ (regionsPart343 ++ (regionsPart344 ++ (regionsPart345 ++ (regionsPart346 ++ (regionsPart347 ++ (regionsPart348 ++ (regionsPart349 ++ (regionsPart350 ++ (regionsPart351)))))))))))))))

theorem regionsGroup021_valid : ∀ region ∈ regionsGroup021,
    region.1.length + region.2.1 = 25 ∧
      region.2.2.check 14 11 classes region.2.1 region.1 = true := by
  intro region h
  simp only [regionsGroup021, List.mem_append] at h
  rcases h with h | h | h | h | h | h | h | h | h | h | h | h | h | h | h | h
  · exact regionsPart336_valid region h
  · exact regionsPart337_valid region h
  · exact regionsPart338_valid region h
  · exact regionsPart339_valid region h
  · exact regionsPart340_valid region h
  · exact regionsPart341_valid region h
  · exact regionsPart342_valid region h
  · exact regionsPart343_valid region h
  · exact regionsPart344_valid region h
  · exact regionsPart345_valid region h
  · exact regionsPart346_valid region h
  · exact regionsPart347_valid region h
  · exact regionsPart348_valid region h
  · exact regionsPart349_valid region h
  · exact regionsPart350_valid region h
  · exact regionsPart351_valid region h

end LatticePathOrders.GeneratedMinimality_14_11
