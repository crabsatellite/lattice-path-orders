import LatticePathOrders.GeneratedMinimality_14_11_Part864
import LatticePathOrders.GeneratedMinimality_14_11_Part865
import LatticePathOrders.GeneratedMinimality_14_11_Part866
import LatticePathOrders.GeneratedMinimality_14_11_Part867
import LatticePathOrders.GeneratedMinimality_14_11_Part868
import LatticePathOrders.GeneratedMinimality_14_11_Part869
import LatticePathOrders.GeneratedMinimality_14_11_Part870
import LatticePathOrders.GeneratedMinimality_14_11_Part871
import LatticePathOrders.GeneratedMinimality_14_11_Part872
import LatticePathOrders.GeneratedMinimality_14_11_Part873
import LatticePathOrders.GeneratedMinimality_14_11_Part874
import LatticePathOrders.GeneratedMinimality_14_11_Part875
import LatticePathOrders.GeneratedMinimality_14_11_Part876
import LatticePathOrders.GeneratedMinimality_14_11_Part877
import LatticePathOrders.GeneratedMinimality_14_11_Part878
import LatticePathOrders.GeneratedMinimality_14_11_Part879

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_14_11

def regionsGroup054 : List (Path × Nat × AssignmentTree) :=
  regionsPart864 ++ (regionsPart865 ++ (regionsPart866 ++ (regionsPart867 ++ (regionsPart868 ++ (regionsPart869 ++ (regionsPart870 ++ (regionsPart871 ++ (regionsPart872 ++ (regionsPart873 ++ (regionsPart874 ++ (regionsPart875 ++ (regionsPart876 ++ (regionsPart877 ++ (regionsPart878 ++ (regionsPart879)))))))))))))))

theorem regionsGroup054_valid : ∀ region ∈ regionsGroup054,
    region.1.length + region.2.1 = 25 ∧
      region.2.2.check 14 11 classes region.2.1 region.1 = true := by
  intro region h
  simp only [regionsGroup054, List.mem_append] at h
  rcases h with h | h | h | h | h | h | h | h | h | h | h | h | h | h | h | h
  · exact regionsPart864_valid region h
  · exact regionsPart865_valid region h
  · exact regionsPart866_valid region h
  · exact regionsPart867_valid region h
  · exact regionsPart868_valid region h
  · exact regionsPart869_valid region h
  · exact regionsPart870_valid region h
  · exact regionsPart871_valid region h
  · exact regionsPart872_valid region h
  · exact regionsPart873_valid region h
  · exact regionsPart874_valid region h
  · exact regionsPart875_valid region h
  · exact regionsPart876_valid region h
  · exact regionsPart877_valid region h
  · exact regionsPart878_valid region h
  · exact regionsPart879_valid region h

end LatticePathOrders.GeneratedMinimality_14_11
