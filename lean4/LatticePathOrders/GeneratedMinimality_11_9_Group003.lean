import LatticePathOrders.GeneratedMinimality_11_9_Part048
import LatticePathOrders.GeneratedMinimality_11_9_Part049

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_11_9

def regionsGroup003 : List (Path × Nat × AssignmentTree) :=
  regionsPart048 ++ (regionsPart049)

theorem regionsGroup003_valid : ∀ region ∈ regionsGroup003,
    region.1.length + region.2.1 = 20 ∧
      region.2.2.check 11 9 classes region.2.1 region.1 = true := by
  intro region h
  simp only [regionsGroup003, List.mem_append] at h
  rcases h with h | h
  · exact regionsPart048_valid region h
  · exact regionsPart049_valid region h

end LatticePathOrders.GeneratedMinimality_11_9
