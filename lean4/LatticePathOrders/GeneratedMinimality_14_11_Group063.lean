import LatticePathOrders.GeneratedMinimality_14_11_Part1008
import LatticePathOrders.GeneratedMinimality_14_11_Part1009
import LatticePathOrders.GeneratedMinimality_14_11_Part1010

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_14_11

def regionsGroup063 : List (Path × Nat × AssignmentTree) :=
  regionsPart1008 ++ (regionsPart1009 ++ (regionsPart1010))

theorem regionsGroup063_valid : ∀ region ∈ regionsGroup063,
    region.1.length + region.2.1 = 25 ∧
      region.2.2.check 14 11 classes region.2.1 region.1 = true := by
  intro region h
  simp only [regionsGroup063, List.mem_append] at h
  rcases h with h | h | h
  · exact regionsPart1008_valid region h
  · exact regionsPart1009_valid region h
  · exact regionsPart1010_valid region h

end LatticePathOrders.GeneratedMinimality_14_11
