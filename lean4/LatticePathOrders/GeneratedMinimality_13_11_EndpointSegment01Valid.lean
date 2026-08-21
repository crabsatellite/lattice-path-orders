import LatticePathOrders.GeneratedMinimality_13_11_EndpointSegment01Data
import LatticePathOrders.GeneratedMinimality_13_11_EndpointAssembly

namespace LatticePathOrders.GeneratedMinimality_13_11

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

theorem regionsSegment01_valid : ∀ region ∈ regionsSegment01,
    region.1.length + region.2.1 = 24 ∧
      region.2.2.check 13 11 classes region.2.1 region.1 = true := by
  unfold regionsSegment01
  exact forall_mem_append regionsPair04_valid
    (forall_mem_append regionsPair05_valid
      (forall_mem_append regionsPair06_valid regionsPair07_valid))

end LatticePathOrders.GeneratedMinimality_13_11

