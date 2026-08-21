import LatticePathOrders.GeneratedMinimality_13_12_Part400
import LatticePathOrders.GeneratedMinimality_13_12_Part401
import LatticePathOrders.GeneratedMinimality_13_12_Part402
import LatticePathOrders.GeneratedMinimality_13_12_Part403
import LatticePathOrders.GeneratedMinimality_13_12_Part404
import LatticePathOrders.GeneratedMinimality_13_12_Part405
import LatticePathOrders.GeneratedMinimality_13_12_Part406
import LatticePathOrders.GeneratedMinimality_13_12_Part407
import LatticePathOrders.GeneratedMinimality_13_12_Part408
import LatticePathOrders.GeneratedMinimality_13_12_Part409
import LatticePathOrders.GeneratedMinimality_13_12_Part410
import LatticePathOrders.GeneratedMinimality_13_12_Part411
import LatticePathOrders.GeneratedMinimality_13_12_Part412
import LatticePathOrders.GeneratedMinimality_13_12_Part413
import LatticePathOrders.GeneratedMinimality_13_12_Part414
import LatticePathOrders.GeneratedMinimality_13_12_Part415

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_13_12

def regionsGroup025 : List (Path × Nat × AssignmentTree) :=
  regionsPart400 ++ (regionsPart401 ++ (regionsPart402 ++ (regionsPart403 ++ (regionsPart404 ++ (regionsPart405 ++ (regionsPart406 ++ (regionsPart407 ++ (regionsPart408 ++ (regionsPart409 ++ (regionsPart410 ++ (regionsPart411 ++ (regionsPart412 ++ (regionsPart413 ++ (regionsPart414 ++ (regionsPart415)))))))))))))))

theorem regionsGroup025_valid : ∀ region ∈ regionsGroup025,
    region.1.length + region.2.1 = 25 ∧
      region.2.2.check 13 12 classes region.2.1 region.1 = true := by
  intro region h
  simp only [regionsGroup025, List.mem_append] at h
  rcases h with h | h | h | h | h | h | h | h | h | h | h | h | h | h | h | h
  · exact regionsPart400_valid region h
  · exact regionsPart401_valid region h
  · exact regionsPart402_valid region h
  · exact regionsPart403_valid region h
  · exact regionsPart404_valid region h
  · exact regionsPart405_valid region h
  · exact regionsPart406_valid region h
  · exact regionsPart407_valid region h
  · exact regionsPart408_valid region h
  · exact regionsPart409_valid region h
  · exact regionsPart410_valid region h
  · exact regionsPart411_valid region h
  · exact regionsPart412_valid region h
  · exact regionsPart413_valid region h
  · exact regionsPart414_valid region h
  · exact regionsPart415_valid region h

end LatticePathOrders.GeneratedMinimality_13_12
