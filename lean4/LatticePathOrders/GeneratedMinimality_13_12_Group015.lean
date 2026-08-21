import LatticePathOrders.GeneratedMinimality_13_12_Part240
import LatticePathOrders.GeneratedMinimality_13_12_Part241
import LatticePathOrders.GeneratedMinimality_13_12_Part242
import LatticePathOrders.GeneratedMinimality_13_12_Part243
import LatticePathOrders.GeneratedMinimality_13_12_Part244
import LatticePathOrders.GeneratedMinimality_13_12_Part245
import LatticePathOrders.GeneratedMinimality_13_12_Part246
import LatticePathOrders.GeneratedMinimality_13_12_Part247
import LatticePathOrders.GeneratedMinimality_13_12_Part248
import LatticePathOrders.GeneratedMinimality_13_12_Part249
import LatticePathOrders.GeneratedMinimality_13_12_Part250
import LatticePathOrders.GeneratedMinimality_13_12_Part251
import LatticePathOrders.GeneratedMinimality_13_12_Part252
import LatticePathOrders.GeneratedMinimality_13_12_Part253
import LatticePathOrders.GeneratedMinimality_13_12_Part254
import LatticePathOrders.GeneratedMinimality_13_12_Part255

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_13_12

def regionsGroup015 : List (Path × Nat × AssignmentTree) :=
  regionsPart240 ++ (regionsPart241 ++ (regionsPart242 ++ (regionsPart243 ++ (regionsPart244 ++ (regionsPart245 ++ (regionsPart246 ++ (regionsPart247 ++ (regionsPart248 ++ (regionsPart249 ++ (regionsPart250 ++ (regionsPart251 ++ (regionsPart252 ++ (regionsPart253 ++ (regionsPart254 ++ (regionsPart255)))))))))))))))

theorem regionsGroup015_valid : ∀ region ∈ regionsGroup015,
    region.1.length + region.2.1 = 25 ∧
      region.2.2.check 13 12 classes region.2.1 region.1 = true := by
  intro region h
  simp only [regionsGroup015, List.mem_append] at h
  rcases h with h | h | h | h | h | h | h | h | h | h | h | h | h | h | h | h
  · exact regionsPart240_valid region h
  · exact regionsPart241_valid region h
  · exact regionsPart242_valid region h
  · exact regionsPart243_valid region h
  · exact regionsPart244_valid region h
  · exact regionsPart245_valid region h
  · exact regionsPart246_valid region h
  · exact regionsPart247_valid region h
  · exact regionsPart248_valid region h
  · exact regionsPart249_valid region h
  · exact regionsPart250_valid region h
  · exact regionsPart251_valid region h
  · exact regionsPart252_valid region h
  · exact regionsPart253_valid region h
  · exact regionsPart254_valid region h
  · exact regionsPart255_valid region h

end LatticePathOrders.GeneratedMinimality_13_12
