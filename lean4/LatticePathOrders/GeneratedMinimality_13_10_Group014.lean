import LatticePathOrders.GeneratedMinimality_13_10_Part224
import LatticePathOrders.GeneratedMinimality_13_10_Part225
import LatticePathOrders.GeneratedMinimality_13_10_Part226
import LatticePathOrders.GeneratedMinimality_13_10_Part227
import LatticePathOrders.GeneratedMinimality_13_10_Part228
import LatticePathOrders.GeneratedMinimality_13_10_Part229
import LatticePathOrders.GeneratedMinimality_13_10_Part230
import LatticePathOrders.GeneratedMinimality_13_10_Part231
import LatticePathOrders.GeneratedMinimality_13_10_Part232
import LatticePathOrders.GeneratedMinimality_13_10_Part233
import LatticePathOrders.GeneratedMinimality_13_10_Part234
import LatticePathOrders.GeneratedMinimality_13_10_Part235
import LatticePathOrders.GeneratedMinimality_13_10_Part236
import LatticePathOrders.GeneratedMinimality_13_10_Part237
import LatticePathOrders.GeneratedMinimality_13_10_Part238
import LatticePathOrders.GeneratedMinimality_13_10_Part239

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_13_10

def regionsGroup014 : List (Path × Nat × AssignmentTree) :=
  regionsPart224 ++ (regionsPart225 ++ (regionsPart226 ++ (regionsPart227 ++ (regionsPart228 ++ (regionsPart229 ++ (regionsPart230 ++ (regionsPart231 ++ (regionsPart232 ++ (regionsPart233 ++ (regionsPart234 ++ (regionsPart235 ++ (regionsPart236 ++ (regionsPart237 ++ (regionsPart238 ++ (regionsPart239)))))))))))))))

theorem regionsGroup014_valid : ∀ region ∈ regionsGroup014,
    region.1.length + region.2.1 = 23 ∧
      region.2.2.check 13 10 classes region.2.1 region.1 = true := by
  intro region h
  simp only [regionsGroup014, List.mem_append] at h
  rcases h with h | h | h | h | h | h | h | h | h | h | h | h | h | h | h | h
  · exact regionsPart224_valid region h
  · exact regionsPart225_valid region h
  · exact regionsPart226_valid region h
  · exact regionsPart227_valid region h
  · exact regionsPart228_valid region h
  · exact regionsPart229_valid region h
  · exact regionsPart230_valid region h
  · exact regionsPart231_valid region h
  · exact regionsPart232_valid region h
  · exact regionsPart233_valid region h
  · exact regionsPart234_valid region h
  · exact regionsPart235_valid region h
  · exact regionsPart236_valid region h
  · exact regionsPart237_valid region h
  · exact regionsPart238_valid region h
  · exact regionsPart239_valid region h

end LatticePathOrders.GeneratedMinimality_13_10
