import LatticePathOrders.GeneratedMinimality_13_11_Part192
import LatticePathOrders.GeneratedMinimality_13_11_Part193
import LatticePathOrders.GeneratedMinimality_13_11_Part194
import LatticePathOrders.GeneratedMinimality_13_11_Part195
import LatticePathOrders.GeneratedMinimality_13_11_Part196
import LatticePathOrders.GeneratedMinimality_13_11_Part197
import LatticePathOrders.GeneratedMinimality_13_11_Part198
import LatticePathOrders.GeneratedMinimality_13_11_Part199
import LatticePathOrders.GeneratedMinimality_13_11_Part200
import LatticePathOrders.GeneratedMinimality_13_11_Part201
import LatticePathOrders.GeneratedMinimality_13_11_Part202
import LatticePathOrders.GeneratedMinimality_13_11_Part203
import LatticePathOrders.GeneratedMinimality_13_11_Part204
import LatticePathOrders.GeneratedMinimality_13_11_Part205
import LatticePathOrders.GeneratedMinimality_13_11_Part206
import LatticePathOrders.GeneratedMinimality_13_11_Part207

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_13_11

def regionsGroup012 : List (Path × Nat × AssignmentTree) :=
  regionsPart192 ++ (regionsPart193 ++ (regionsPart194 ++ (regionsPart195 ++ (regionsPart196 ++ (regionsPart197 ++ (regionsPart198 ++ (regionsPart199 ++ (regionsPart200 ++ (regionsPart201 ++ (regionsPart202 ++ (regionsPart203 ++ (regionsPart204 ++ (regionsPart205 ++ (regionsPart206 ++ (regionsPart207)))))))))))))))

theorem regionsGroup012_valid : ∀ region ∈ regionsGroup012,
    region.1.length + region.2.1 = 24 ∧
      region.2.2.check 13 11 classes region.2.1 region.1 = true := by
  intro region h
  simp only [regionsGroup012, List.mem_append] at h
  rcases h with h | h | h | h | h | h | h | h | h | h | h | h | h | h | h | h
  · exact regionsPart192_valid region h
  · exact regionsPart193_valid region h
  · exact regionsPart194_valid region h
  · exact regionsPart195_valid region h
  · exact regionsPart196_valid region h
  · exact regionsPart197_valid region h
  · exact regionsPart198_valid region h
  · exact regionsPart199_valid region h
  · exact regionsPart200_valid region h
  · exact regionsPart201_valid region h
  · exact regionsPart202_valid region h
  · exact regionsPart203_valid region h
  · exact regionsPart204_valid region h
  · exact regionsPart205_valid region h
  · exact regionsPart206_valid region h
  · exact regionsPart207_valid region h

end LatticePathOrders.GeneratedMinimality_13_11
