import LatticePathOrders.GeneratedMinimality_16_7_Part048
import LatticePathOrders.GeneratedMinimality_16_7_Part049
import LatticePathOrders.GeneratedMinimality_16_7_Part050
import LatticePathOrders.GeneratedMinimality_16_7_Part051
import LatticePathOrders.GeneratedMinimality_16_7_Part052
import LatticePathOrders.GeneratedMinimality_16_7_Part053
import LatticePathOrders.GeneratedMinimality_16_7_Part054
import LatticePathOrders.GeneratedMinimality_16_7_Part055
import LatticePathOrders.GeneratedMinimality_16_7_Part056
import LatticePathOrders.GeneratedMinimality_16_7_Part057
import LatticePathOrders.GeneratedMinimality_16_7_Part058
import LatticePathOrders.GeneratedMinimality_16_7_Part059
import LatticePathOrders.GeneratedMinimality_16_7_Part060
import LatticePathOrders.GeneratedMinimality_16_7_Part061

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_16_7

def regionsGroup003 : List (Path × Nat × AssignmentTree) :=
  regionsPart048 ++ (regionsPart049 ++ (regionsPart050 ++ (regionsPart051 ++ (regionsPart052 ++ (regionsPart053 ++ (regionsPart054 ++ (regionsPart055 ++ (regionsPart056 ++ (regionsPart057 ++ (regionsPart058 ++ (regionsPart059 ++ (regionsPart060 ++ (regionsPart061)))))))))))))

theorem regionsGroup003_valid : ∀ region ∈ regionsGroup003,
    region.1.length + region.2.1 = 23 ∧
      region.2.2.check 16 7 classes region.2.1 region.1 = true := by
  intro region h
  simp only [regionsGroup003, List.mem_append] at h
  rcases h with h | h | h | h | h | h | h | h | h | h | h | h | h | h
  · exact regionsPart048_valid region h
  · exact regionsPart049_valid region h
  · exact regionsPart050_valid region h
  · exact regionsPart051_valid region h
  · exact regionsPart052_valid region h
  · exact regionsPart053_valid region h
  · exact regionsPart054_valid region h
  · exact regionsPart055_valid region h
  · exact regionsPart056_valid region h
  · exact regionsPart057_valid region h
  · exact regionsPart058_valid region h
  · exact regionsPart059_valid region h
  · exact regionsPart060_valid region h
  · exact regionsPart061_valid region h

end LatticePathOrders.GeneratedMinimality_16_7
