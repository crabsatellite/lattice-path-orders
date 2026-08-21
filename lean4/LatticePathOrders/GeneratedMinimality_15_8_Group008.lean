import LatticePathOrders.GeneratedMinimality_15_8_Part128
import LatticePathOrders.GeneratedMinimality_15_8_Part129
import LatticePathOrders.GeneratedMinimality_15_8_Part130
import LatticePathOrders.GeneratedMinimality_15_8_Part131
import LatticePathOrders.GeneratedMinimality_15_8_Part132

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_15_8

def regionsGroup008 : List (Path × Nat × AssignmentTree) :=
  regionsPart128 ++ (regionsPart129 ++ (regionsPart130 ++ (regionsPart131 ++ (regionsPart132))))

theorem regionsGroup008_valid : ∀ region ∈ regionsGroup008,
    region.1.length + region.2.1 = 23 ∧
      region.2.2.check 15 8 classes region.2.1 region.1 = true := by
  intro region h
  simp only [regionsGroup008, List.mem_append] at h
  rcases h with h | h | h | h | h
  · exact regionsPart128_valid region h
  · exact regionsPart129_valid region h
  · exact regionsPart130_valid region h
  · exact regionsPart131_valid region h
  · exact regionsPart132_valid region h

end LatticePathOrders.GeneratedMinimality_15_8
