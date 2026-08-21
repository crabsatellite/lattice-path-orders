import LatticePathOrders.GeneratedMinimality_13_12_Part256
import LatticePathOrders.GeneratedMinimality_13_12_Part257
import LatticePathOrders.GeneratedMinimality_13_12_Part258
import LatticePathOrders.GeneratedMinimality_13_12_Part259
import LatticePathOrders.GeneratedMinimality_13_12_Part260
import LatticePathOrders.GeneratedMinimality_13_12_Part261
import LatticePathOrders.GeneratedMinimality_13_12_Part262
import LatticePathOrders.GeneratedMinimality_13_12_Part263
import LatticePathOrders.GeneratedMinimality_13_12_Part264
import LatticePathOrders.GeneratedMinimality_13_12_Part265
import LatticePathOrders.GeneratedMinimality_13_12_Part266
import LatticePathOrders.GeneratedMinimality_13_12_Part267
import LatticePathOrders.GeneratedMinimality_13_12_Part268
import LatticePathOrders.GeneratedMinimality_13_12_Part269
import LatticePathOrders.GeneratedMinimality_13_12_Part270
import LatticePathOrders.GeneratedMinimality_13_12_Part271

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_13_12

def regionsGroup016 : List (Path × Nat × AssignmentTree) :=
  regionsPart256 ++ (regionsPart257 ++ (regionsPart258 ++ (regionsPart259 ++ (regionsPart260 ++ (regionsPart261 ++ (regionsPart262 ++ (regionsPart263 ++ (regionsPart264 ++ (regionsPart265 ++ (regionsPart266 ++ (regionsPart267 ++ (regionsPart268 ++ (regionsPart269 ++ (regionsPart270 ++ (regionsPart271)))))))))))))))

theorem regionsGroup016_valid : ∀ region ∈ regionsGroup016,
    region.1.length + region.2.1 = 25 ∧
      region.2.2.check 13 12 classes region.2.1 region.1 = true := by
  intro region h
  simp only [regionsGroup016, List.mem_append] at h
  rcases h with h | h | h | h | h | h | h | h | h | h | h | h | h | h | h | h
  · exact regionsPart256_valid region h
  · exact regionsPart257_valid region h
  · exact regionsPart258_valid region h
  · exact regionsPart259_valid region h
  · exact regionsPart260_valid region h
  · exact regionsPart261_valid region h
  · exact regionsPart262_valid region h
  · exact regionsPart263_valid region h
  · exact regionsPart264_valid region h
  · exact regionsPart265_valid region h
  · exact regionsPart266_valid region h
  · exact regionsPart267_valid region h
  · exact regionsPart268_valid region h
  · exact regionsPart269_valid region h
  · exact regionsPart270_valid region h
  · exact regionsPart271_valid region h

end LatticePathOrders.GeneratedMinimality_13_12
