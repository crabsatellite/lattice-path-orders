import LatticePathOrders.GeneratedMinimality_13_12_Part272
import LatticePathOrders.GeneratedMinimality_13_12_Part273
import LatticePathOrders.GeneratedMinimality_13_12_Part274
import LatticePathOrders.GeneratedMinimality_13_12_Part275
import LatticePathOrders.GeneratedMinimality_13_12_Part276
import LatticePathOrders.GeneratedMinimality_13_12_Part277
import LatticePathOrders.GeneratedMinimality_13_12_Part278
import LatticePathOrders.GeneratedMinimality_13_12_Part279
import LatticePathOrders.GeneratedMinimality_13_12_Part280
import LatticePathOrders.GeneratedMinimality_13_12_Part281
import LatticePathOrders.GeneratedMinimality_13_12_Part282
import LatticePathOrders.GeneratedMinimality_13_12_Part283
import LatticePathOrders.GeneratedMinimality_13_12_Part284
import LatticePathOrders.GeneratedMinimality_13_12_Part285
import LatticePathOrders.GeneratedMinimality_13_12_Part286
import LatticePathOrders.GeneratedMinimality_13_12_Part287

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_13_12

def regionsGroup017 : List (Path × Nat × AssignmentTree) :=
  regionsPart272 ++ (regionsPart273 ++ (regionsPart274 ++ (regionsPart275 ++ (regionsPart276 ++ (regionsPart277 ++ (regionsPart278 ++ (regionsPart279 ++ (regionsPart280 ++ (regionsPart281 ++ (regionsPart282 ++ (regionsPart283 ++ (regionsPart284 ++ (regionsPart285 ++ (regionsPart286 ++ (regionsPart287)))))))))))))))

theorem regionsGroup017_valid : ∀ region ∈ regionsGroup017,
    region.1.length + region.2.1 = 25 ∧
      region.2.2.check 13 12 classes region.2.1 region.1 = true := by
  intro region h
  simp only [regionsGroup017, List.mem_append] at h
  rcases h with h | h | h | h | h | h | h | h | h | h | h | h | h | h | h | h
  · exact regionsPart272_valid region h
  · exact regionsPart273_valid region h
  · exact regionsPart274_valid region h
  · exact regionsPart275_valid region h
  · exact regionsPart276_valid region h
  · exact regionsPart277_valid region h
  · exact regionsPart278_valid region h
  · exact regionsPart279_valid region h
  · exact regionsPart280_valid region h
  · exact regionsPart281_valid region h
  · exact regionsPart282_valid region h
  · exact regionsPart283_valid region h
  · exact regionsPart284_valid region h
  · exact regionsPart285_valid region h
  · exact regionsPart286_valid region h
  · exact regionsPart287_valid region h

end LatticePathOrders.GeneratedMinimality_13_12
