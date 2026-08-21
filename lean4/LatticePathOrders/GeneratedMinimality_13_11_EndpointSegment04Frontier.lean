import LatticePathOrders.GeneratedMinimality_13_11_EndpointSegment04Data

namespace LatticePathOrders.GeneratedMinimality_13_11

theorem frontierSegment04_regions :
    frontierSegment04 = regionsSegment04.map Prod.fst := by
  unfold frontierSegment04 regionsSegment04
  rw [List.map_append, frontierPair16_regions,
    List.map_append, frontierPair17_regions,
    List.map_append, frontierPair18_regions,
    frontierPair19_regions]

end LatticePathOrders.GeneratedMinimality_13_11

