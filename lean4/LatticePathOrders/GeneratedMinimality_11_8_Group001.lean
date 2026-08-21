import LatticePathOrders.GeneratedMinimality_11_8_Part016
import LatticePathOrders.GeneratedMinimality_11_8_Part017
import LatticePathOrders.GeneratedMinimality_11_8_Part018
import LatticePathOrders.GeneratedMinimality_11_8_Part019
import LatticePathOrders.GeneratedMinimality_11_8_Part020
import LatticePathOrders.GeneratedMinimality_11_8_Part021
import LatticePathOrders.GeneratedMinimality_11_8_Part022
import LatticePathOrders.GeneratedMinimality_11_8_Part023
import LatticePathOrders.GeneratedMinimality_11_8_Part024
import LatticePathOrders.GeneratedMinimality_11_8_Part025

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_11_8

def regionsGroup001 : List (Path × Nat × AssignmentTree) :=
  regionsPart016 ++ (regionsPart017 ++ (regionsPart018 ++ (regionsPart019 ++ (regionsPart020 ++ (regionsPart021 ++ (regionsPart022 ++ (regionsPart023 ++ (regionsPart024 ++ (regionsPart025)))))))))

theorem regionsGroup001_valid : ∀ region ∈ regionsGroup001,
    region.1.length + region.2.1 = 19 ∧
      region.2.2.check 11 8 classes region.2.1 region.1 = true := by
  intro region h
  simp only [regionsGroup001, List.mem_append] at h
  rcases h with h | h | h | h | h | h | h | h | h | h
  · exact regionsPart016_valid region h
  · exact regionsPart017_valid region h
  · exact regionsPart018_valid region h
  · exact regionsPart019_valid region h
  · exact regionsPart020_valid region h
  · exact regionsPart021_valid region h
  · exact regionsPart022_valid region h
  · exact regionsPart023_valid region h
  · exact regionsPart024_valid region h
  · exact regionsPart025_valid region h

end LatticePathOrders.GeneratedMinimality_11_8
