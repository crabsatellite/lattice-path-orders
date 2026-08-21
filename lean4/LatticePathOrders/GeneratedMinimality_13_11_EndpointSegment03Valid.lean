import LatticePathOrders.GeneratedMinimality_13_11_EndpointSegment03Data
import LatticePathOrders.GeneratedMinimality_13_11_EndpointAssembly

namespace LatticePathOrders.GeneratedMinimality_13_11

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

theorem regionsSegment03_valid : ∀ region ∈ regionsSegment03,
    region.1.length + region.2.1 = 24 ∧
      region.2.2.check 13 11 classes region.2.1 region.1 = true := by
  unfold regionsSegment03
  exact forall_mem_append regionsPair12_valid
    (forall_mem_append regionsPair13_valid
      (forall_mem_append regionsPair14_valid regionsPair15_valid))

end LatticePathOrders.GeneratedMinimality_13_11

