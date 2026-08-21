import LatticePathOrders.GeneratedMinimality_14_11_Part928
import LatticePathOrders.GeneratedMinimality_14_11_Part929
import LatticePathOrders.GeneratedMinimality_14_11_Part930
import LatticePathOrders.GeneratedMinimality_14_11_Part931
import LatticePathOrders.GeneratedMinimality_14_11_Part932
import LatticePathOrders.GeneratedMinimality_14_11_Part933
import LatticePathOrders.GeneratedMinimality_14_11_Part934
import LatticePathOrders.GeneratedMinimality_14_11_Part935
import LatticePathOrders.GeneratedMinimality_14_11_Part936
import LatticePathOrders.GeneratedMinimality_14_11_Part937
import LatticePathOrders.GeneratedMinimality_14_11_Part938
import LatticePathOrders.GeneratedMinimality_14_11_Part939
import LatticePathOrders.GeneratedMinimality_14_11_Part940
import LatticePathOrders.GeneratedMinimality_14_11_Part941
import LatticePathOrders.GeneratedMinimality_14_11_Part942
import LatticePathOrders.GeneratedMinimality_14_11_Part943

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_14_11

def regionsGroup058 : List (Path × Nat × AssignmentTree) :=
  regionsPart928 ++ (regionsPart929 ++ (regionsPart930 ++ (regionsPart931 ++ (regionsPart932 ++ (regionsPart933 ++ (regionsPart934 ++ (regionsPart935 ++ (regionsPart936 ++ (regionsPart937 ++ (regionsPart938 ++ (regionsPart939 ++ (regionsPart940 ++ (regionsPart941 ++ (regionsPart942 ++ (regionsPart943)))))))))))))))

theorem regionsGroup058_valid : ∀ region ∈ regionsGroup058,
    region.1.length + region.2.1 = 25 ∧
      region.2.2.check 14 11 classes region.2.1 region.1 = true := by
  intro region h
  simp only [regionsGroup058, List.mem_append] at h
  rcases h with h | h | h | h | h | h | h | h | h | h | h | h | h | h | h | h
  · exact regionsPart928_valid region h
  · exact regionsPart929_valid region h
  · exact regionsPart930_valid region h
  · exact regionsPart931_valid region h
  · exact regionsPart932_valid region h
  · exact regionsPart933_valid region h
  · exact regionsPart934_valid region h
  · exact regionsPart935_valid region h
  · exact regionsPart936_valid region h
  · exact regionsPart937_valid region h
  · exact regionsPart938_valid region h
  · exact regionsPart939_valid region h
  · exact regionsPart940_valid region h
  · exact regionsPart941_valid region h
  · exact regionsPart942_valid region h
  · exact regionsPart943_valid region h

end LatticePathOrders.GeneratedMinimality_14_11
