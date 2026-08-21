import LatticePathOrders.GeneratedMinimality_11_10_Part096
import LatticePathOrders.GeneratedMinimality_11_10_Part097
import LatticePathOrders.GeneratedMinimality_11_10_Part098
import LatticePathOrders.GeneratedMinimality_11_10_Part099
import LatticePathOrders.GeneratedMinimality_11_10_Part100
import LatticePathOrders.GeneratedMinimality_11_10_Part101

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_11_10

def regionsGroup006 : List (Path × Nat × AssignmentTree) :=
  regionsPart096 ++ (regionsPart097 ++ (regionsPart098 ++ (regionsPart099 ++ (regionsPart100 ++ (regionsPart101)))))

theorem regionsGroup006_valid : ∀ region ∈ regionsGroup006,
    region.1.length + region.2.1 = 21 ∧
      region.2.2.check 11 10 classes region.2.1 region.1 = true := by
  intro region h
  simp only [regionsGroup006, List.mem_append] at h
  rcases h with h | h | h | h | h | h
  · exact regionsPart096_valid region h
  · exact regionsPart097_valid region h
  · exact regionsPart098_valid region h
  · exact regionsPart099_valid region h
  · exact regionsPart100_valid region h
  · exact regionsPart101_valid region h

end LatticePathOrders.GeneratedMinimality_11_10
