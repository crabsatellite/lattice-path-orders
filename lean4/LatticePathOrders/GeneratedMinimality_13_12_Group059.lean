import LatticePathOrders.GeneratedMinimality_13_12_Part944
import LatticePathOrders.GeneratedMinimality_13_12_Part945
import LatticePathOrders.GeneratedMinimality_13_12_Part946
import LatticePathOrders.GeneratedMinimality_13_12_Part947
import LatticePathOrders.GeneratedMinimality_13_12_Part948
import LatticePathOrders.GeneratedMinimality_13_12_Part949
import LatticePathOrders.GeneratedMinimality_13_12_Part950
import LatticePathOrders.GeneratedMinimality_13_12_Part951
import LatticePathOrders.GeneratedMinimality_13_12_Part952
import LatticePathOrders.GeneratedMinimality_13_12_Part953
import LatticePathOrders.GeneratedMinimality_13_12_Part954
import LatticePathOrders.GeneratedMinimality_13_12_Part955
import LatticePathOrders.GeneratedMinimality_13_12_Part956
import LatticePathOrders.GeneratedMinimality_13_12_Part957
import LatticePathOrders.GeneratedMinimality_13_12_Part958
import LatticePathOrders.GeneratedMinimality_13_12_Part959

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_13_12

def regionsGroup059 : List (Path × Nat × AssignmentTree) :=
  regionsPart944 ++ (regionsPart945 ++ (regionsPart946 ++ (regionsPart947 ++ (regionsPart948 ++ (regionsPart949 ++ (regionsPart950 ++ (regionsPart951 ++ (regionsPart952 ++ (regionsPart953 ++ (regionsPart954 ++ (regionsPart955 ++ (regionsPart956 ++ (regionsPart957 ++ (regionsPart958 ++ (regionsPart959)))))))))))))))

theorem regionsGroup059_valid : ∀ region ∈ regionsGroup059,
    region.1.length + region.2.1 = 25 ∧
      region.2.2.check 13 12 classes region.2.1 region.1 = true := by
  intro region h
  simp only [regionsGroup059, List.mem_append] at h
  rcases h with h | h | h | h | h | h | h | h | h | h | h | h | h | h | h | h
  · exact regionsPart944_valid region h
  · exact regionsPart945_valid region h
  · exact regionsPart946_valid region h
  · exact regionsPart947_valid region h
  · exact regionsPart948_valid region h
  · exact regionsPart949_valid region h
  · exact regionsPart950_valid region h
  · exact regionsPart951_valid region h
  · exact regionsPart952_valid region h
  · exact regionsPart953_valid region h
  · exact regionsPart954_valid region h
  · exact regionsPart955_valid region h
  · exact regionsPart956_valid region h
  · exact regionsPart957_valid region h
  · exact regionsPart958_valid region h
  · exact regionsPart959_valid region h

end LatticePathOrders.GeneratedMinimality_13_12
