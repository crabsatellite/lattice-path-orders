import LatticePathOrders.GeneratedMinimality_13_11_EndpointSegment03Data

namespace LatticePathOrders.GeneratedMinimality_13_11

theorem frontierSegment03_regions :
    frontierSegment03 = regionsSegment03.map Prod.fst := by
  unfold frontierSegment03 regionsSegment03
  rw [List.map_append, frontierPair12_regions,
    List.map_append, frontierPair13_regions,
    List.map_append, frontierPair14_regions,
    frontierPair15_regions]

end LatticePathOrders.GeneratedMinimality_13_11

