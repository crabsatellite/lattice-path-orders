import LatticePathOrders.GeneratedMinimality_13_11_EndpointSegment00Data
import LatticePathOrders.GeneratedMinimality_13_11_EndpointAssembly

namespace LatticePathOrders.GeneratedMinimality_13_11

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

theorem regionsSegment00_valid : ∀ region ∈ regionsSegment00,
    region.1.length + region.2.1 = 24 ∧
      region.2.2.check 13 11 classes region.2.1 region.1 = true := by
  unfold regionsSegment00
  exact forall_mem_append regionsPair00_valid
    (forall_mem_append regionsPair01_valid
      (forall_mem_append regionsPair02_valid regionsPair03_valid))

end LatticePathOrders.GeneratedMinimality_13_11
