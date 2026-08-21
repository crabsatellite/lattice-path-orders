import LatticePathOrders.GeneratedMinimality_19_6_Part048
import LatticePathOrders.GeneratedMinimality_19_6_Part049
import LatticePathOrders.GeneratedMinimality_19_6_Part050
import LatticePathOrders.GeneratedMinimality_19_6_Part051
import LatticePathOrders.GeneratedMinimality_19_6_Part052
import LatticePathOrders.GeneratedMinimality_19_6_Part053
import LatticePathOrders.GeneratedMinimality_19_6_Part054
import LatticePathOrders.GeneratedMinimality_19_6_Part055
import LatticePathOrders.GeneratedMinimality_19_6_Part056

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_19_6

def regionsGroup003 : List (Path × Nat × AssignmentTree) :=
  regionsPart048 ++ (regionsPart049 ++ (regionsPart050 ++ (regionsPart051 ++ (regionsPart052 ++ (regionsPart053 ++ (regionsPart054 ++ (regionsPart055 ++ (regionsPart056))))))))

theorem regionsGroup003_valid : ∀ region ∈ regionsGroup003,
    region.1.length + region.2.1 = 25 ∧
      region.2.2.check 19 6 classes region.2.1 region.1 = true := by
  intro region h
  simp only [regionsGroup003, List.mem_append] at h
  rcases h with h | h | h | h | h | h | h | h | h
  · exact regionsPart048_valid region h
  · exact regionsPart049_valid region h
  · exact regionsPart050_valid region h
  · exact regionsPart051_valid region h
  · exact regionsPart052_valid region h
  · exact regionsPart053_valid region h
  · exact regionsPart054_valid region h
  · exact regionsPart055_valid region h
  · exact regionsPart056_valid region h

end LatticePathOrders.GeneratedMinimality_19_6
