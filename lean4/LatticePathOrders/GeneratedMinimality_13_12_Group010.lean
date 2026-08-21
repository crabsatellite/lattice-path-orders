import LatticePathOrders.GeneratedMinimality_13_12_Part160
import LatticePathOrders.GeneratedMinimality_13_12_Part161
import LatticePathOrders.GeneratedMinimality_13_12_Part162
import LatticePathOrders.GeneratedMinimality_13_12_Part163
import LatticePathOrders.GeneratedMinimality_13_12_Part164
import LatticePathOrders.GeneratedMinimality_13_12_Part165
import LatticePathOrders.GeneratedMinimality_13_12_Part166
import LatticePathOrders.GeneratedMinimality_13_12_Part167
import LatticePathOrders.GeneratedMinimality_13_12_Part168
import LatticePathOrders.GeneratedMinimality_13_12_Part169
import LatticePathOrders.GeneratedMinimality_13_12_Part170
import LatticePathOrders.GeneratedMinimality_13_12_Part171
import LatticePathOrders.GeneratedMinimality_13_12_Part172
import LatticePathOrders.GeneratedMinimality_13_12_Part173
import LatticePathOrders.GeneratedMinimality_13_12_Part174
import LatticePathOrders.GeneratedMinimality_13_12_Part175

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_13_12

def regionsGroup010 : List (Path × Nat × AssignmentTree) :=
  regionsPart160 ++ (regionsPart161 ++ (regionsPart162 ++ (regionsPart163 ++ (regionsPart164 ++ (regionsPart165 ++ (regionsPart166 ++ (regionsPart167 ++ (regionsPart168 ++ (regionsPart169 ++ (regionsPart170 ++ (regionsPart171 ++ (regionsPart172 ++ (regionsPart173 ++ (regionsPart174 ++ (regionsPart175)))))))))))))))

theorem regionsGroup010_valid : ∀ region ∈ regionsGroup010,
    region.1.length + region.2.1 = 25 ∧
      region.2.2.check 13 12 classes region.2.1 region.1 = true := by
  intro region h
  simp only [regionsGroup010, List.mem_append] at h
  rcases h with h | h | h | h | h | h | h | h | h | h | h | h | h | h | h | h
  · exact regionsPart160_valid region h
  · exact regionsPart161_valid region h
  · exact regionsPart162_valid region h
  · exact regionsPart163_valid region h
  · exact regionsPart164_valid region h
  · exact regionsPart165_valid region h
  · exact regionsPart166_valid region h
  · exact regionsPart167_valid region h
  · exact regionsPart168_valid region h
  · exact regionsPart169_valid region h
  · exact regionsPart170_valid region h
  · exact regionsPart171_valid region h
  · exact regionsPart172_valid region h
  · exact regionsPart173_valid region h
  · exact regionsPart174_valid region h
  · exact regionsPart175_valid region h

end LatticePathOrders.GeneratedMinimality_13_12
