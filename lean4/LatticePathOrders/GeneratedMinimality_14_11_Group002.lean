import LatticePathOrders.GeneratedMinimality_14_11_Part032
import LatticePathOrders.GeneratedMinimality_14_11_Part033
import LatticePathOrders.GeneratedMinimality_14_11_Part034
import LatticePathOrders.GeneratedMinimality_14_11_Part035
import LatticePathOrders.GeneratedMinimality_14_11_Part036
import LatticePathOrders.GeneratedMinimality_14_11_Part037
import LatticePathOrders.GeneratedMinimality_14_11_Part038
import LatticePathOrders.GeneratedMinimality_14_11_Part039
import LatticePathOrders.GeneratedMinimality_14_11_Part040
import LatticePathOrders.GeneratedMinimality_14_11_Part041
import LatticePathOrders.GeneratedMinimality_14_11_Part042
import LatticePathOrders.GeneratedMinimality_14_11_Part043
import LatticePathOrders.GeneratedMinimality_14_11_Part044
import LatticePathOrders.GeneratedMinimality_14_11_Part045
import LatticePathOrders.GeneratedMinimality_14_11_Part046
import LatticePathOrders.GeneratedMinimality_14_11_Part047

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_14_11

def regionsGroup002 : List (Path × Nat × AssignmentTree) :=
  regionsPart032 ++ (regionsPart033 ++ (regionsPart034 ++ (regionsPart035 ++ (regionsPart036 ++ (regionsPart037 ++ (regionsPart038 ++ (regionsPart039 ++ (regionsPart040 ++ (regionsPart041 ++ (regionsPart042 ++ (regionsPart043 ++ (regionsPart044 ++ (regionsPart045 ++ (regionsPart046 ++ (regionsPart047)))))))))))))))

theorem regionsGroup002_valid : ∀ region ∈ regionsGroup002,
    region.1.length + region.2.1 = 25 ∧
      region.2.2.check 14 11 classes region.2.1 region.1 = true := by
  intro region h
  simp only [regionsGroup002, List.mem_append] at h
  rcases h with h | h | h | h | h | h | h | h | h | h | h | h | h | h | h | h
  · exact regionsPart032_valid region h
  · exact regionsPart033_valid region h
  · exact regionsPart034_valid region h
  · exact regionsPart035_valid region h
  · exact regionsPart036_valid region h
  · exact regionsPart037_valid region h
  · exact regionsPart038_valid region h
  · exact regionsPart039_valid region h
  · exact regionsPart040_valid region h
  · exact regionsPart041_valid region h
  · exact regionsPart042_valid region h
  · exact regionsPart043_valid region h
  · exact regionsPart044_valid region h
  · exact regionsPart045_valid region h
  · exact regionsPart046_valid region h
  · exact regionsPart047_valid region h

end LatticePathOrders.GeneratedMinimality_14_11
