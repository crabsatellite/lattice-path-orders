import LatticePathOrders.GeneratedMinimality_11_9_Part016
import LatticePathOrders.GeneratedMinimality_11_9_Part017
import LatticePathOrders.GeneratedMinimality_11_9_Part018
import LatticePathOrders.GeneratedMinimality_11_9_Part019
import LatticePathOrders.GeneratedMinimality_11_9_Part020
import LatticePathOrders.GeneratedMinimality_11_9_Part021
import LatticePathOrders.GeneratedMinimality_11_9_Part022
import LatticePathOrders.GeneratedMinimality_11_9_Part023
import LatticePathOrders.GeneratedMinimality_11_9_Part024
import LatticePathOrders.GeneratedMinimality_11_9_Part025
import LatticePathOrders.GeneratedMinimality_11_9_Part026
import LatticePathOrders.GeneratedMinimality_11_9_Part027
import LatticePathOrders.GeneratedMinimality_11_9_Part028
import LatticePathOrders.GeneratedMinimality_11_9_Part029
import LatticePathOrders.GeneratedMinimality_11_9_Part030
import LatticePathOrders.GeneratedMinimality_11_9_Part031

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_11_9

def regionsGroup001 : List (Path × Nat × AssignmentTree) :=
  regionsPart016 ++ (regionsPart017 ++ (regionsPart018 ++ (regionsPart019 ++ (regionsPart020 ++ (regionsPart021 ++ (regionsPart022 ++ (regionsPart023 ++ (regionsPart024 ++ (regionsPart025 ++ (regionsPart026 ++ (regionsPart027 ++ (regionsPart028 ++ (regionsPart029 ++ (regionsPart030 ++ (regionsPart031)))))))))))))))

theorem regionsGroup001_valid : ∀ region ∈ regionsGroup001,
    region.1.length + region.2.1 = 20 ∧
      region.2.2.check 11 9 classes region.2.1 region.1 = true := by
  intro region h
  simp only [regionsGroup001, List.mem_append] at h
  rcases h with h | h | h | h | h | h | h | h | h | h | h | h | h | h | h | h
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
  · exact regionsPart026_valid region h
  · exact regionsPart027_valid region h
  · exact regionsPart028_valid region h
  · exact regionsPart029_valid region h
  · exact regionsPart030_valid region h
  · exact regionsPart031_valid region h

end LatticePathOrders.GeneratedMinimality_11_9
