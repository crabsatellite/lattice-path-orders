import LatticePathOrders.GeneratedMinimality_15_8_Part080
import LatticePathOrders.GeneratedMinimality_15_8_Part081
import LatticePathOrders.GeneratedMinimality_15_8_Part082
import LatticePathOrders.GeneratedMinimality_15_8_Part083
import LatticePathOrders.GeneratedMinimality_15_8_Part084
import LatticePathOrders.GeneratedMinimality_15_8_Part085
import LatticePathOrders.GeneratedMinimality_15_8_Part086
import LatticePathOrders.GeneratedMinimality_15_8_Part087
import LatticePathOrders.GeneratedMinimality_15_8_Part088
import LatticePathOrders.GeneratedMinimality_15_8_Part089
import LatticePathOrders.GeneratedMinimality_15_8_Part090
import LatticePathOrders.GeneratedMinimality_15_8_Part091
import LatticePathOrders.GeneratedMinimality_15_8_Part092
import LatticePathOrders.GeneratedMinimality_15_8_Part093
import LatticePathOrders.GeneratedMinimality_15_8_Part094
import LatticePathOrders.GeneratedMinimality_15_8_Part095

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_15_8

def regionsGroup005 : List (Path × Nat × AssignmentTree) :=
  regionsPart080 ++ (regionsPart081 ++ (regionsPart082 ++ (regionsPart083 ++ (regionsPart084 ++ (regionsPart085 ++ (regionsPart086 ++ (regionsPart087 ++ (regionsPart088 ++ (regionsPart089 ++ (regionsPart090 ++ (regionsPart091 ++ (regionsPart092 ++ (regionsPart093 ++ (regionsPart094 ++ (regionsPart095)))))))))))))))

theorem regionsGroup005_valid : ∀ region ∈ regionsGroup005,
    region.1.length + region.2.1 = 23 ∧
      region.2.2.check 15 8 classes region.2.1 region.1 = true := by
  intro region h
  simp only [regionsGroup005, List.mem_append] at h
  rcases h with h | h | h | h | h | h | h | h | h | h | h | h | h | h | h | h
  · exact regionsPart080_valid region h
  · exact regionsPart081_valid region h
  · exact regionsPart082_valid region h
  · exact regionsPart083_valid region h
  · exact regionsPart084_valid region h
  · exact regionsPart085_valid region h
  · exact regionsPart086_valid region h
  · exact regionsPart087_valid region h
  · exact regionsPart088_valid region h
  · exact regionsPart089_valid region h
  · exact regionsPart090_valid region h
  · exact regionsPart091_valid region h
  · exact regionsPart092_valid region h
  · exact regionsPart093_valid region h
  · exact regionsPart094_valid region h
  · exact regionsPart095_valid region h

end LatticePathOrders.GeneratedMinimality_15_8
