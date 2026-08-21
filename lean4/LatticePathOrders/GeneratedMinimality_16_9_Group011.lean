import LatticePathOrders.GeneratedMinimality_16_9_Part176
import LatticePathOrders.GeneratedMinimality_16_9_Part177
import LatticePathOrders.GeneratedMinimality_16_9_Part178
import LatticePathOrders.GeneratedMinimality_16_9_Part179
import LatticePathOrders.GeneratedMinimality_16_9_Part180
import LatticePathOrders.GeneratedMinimality_16_9_Part181
import LatticePathOrders.GeneratedMinimality_16_9_Part182
import LatticePathOrders.GeneratedMinimality_16_9_Part183
import LatticePathOrders.GeneratedMinimality_16_9_Part184
import LatticePathOrders.GeneratedMinimality_16_9_Part185
import LatticePathOrders.GeneratedMinimality_16_9_Part186
import LatticePathOrders.GeneratedMinimality_16_9_Part187
import LatticePathOrders.GeneratedMinimality_16_9_Part188
import LatticePathOrders.GeneratedMinimality_16_9_Part189
import LatticePathOrders.GeneratedMinimality_16_9_Part190
import LatticePathOrders.GeneratedMinimality_16_9_Part191

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_16_9

def regionsGroup011 : List (Path × Nat × AssignmentTree) :=
  regionsPart176 ++ (regionsPart177 ++ (regionsPart178 ++ (regionsPart179 ++ (regionsPart180 ++ (regionsPart181 ++ (regionsPart182 ++ (regionsPart183 ++ (regionsPart184 ++ (regionsPart185 ++ (regionsPart186 ++ (regionsPart187 ++ (regionsPart188 ++ (regionsPart189 ++ (regionsPart190 ++ (regionsPart191)))))))))))))))

theorem regionsGroup011_valid : ∀ region ∈ regionsGroup011,
    region.1.length + region.2.1 = 25 ∧
      region.2.2.check 16 9 classes region.2.1 region.1 = true := by
  intro region h
  simp only [regionsGroup011, List.mem_append] at h
  rcases h with h | h | h | h | h | h | h | h | h | h | h | h | h | h | h | h
  · exact regionsPart176_valid region h
  · exact regionsPart177_valid region h
  · exact regionsPart178_valid region h
  · exact regionsPart179_valid region h
  · exact regionsPart180_valid region h
  · exact regionsPart181_valid region h
  · exact regionsPart182_valid region h
  · exact regionsPart183_valid region h
  · exact regionsPart184_valid region h
  · exact regionsPart185_valid region h
  · exact regionsPart186_valid region h
  · exact regionsPart187_valid region h
  · exact regionsPart188_valid region h
  · exact regionsPart189_valid region h
  · exact regionsPart190_valid region h
  · exact regionsPart191_valid region h

end LatticePathOrders.GeneratedMinimality_16_9
