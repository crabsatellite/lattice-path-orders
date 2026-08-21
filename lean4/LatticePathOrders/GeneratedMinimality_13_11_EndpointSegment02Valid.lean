import LatticePathOrders.GeneratedMinimality_13_11_EndpointSegment02Data
import LatticePathOrders.GeneratedMinimality_13_11_EndpointAssembly

namespace LatticePathOrders.GeneratedMinimality_13_11

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

theorem regionsSegment02_valid : ∀ region ∈ regionsSegment02,
    region.1.length + region.2.1 = 24 ∧
      region.2.2.check 13 11 classes region.2.1 region.1 = true := by
  unfold regionsSegment02
  exact forall_mem_append regionsPair08_valid
    (forall_mem_append regionsPair09_valid
      (forall_mem_append regionsPair10_valid regionsPair11_valid))

end LatticePathOrders.GeneratedMinimality_13_11

