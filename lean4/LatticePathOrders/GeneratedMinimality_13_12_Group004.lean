import LatticePathOrders.GeneratedMinimality_13_12_Part064
import LatticePathOrders.GeneratedMinimality_13_12_Part065
import LatticePathOrders.GeneratedMinimality_13_12_Part066
import LatticePathOrders.GeneratedMinimality_13_12_Part067
import LatticePathOrders.GeneratedMinimality_13_12_Part068
import LatticePathOrders.GeneratedMinimality_13_12_Part069
import LatticePathOrders.GeneratedMinimality_13_12_Part070
import LatticePathOrders.GeneratedMinimality_13_12_Part071
import LatticePathOrders.GeneratedMinimality_13_12_Part072
import LatticePathOrders.GeneratedMinimality_13_12_Part073
import LatticePathOrders.GeneratedMinimality_13_12_Part074
import LatticePathOrders.GeneratedMinimality_13_12_Part075
import LatticePathOrders.GeneratedMinimality_13_12_Part076
import LatticePathOrders.GeneratedMinimality_13_12_Part077
import LatticePathOrders.GeneratedMinimality_13_12_Part078
import LatticePathOrders.GeneratedMinimality_13_12_Part079

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_13_12

def regionsGroup004 : List (Path × Nat × AssignmentTree) :=
  regionsPart064 ++ (regionsPart065 ++ (regionsPart066 ++ (regionsPart067 ++ (regionsPart068 ++ (regionsPart069 ++ (regionsPart070 ++ (regionsPart071 ++ (regionsPart072 ++ (regionsPart073 ++ (regionsPart074 ++ (regionsPart075 ++ (regionsPart076 ++ (regionsPart077 ++ (regionsPart078 ++ (regionsPart079)))))))))))))))

theorem regionsGroup004_valid : ∀ region ∈ regionsGroup004,
    region.1.length + region.2.1 = 25 ∧
      region.2.2.check 13 12 classes region.2.1 region.1 = true := by
  intro region h
  simp only [regionsGroup004, List.mem_append] at h
  rcases h with h | h | h | h | h | h | h | h | h | h | h | h | h | h | h | h
  · exact regionsPart064_valid region h
  · exact regionsPart065_valid region h
  · exact regionsPart066_valid region h
  · exact regionsPart067_valid region h
  · exact regionsPart068_valid region h
  · exact regionsPart069_valid region h
  · exact regionsPart070_valid region h
  · exact regionsPart071_valid region h
  · exact regionsPart072_valid region h
  · exact regionsPart073_valid region h
  · exact regionsPart074_valid region h
  · exact regionsPart075_valid region h
  · exact regionsPart076_valid region h
  · exact regionsPart077_valid region h
  · exact regionsPart078_valid region h
  · exact regionsPart079_valid region h

end LatticePathOrders.GeneratedMinimality_13_12
