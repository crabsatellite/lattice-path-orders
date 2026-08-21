import LatticePathOrders.GeneratedMinimality_13_12_Part1008
import LatticePathOrders.GeneratedMinimality_13_12_Part1009
import LatticePathOrders.GeneratedMinimality_13_12_Part1010
import LatticePathOrders.GeneratedMinimality_13_12_Part1011
import LatticePathOrders.GeneratedMinimality_13_12_Part1012
import LatticePathOrders.GeneratedMinimality_13_12_Part1013
import LatticePathOrders.GeneratedMinimality_13_12_Part1014
import LatticePathOrders.GeneratedMinimality_13_12_Part1015
import LatticePathOrders.GeneratedMinimality_13_12_Part1016
import LatticePathOrders.GeneratedMinimality_13_12_Part1017
import LatticePathOrders.GeneratedMinimality_13_12_Part1018
import LatticePathOrders.GeneratedMinimality_13_12_Part1019
import LatticePathOrders.GeneratedMinimality_13_12_Part1020
import LatticePathOrders.GeneratedMinimality_13_12_Part1021
import LatticePathOrders.GeneratedMinimality_13_12_Part1022
import LatticePathOrders.GeneratedMinimality_13_12_Part1023

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_13_12

def regionsGroup063 : List (Path × Nat × AssignmentTree) :=
  regionsPart1008 ++ (regionsPart1009 ++ (regionsPart1010 ++ (regionsPart1011 ++ (regionsPart1012 ++ (regionsPart1013 ++ (regionsPart1014 ++ (regionsPart1015 ++ (regionsPart1016 ++ (regionsPart1017 ++ (regionsPart1018 ++ (regionsPart1019 ++ (regionsPart1020 ++ (regionsPart1021 ++ (regionsPart1022 ++ (regionsPart1023)))))))))))))))

theorem regionsGroup063_valid : ∀ region ∈ regionsGroup063,
    region.1.length + region.2.1 = 25 ∧
      region.2.2.check 13 12 classes region.2.1 region.1 = true := by
  intro region h
  simp only [regionsGroup063, List.mem_append] at h
  rcases h with h | h | h | h | h | h | h | h | h | h | h | h | h | h | h | h
  · exact regionsPart1008_valid region h
  · exact regionsPart1009_valid region h
  · exact regionsPart1010_valid region h
  · exact regionsPart1011_valid region h
  · exact regionsPart1012_valid region h
  · exact regionsPart1013_valid region h
  · exact regionsPart1014_valid region h
  · exact regionsPart1015_valid region h
  · exact regionsPart1016_valid region h
  · exact regionsPart1017_valid region h
  · exact regionsPart1018_valid region h
  · exact regionsPart1019_valid region h
  · exact regionsPart1020_valid region h
  · exact regionsPart1021_valid region h
  · exact regionsPart1022_valid region h
  · exact regionsPart1023_valid region h

end LatticePathOrders.GeneratedMinimality_13_12
