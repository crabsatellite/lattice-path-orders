import LatticePathOrders.GeneratedMinimality_13_12_Part976
import LatticePathOrders.GeneratedMinimality_13_12_Part977
import LatticePathOrders.GeneratedMinimality_13_12_Part978
import LatticePathOrders.GeneratedMinimality_13_12_Part979
import LatticePathOrders.GeneratedMinimality_13_12_Part980
import LatticePathOrders.GeneratedMinimality_13_12_Part981
import LatticePathOrders.GeneratedMinimality_13_12_Part982
import LatticePathOrders.GeneratedMinimality_13_12_Part983
import LatticePathOrders.GeneratedMinimality_13_12_Part984
import LatticePathOrders.GeneratedMinimality_13_12_Part985
import LatticePathOrders.GeneratedMinimality_13_12_Part986
import LatticePathOrders.GeneratedMinimality_13_12_Part987
import LatticePathOrders.GeneratedMinimality_13_12_Part988
import LatticePathOrders.GeneratedMinimality_13_12_Part989
import LatticePathOrders.GeneratedMinimality_13_12_Part990
import LatticePathOrders.GeneratedMinimality_13_12_Part991

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_13_12

def regionsGroup061 : List (Path × Nat × AssignmentTree) :=
  regionsPart976 ++ (regionsPart977 ++ (regionsPart978 ++ (regionsPart979 ++ (regionsPart980 ++ (regionsPart981 ++ (regionsPart982 ++ (regionsPart983 ++ (regionsPart984 ++ (regionsPart985 ++ (regionsPart986 ++ (regionsPart987 ++ (regionsPart988 ++ (regionsPart989 ++ (regionsPart990 ++ (regionsPart991)))))))))))))))

theorem regionsGroup061_valid : ∀ region ∈ regionsGroup061,
    region.1.length + region.2.1 = 25 ∧
      region.2.2.check 13 12 classes region.2.1 region.1 = true := by
  intro region h
  simp only [regionsGroup061, List.mem_append] at h
  rcases h with h | h | h | h | h | h | h | h | h | h | h | h | h | h | h | h
  · exact regionsPart976_valid region h
  · exact regionsPart977_valid region h
  · exact regionsPart978_valid region h
  · exact regionsPart979_valid region h
  · exact regionsPart980_valid region h
  · exact regionsPart981_valid region h
  · exact regionsPart982_valid region h
  · exact regionsPart983_valid region h
  · exact regionsPart984_valid region h
  · exact regionsPart985_valid region h
  · exact regionsPart986_valid region h
  · exact regionsPart987_valid region h
  · exact regionsPart988_valid region h
  · exact regionsPart989_valid region h
  · exact regionsPart990_valid region h
  · exact regionsPart991_valid region h

end LatticePathOrders.GeneratedMinimality_13_12
