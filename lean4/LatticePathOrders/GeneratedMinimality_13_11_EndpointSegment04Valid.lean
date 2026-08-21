import LatticePathOrders.GeneratedMinimality_13_11_EndpointSegment04Data
import LatticePathOrders.GeneratedMinimality_13_11_EndpointAssembly

namespace LatticePathOrders.GeneratedMinimality_13_11

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

theorem regionsSegment04_valid : ∀ region ∈ regionsSegment04,
    region.1.length + region.2.1 = 24 ∧
      region.2.2.check 13 11 classes region.2.1 region.1 = true := by
  unfold regionsSegment04
  exact forall_mem_append regionsPair16_valid
    (forall_mem_append regionsPair17_valid
      (forall_mem_append regionsPair18_valid regionsPair19_valid))

end LatticePathOrders.GeneratedMinimality_13_11

