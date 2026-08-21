import LatticePathOrders.GeneratedMinimality_13_10_Part272
import LatticePathOrders.GeneratedMinimality_13_10_Part273
import LatticePathOrders.GeneratedMinimality_13_10_Part274
import LatticePathOrders.GeneratedMinimality_13_10_Part275
import LatticePathOrders.GeneratedMinimality_13_10_Part276
import LatticePathOrders.GeneratedMinimality_13_10_Part277

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_13_10

def regionsGroup017 : List (Path × Nat × AssignmentTree) :=
  regionsPart272 ++ (regionsPart273 ++ (regionsPart274 ++ (regionsPart275 ++ (regionsPart276 ++ (regionsPart277)))))

theorem regionsGroup017_valid : ∀ region ∈ regionsGroup017,
    region.1.length + region.2.1 = 23 ∧
      region.2.2.check 13 10 classes region.2.1 region.1 = true := by
  intro region h
  simp only [regionsGroup017, List.mem_append] at h
  rcases h with h | h | h | h | h | h
  · exact regionsPart272_valid region h
  · exact regionsPart273_valid region h
  · exact regionsPart274_valid region h
  · exact regionsPart275_valid region h
  · exact regionsPart276_valid region h
  · exact regionsPart277_valid region h

end LatticePathOrders.GeneratedMinimality_13_10
