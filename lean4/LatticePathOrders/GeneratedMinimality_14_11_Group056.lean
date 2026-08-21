import LatticePathOrders.GeneratedMinimality_14_11_Part896
import LatticePathOrders.GeneratedMinimality_14_11_Part897
import LatticePathOrders.GeneratedMinimality_14_11_Part898
import LatticePathOrders.GeneratedMinimality_14_11_Part899
import LatticePathOrders.GeneratedMinimality_14_11_Part900
import LatticePathOrders.GeneratedMinimality_14_11_Part901
import LatticePathOrders.GeneratedMinimality_14_11_Part902
import LatticePathOrders.GeneratedMinimality_14_11_Part903
import LatticePathOrders.GeneratedMinimality_14_11_Part904
import LatticePathOrders.GeneratedMinimality_14_11_Part905
import LatticePathOrders.GeneratedMinimality_14_11_Part906
import LatticePathOrders.GeneratedMinimality_14_11_Part907
import LatticePathOrders.GeneratedMinimality_14_11_Part908
import LatticePathOrders.GeneratedMinimality_14_11_Part909
import LatticePathOrders.GeneratedMinimality_14_11_Part910
import LatticePathOrders.GeneratedMinimality_14_11_Part911

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_14_11

def regionsGroup056 : List (Path × Nat × AssignmentTree) :=
  regionsPart896 ++ (regionsPart897 ++ (regionsPart898 ++ (regionsPart899 ++ (regionsPart900 ++ (regionsPart901 ++ (regionsPart902 ++ (regionsPart903 ++ (regionsPart904 ++ (regionsPart905 ++ (regionsPart906 ++ (regionsPart907 ++ (regionsPart908 ++ (regionsPart909 ++ (regionsPart910 ++ (regionsPart911)))))))))))))))

theorem regionsGroup056_valid : ∀ region ∈ regionsGroup056,
    region.1.length + region.2.1 = 25 ∧
      region.2.2.check 14 11 classes region.2.1 region.1 = true := by
  intro region h
  simp only [regionsGroup056, List.mem_append] at h
  rcases h with h | h | h | h | h | h | h | h | h | h | h | h | h | h | h | h
  · exact regionsPart896_valid region h
  · exact regionsPart897_valid region h
  · exact regionsPart898_valid region h
  · exact regionsPart899_valid region h
  · exact regionsPart900_valid region h
  · exact regionsPart901_valid region h
  · exact regionsPart902_valid region h
  · exact regionsPart903_valid region h
  · exact regionsPart904_valid region h
  · exact regionsPart905_valid region h
  · exact regionsPart906_valid region h
  · exact regionsPart907_valid region h
  · exact regionsPart908_valid region h
  · exact regionsPart909_valid region h
  · exact regionsPart910_valid region h
  · exact regionsPart911_valid region h

end LatticePathOrders.GeneratedMinimality_14_11
