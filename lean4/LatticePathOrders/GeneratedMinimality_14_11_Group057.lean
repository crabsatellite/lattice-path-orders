import LatticePathOrders.GeneratedMinimality_14_11_Part912
import LatticePathOrders.GeneratedMinimality_14_11_Part913
import LatticePathOrders.GeneratedMinimality_14_11_Part914
import LatticePathOrders.GeneratedMinimality_14_11_Part915
import LatticePathOrders.GeneratedMinimality_14_11_Part916
import LatticePathOrders.GeneratedMinimality_14_11_Part917
import LatticePathOrders.GeneratedMinimality_14_11_Part918
import LatticePathOrders.GeneratedMinimality_14_11_Part919
import LatticePathOrders.GeneratedMinimality_14_11_Part920
import LatticePathOrders.GeneratedMinimality_14_11_Part921
import LatticePathOrders.GeneratedMinimality_14_11_Part922
import LatticePathOrders.GeneratedMinimality_14_11_Part923
import LatticePathOrders.GeneratedMinimality_14_11_Part924
import LatticePathOrders.GeneratedMinimality_14_11_Part925
import LatticePathOrders.GeneratedMinimality_14_11_Part926
import LatticePathOrders.GeneratedMinimality_14_11_Part927

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_14_11

def regionsGroup057 : List (Path × Nat × AssignmentTree) :=
  regionsPart912 ++ (regionsPart913 ++ (regionsPart914 ++ (regionsPart915 ++ (regionsPart916 ++ (regionsPart917 ++ (regionsPart918 ++ (regionsPart919 ++ (regionsPart920 ++ (regionsPart921 ++ (regionsPart922 ++ (regionsPart923 ++ (regionsPart924 ++ (regionsPart925 ++ (regionsPart926 ++ (regionsPart927)))))))))))))))

theorem regionsGroup057_valid : ∀ region ∈ regionsGroup057,
    region.1.length + region.2.1 = 25 ∧
      region.2.2.check 14 11 classes region.2.1 region.1 = true := by
  intro region h
  simp only [regionsGroup057, List.mem_append] at h
  rcases h with h | h | h | h | h | h | h | h | h | h | h | h | h | h | h | h
  · exact regionsPart912_valid region h
  · exact regionsPart913_valid region h
  · exact regionsPart914_valid region h
  · exact regionsPart915_valid region h
  · exact regionsPart916_valid region h
  · exact regionsPart917_valid region h
  · exact regionsPart918_valid region h
  · exact regionsPart919_valid region h
  · exact regionsPart920_valid region h
  · exact regionsPart921_valid region h
  · exact regionsPart922_valid region h
  · exact regionsPart923_valid region h
  · exact regionsPart924_valid region h
  · exact regionsPart925_valid region h
  · exact regionsPart926_valid region h
  · exact regionsPart927_valid region h

end LatticePathOrders.GeneratedMinimality_14_11
