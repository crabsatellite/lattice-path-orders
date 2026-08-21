import LatticePathOrders.GeneratedMinimality_19_5_Part000
import LatticePathOrders.GeneratedMinimality_19_5_Part001
import LatticePathOrders.GeneratedMinimality_19_5_Part002
import LatticePathOrders.GeneratedMinimality_19_5_Part003
import LatticePathOrders.GeneratedMinimality_19_5_Part004
import LatticePathOrders.GeneratedMinimality_19_5_Part005
import LatticePathOrders.GeneratedMinimality_19_5_Part006
import LatticePathOrders.GeneratedMinimality_19_5_Part007
import LatticePathOrders.GeneratedMinimality_19_5_Part008
import LatticePathOrders.GeneratedMinimality_19_5_Part009
import LatticePathOrders.GeneratedMinimality_19_5_Part010
import LatticePathOrders.GeneratedMinimality_19_5_Part011
import LatticePathOrders.GeneratedMinimality_19_5_Part012
import LatticePathOrders.GeneratedMinimality_19_5_Part013
import LatticePathOrders.GeneratedMinimality_19_5_Part014

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_19_5

def regionsGroup000 : List (Path × Nat × AssignmentTree) :=
  regionsPart000 ++ (regionsPart001 ++ (regionsPart002 ++ (regionsPart003 ++ (regionsPart004 ++ (regionsPart005 ++ (regionsPart006 ++ (regionsPart007 ++ (regionsPart008 ++ (regionsPart009 ++ (regionsPart010 ++ (regionsPart011 ++ (regionsPart012 ++ (regionsPart013 ++ (regionsPart014))))))))))))))

theorem regionsGroup000_valid : ∀ region ∈ regionsGroup000,
    region.1.length + region.2.1 = 24 ∧
      region.2.2.check 19 5 classes region.2.1 region.1 = true := by
  intro region h
  simp only [regionsGroup000, List.mem_append] at h
  rcases h with h | h | h | h | h | h | h | h | h | h | h | h | h | h | h
  · exact regionsPart000_valid region h
  · exact regionsPart001_valid region h
  · exact regionsPart002_valid region h
  · exact regionsPart003_valid region h
  · exact regionsPart004_valid region h
  · exact regionsPart005_valid region h
  · exact regionsPart006_valid region h
  · exact regionsPart007_valid region h
  · exact regionsPart008_valid region h
  · exact regionsPart009_valid region h
  · exact regionsPart010_valid region h
  · exact regionsPart011_valid region h
  · exact regionsPart012_valid region h
  · exact regionsPart013_valid region h
  · exact regionsPart014_valid region h

end LatticePathOrders.GeneratedMinimality_19_5
