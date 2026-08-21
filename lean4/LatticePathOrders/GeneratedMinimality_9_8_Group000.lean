import LatticePathOrders.GeneratedMinimality_9_8_Part000
import LatticePathOrders.GeneratedMinimality_9_8_Part001
import LatticePathOrders.GeneratedMinimality_9_8_Part002
import LatticePathOrders.GeneratedMinimality_9_8_Part003
import LatticePathOrders.GeneratedMinimality_9_8_Part004
import LatticePathOrders.GeneratedMinimality_9_8_Part005
import LatticePathOrders.GeneratedMinimality_9_8_Part006
import LatticePathOrders.GeneratedMinimality_9_8_Part007
import LatticePathOrders.GeneratedMinimality_9_8_Part008

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_9_8

def regionsGroup000 : List (Path × Nat × AssignmentTree) :=
  regionsPart000 ++ (regionsPart001 ++ (regionsPart002 ++ (regionsPart003 ++ (regionsPart004 ++ (regionsPart005 ++ (regionsPart006 ++ (regionsPart007 ++ (regionsPart008))))))))

theorem regionsGroup000_valid : ∀ region ∈ regionsGroup000,
    region.1.length + region.2.1 = 17 ∧
      region.2.2.check 9 8 classes region.2.1 region.1 = true := by
  intro region h
  simp only [regionsGroup000, List.mem_append] at h
  rcases h with h | h | h | h | h | h | h | h | h
  · exact regionsPart000_valid region h
  · exact regionsPart001_valid region h
  · exact regionsPart002_valid region h
  · exact regionsPart003_valid region h
  · exact regionsPart004_valid region h
  · exact regionsPart005_valid region h
  · exact regionsPart006_valid region h
  · exact regionsPart007_valid region h
  · exact regionsPart008_valid region h

end LatticePathOrders.GeneratedMinimality_9_8
