import LatticePathOrders.GeneratedMinimality_17_8_Part208
import LatticePathOrders.GeneratedMinimality_17_8_Part209
import LatticePathOrders.GeneratedMinimality_17_8_Part210
import LatticePathOrders.GeneratedMinimality_17_8_Part211
import LatticePathOrders.GeneratedMinimality_17_8_Part212
import LatticePathOrders.GeneratedMinimality_17_8_Part213
import LatticePathOrders.GeneratedMinimality_17_8_Part214
import LatticePathOrders.GeneratedMinimality_17_8_Part215
import LatticePathOrders.GeneratedMinimality_17_8_Part216
import LatticePathOrders.GeneratedMinimality_17_8_Part217
import LatticePathOrders.GeneratedMinimality_17_8_Part218
import LatticePathOrders.GeneratedMinimality_17_8_Part219
import LatticePathOrders.GeneratedMinimality_17_8_Part220
import LatticePathOrders.GeneratedMinimality_17_8_Part221
import LatticePathOrders.GeneratedMinimality_17_8_Part222
import LatticePathOrders.GeneratedMinimality_17_8_Part223

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_17_8

def regionsGroup013 : List (Path × Nat × AssignmentTree) :=
  regionsPart208 ++ (regionsPart209 ++ (regionsPart210 ++ (regionsPart211 ++ (regionsPart212 ++ (regionsPart213 ++ (regionsPart214 ++ (regionsPart215 ++ (regionsPart216 ++ (regionsPart217 ++ (regionsPart218 ++ (regionsPart219 ++ (regionsPart220 ++ (regionsPart221 ++ (regionsPart222 ++ (regionsPart223)))))))))))))))

theorem regionsGroup013_valid : ∀ region ∈ regionsGroup013,
    region.1.length + region.2.1 = 25 ∧
      region.2.2.check 17 8 classes region.2.1 region.1 = true := by
  intro region h
  simp only [regionsGroup013, List.mem_append] at h
  rcases h with h | h | h | h | h | h | h | h | h | h | h | h | h | h | h | h
  · exact regionsPart208_valid region h
  · exact regionsPart209_valid region h
  · exact regionsPart210_valid region h
  · exact regionsPart211_valid region h
  · exact regionsPart212_valid region h
  · exact regionsPart213_valid region h
  · exact regionsPart214_valid region h
  · exact regionsPart215_valid region h
  · exact regionsPart216_valid region h
  · exact regionsPart217_valid region h
  · exact regionsPart218_valid region h
  · exact regionsPart219_valid region h
  · exact regionsPart220_valid region h
  · exact regionsPart221_valid region h
  · exact regionsPart222_valid region h
  · exact regionsPart223_valid region h

end LatticePathOrders.GeneratedMinimality_17_8
