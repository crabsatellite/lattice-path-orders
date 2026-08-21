import LatticePathOrders.GeneratedMinimality_12_11_Part352
import LatticePathOrders.GeneratedMinimality_12_11_Part353
import LatticePathOrders.GeneratedMinimality_12_11_Part354
import LatticePathOrders.GeneratedMinimality_12_11_Part355
import LatticePathOrders.GeneratedMinimality_12_11_Part356
import LatticePathOrders.GeneratedMinimality_12_11_Part357

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_12_11

def regionsGroup022 : List (Path × Nat × AssignmentTree) :=
  regionsPart352 ++ (regionsPart353 ++ (regionsPart354 ++ (regionsPart355 ++ (regionsPart356 ++ (regionsPart357)))))

theorem regionsGroup022_valid : ∀ region ∈ regionsGroup022,
    region.1.length + region.2.1 = 23 ∧
      region.2.2.check 12 11 classes region.2.1 region.1 = true := by
  intro region h
  simp only [regionsGroup022, List.mem_append] at h
  rcases h with h | h | h | h | h | h
  · exact regionsPart352_valid region h
  · exact regionsPart353_valid region h
  · exact regionsPart354_valid region h
  · exact regionsPart355_valid region h
  · exact regionsPart356_valid region h
  · exact regionsPart357_valid region h

end LatticePathOrders.GeneratedMinimality_12_11
