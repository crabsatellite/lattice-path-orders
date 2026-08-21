import LatticePathOrders.GeneratedMinimality_16_9_Part128
import LatticePathOrders.GeneratedMinimality_16_9_Part129
import LatticePathOrders.GeneratedMinimality_16_9_Part130
import LatticePathOrders.GeneratedMinimality_16_9_Part131
import LatticePathOrders.GeneratedMinimality_16_9_Part132
import LatticePathOrders.GeneratedMinimality_16_9_Part133
import LatticePathOrders.GeneratedMinimality_16_9_Part134
import LatticePathOrders.GeneratedMinimality_16_9_Part135
import LatticePathOrders.GeneratedMinimality_16_9_Part136
import LatticePathOrders.GeneratedMinimality_16_9_Part137
import LatticePathOrders.GeneratedMinimality_16_9_Part138
import LatticePathOrders.GeneratedMinimality_16_9_Part139
import LatticePathOrders.GeneratedMinimality_16_9_Part140
import LatticePathOrders.GeneratedMinimality_16_9_Part141
import LatticePathOrders.GeneratedMinimality_16_9_Part142
import LatticePathOrders.GeneratedMinimality_16_9_Part143

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_16_9

def regionsGroup008 : List (Path × Nat × AssignmentTree) :=
  regionsPart128 ++ (regionsPart129 ++ (regionsPart130 ++ (regionsPart131 ++ (regionsPart132 ++ (regionsPart133 ++ (regionsPart134 ++ (regionsPart135 ++ (regionsPart136 ++ (regionsPart137 ++ (regionsPart138 ++ (regionsPart139 ++ (regionsPart140 ++ (regionsPart141 ++ (regionsPart142 ++ (regionsPart143)))))))))))))))

theorem regionsGroup008_valid : ∀ region ∈ regionsGroup008,
    region.1.length + region.2.1 = 25 ∧
      region.2.2.check 16 9 classes region.2.1 region.1 = true := by
  intro region h
  simp only [regionsGroup008, List.mem_append] at h
  rcases h with h | h | h | h | h | h | h | h | h | h | h | h | h | h | h | h
  · exact regionsPart128_valid region h
  · exact regionsPart129_valid region h
  · exact regionsPart130_valid region h
  · exact regionsPart131_valid region h
  · exact regionsPart132_valid region h
  · exact regionsPart133_valid region h
  · exact regionsPart134_valid region h
  · exact regionsPart135_valid region h
  · exact regionsPart136_valid region h
  · exact regionsPart137_valid region h
  · exact regionsPart138_valid region h
  · exact regionsPart139_valid region h
  · exact regionsPart140_valid region h
  · exact regionsPart141_valid region h
  · exact regionsPart142_valid region h
  · exact regionsPart143_valid region h

end LatticePathOrders.GeneratedMinimality_16_9
