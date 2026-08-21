import LatticePathOrders.GeneratedMinimality_17_8_Part144
import LatticePathOrders.GeneratedMinimality_17_8_Part145
import LatticePathOrders.GeneratedMinimality_17_8_Part146
import LatticePathOrders.GeneratedMinimality_17_8_Part147
import LatticePathOrders.GeneratedMinimality_17_8_Part148
import LatticePathOrders.GeneratedMinimality_17_8_Part149
import LatticePathOrders.GeneratedMinimality_17_8_Part150
import LatticePathOrders.GeneratedMinimality_17_8_Part151
import LatticePathOrders.GeneratedMinimality_17_8_Part152
import LatticePathOrders.GeneratedMinimality_17_8_Part153
import LatticePathOrders.GeneratedMinimality_17_8_Part154
import LatticePathOrders.GeneratedMinimality_17_8_Part155
import LatticePathOrders.GeneratedMinimality_17_8_Part156
import LatticePathOrders.GeneratedMinimality_17_8_Part157
import LatticePathOrders.GeneratedMinimality_17_8_Part158
import LatticePathOrders.GeneratedMinimality_17_8_Part159

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_17_8

def regionsGroup009 : List (Path × Nat × AssignmentTree) :=
  regionsPart144 ++ (regionsPart145 ++ (regionsPart146 ++ (regionsPart147 ++ (regionsPart148 ++ (regionsPart149 ++ (regionsPart150 ++ (regionsPart151 ++ (regionsPart152 ++ (regionsPart153 ++ (regionsPart154 ++ (regionsPart155 ++ (regionsPart156 ++ (regionsPart157 ++ (regionsPart158 ++ (regionsPart159)))))))))))))))

theorem regionsGroup009_valid : ∀ region ∈ regionsGroup009,
    region.1.length + region.2.1 = 25 ∧
      region.2.2.check 17 8 classes region.2.1 region.1 = true := by
  intro region h
  simp only [regionsGroup009, List.mem_append] at h
  rcases h with h | h | h | h | h | h | h | h | h | h | h | h | h | h | h | h
  · exact regionsPart144_valid region h
  · exact regionsPart145_valid region h
  · exact regionsPart146_valid region h
  · exact regionsPart147_valid region h
  · exact regionsPart148_valid region h
  · exact regionsPart149_valid region h
  · exact regionsPart150_valid region h
  · exact regionsPart151_valid region h
  · exact regionsPart152_valid region h
  · exact regionsPart153_valid region h
  · exact regionsPart154_valid region h
  · exact regionsPart155_valid region h
  · exact regionsPart156_valid region h
  · exact regionsPart157_valid region h
  · exact regionsPart158_valid region h
  · exact regionsPart159_valid region h

end LatticePathOrders.GeneratedMinimality_17_8
