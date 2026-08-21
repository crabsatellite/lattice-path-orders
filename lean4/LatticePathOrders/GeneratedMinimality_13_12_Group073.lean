import LatticePathOrders.GeneratedMinimality_13_12_Part1168
import LatticePathOrders.GeneratedMinimality_13_12_Part1169
import LatticePathOrders.GeneratedMinimality_13_12_Part1170
import LatticePathOrders.GeneratedMinimality_13_12_Part1171
import LatticePathOrders.GeneratedMinimality_13_12_Part1172
import LatticePathOrders.GeneratedMinimality_13_12_Part1173
import LatticePathOrders.GeneratedMinimality_13_12_Part1174
import LatticePathOrders.GeneratedMinimality_13_12_Part1175
import LatticePathOrders.GeneratedMinimality_13_12_Part1176
import LatticePathOrders.GeneratedMinimality_13_12_Part1177
import LatticePathOrders.GeneratedMinimality_13_12_Part1178
import LatticePathOrders.GeneratedMinimality_13_12_Part1179
import LatticePathOrders.GeneratedMinimality_13_12_Part1180
import LatticePathOrders.GeneratedMinimality_13_12_Part1181
import LatticePathOrders.GeneratedMinimality_13_12_Part1182
import LatticePathOrders.GeneratedMinimality_13_12_Part1183

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_13_12

def regionsGroup073 : List (Path × Nat × AssignmentTree) :=
  regionsPart1168 ++ (regionsPart1169 ++ (regionsPart1170 ++ (regionsPart1171 ++ (regionsPart1172 ++ (regionsPart1173 ++ (regionsPart1174 ++ (regionsPart1175 ++ (regionsPart1176 ++ (regionsPart1177 ++ (regionsPart1178 ++ (regionsPart1179 ++ (regionsPart1180 ++ (regionsPart1181 ++ (regionsPart1182 ++ (regionsPart1183)))))))))))))))

theorem regionsGroup073_valid : ∀ region ∈ regionsGroup073,
    region.1.length + region.2.1 = 25 ∧
      region.2.2.check 13 12 classes region.2.1 region.1 = true := by
  intro region h
  simp only [regionsGroup073, List.mem_append] at h
  rcases h with h | h | h | h | h | h | h | h | h | h | h | h | h | h | h | h
  · exact regionsPart1168_valid region h
  · exact regionsPart1169_valid region h
  · exact regionsPart1170_valid region h
  · exact regionsPart1171_valid region h
  · exact regionsPart1172_valid region h
  · exact regionsPart1173_valid region h
  · exact regionsPart1174_valid region h
  · exact regionsPart1175_valid region h
  · exact regionsPart1176_valid region h
  · exact regionsPart1177_valid region h
  · exact regionsPart1178_valid region h
  · exact regionsPart1179_valid region h
  · exact regionsPart1180_valid region h
  · exact regionsPart1181_valid region h
  · exact regionsPart1182_valid region h
  · exact regionsPart1183_valid region h

end LatticePathOrders.GeneratedMinimality_13_12
