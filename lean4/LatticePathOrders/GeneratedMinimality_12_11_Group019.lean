import LatticePathOrders.GeneratedMinimality_12_11_Part304
import LatticePathOrders.GeneratedMinimality_12_11_Part305
import LatticePathOrders.GeneratedMinimality_12_11_Part306
import LatticePathOrders.GeneratedMinimality_12_11_Part307
import LatticePathOrders.GeneratedMinimality_12_11_Part308
import LatticePathOrders.GeneratedMinimality_12_11_Part309
import LatticePathOrders.GeneratedMinimality_12_11_Part310
import LatticePathOrders.GeneratedMinimality_12_11_Part311
import LatticePathOrders.GeneratedMinimality_12_11_Part312
import LatticePathOrders.GeneratedMinimality_12_11_Part313
import LatticePathOrders.GeneratedMinimality_12_11_Part314
import LatticePathOrders.GeneratedMinimality_12_11_Part315
import LatticePathOrders.GeneratedMinimality_12_11_Part316
import LatticePathOrders.GeneratedMinimality_12_11_Part317
import LatticePathOrders.GeneratedMinimality_12_11_Part318
import LatticePathOrders.GeneratedMinimality_12_11_Part319

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_12_11

def regionsGroup019 : List (Path × Nat × AssignmentTree) :=
  regionsPart304 ++ (regionsPart305 ++ (regionsPart306 ++ (regionsPart307 ++ (regionsPart308 ++ (regionsPart309 ++ (regionsPart310 ++ (regionsPart311 ++ (regionsPart312 ++ (regionsPart313 ++ (regionsPart314 ++ (regionsPart315 ++ (regionsPart316 ++ (regionsPart317 ++ (regionsPart318 ++ (regionsPart319)))))))))))))))

theorem regionsGroup019_valid : ∀ region ∈ regionsGroup019,
    region.1.length + region.2.1 = 23 ∧
      region.2.2.check 12 11 classes region.2.1 region.1 = true := by
  intro region h
  simp only [regionsGroup019, List.mem_append] at h
  rcases h with h | h | h | h | h | h | h | h | h | h | h | h | h | h | h | h
  · exact regionsPart304_valid region h
  · exact regionsPart305_valid region h
  · exact regionsPart306_valid region h
  · exact regionsPart307_valid region h
  · exact regionsPart308_valid region h
  · exact regionsPart309_valid region h
  · exact regionsPart310_valid region h
  · exact regionsPart311_valid region h
  · exact regionsPart312_valid region h
  · exact regionsPart313_valid region h
  · exact regionsPart314_valid region h
  · exact regionsPart315_valid region h
  · exact regionsPart316_valid region h
  · exact regionsPart317_valid region h
  · exact regionsPart318_valid region h
  · exact regionsPart319_valid region h

end LatticePathOrders.GeneratedMinimality_12_11
