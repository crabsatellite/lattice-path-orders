import LatticePathOrders.GeneratedMinimality_13_12_Part848
import LatticePathOrders.GeneratedMinimality_13_12_Part849
import LatticePathOrders.GeneratedMinimality_13_12_Part850
import LatticePathOrders.GeneratedMinimality_13_12_Part851
import LatticePathOrders.GeneratedMinimality_13_12_Part852
import LatticePathOrders.GeneratedMinimality_13_12_Part853
import LatticePathOrders.GeneratedMinimality_13_12_Part854
import LatticePathOrders.GeneratedMinimality_13_12_Part855
import LatticePathOrders.GeneratedMinimality_13_12_Part856
import LatticePathOrders.GeneratedMinimality_13_12_Part857
import LatticePathOrders.GeneratedMinimality_13_12_Part858
import LatticePathOrders.GeneratedMinimality_13_12_Part859
import LatticePathOrders.GeneratedMinimality_13_12_Part860
import LatticePathOrders.GeneratedMinimality_13_12_Part861
import LatticePathOrders.GeneratedMinimality_13_12_Part862
import LatticePathOrders.GeneratedMinimality_13_12_Part863

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_13_12

def regionsGroup053 : List (Path × Nat × AssignmentTree) :=
  regionsPart848 ++ (regionsPart849 ++ (regionsPart850 ++ (regionsPart851 ++ (regionsPart852 ++ (regionsPart853 ++ (regionsPart854 ++ (regionsPart855 ++ (regionsPart856 ++ (regionsPart857 ++ (regionsPart858 ++ (regionsPart859 ++ (regionsPart860 ++ (regionsPart861 ++ (regionsPart862 ++ (regionsPart863)))))))))))))))

theorem regionsGroup053_valid : ∀ region ∈ regionsGroup053,
    region.1.length + region.2.1 = 25 ∧
      region.2.2.check 13 12 classes region.2.1 region.1 = true := by
  intro region h
  simp only [regionsGroup053, List.mem_append] at h
  rcases h with h | h | h | h | h | h | h | h | h | h | h | h | h | h | h | h
  · exact regionsPart848_valid region h
  · exact regionsPart849_valid region h
  · exact regionsPart850_valid region h
  · exact regionsPart851_valid region h
  · exact regionsPart852_valid region h
  · exact regionsPart853_valid region h
  · exact regionsPart854_valid region h
  · exact regionsPart855_valid region h
  · exact regionsPart856_valid region h
  · exact regionsPart857_valid region h
  · exact regionsPart858_valid region h
  · exact regionsPart859_valid region h
  · exact regionsPart860_valid region h
  · exact regionsPart861_valid region h
  · exact regionsPart862_valid region h
  · exact regionsPart863_valid region h

end LatticePathOrders.GeneratedMinimality_13_12
