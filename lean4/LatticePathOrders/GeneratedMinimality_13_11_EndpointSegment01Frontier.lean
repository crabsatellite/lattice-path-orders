import LatticePathOrders.GeneratedMinimality_13_11_EndpointSegment01Data

namespace LatticePathOrders.GeneratedMinimality_13_11

theorem frontierSegment01_regions :
    frontierSegment01 = regionsSegment01.map Prod.fst := by
  unfold frontierSegment01 regionsSegment01
  rw [List.map_append, frontierPair04_regions,
    List.map_append, frontierPair05_regions,
    List.map_append, frontierPair06_regions,
    frontierPair07_regions]

end LatticePathOrders.GeneratedMinimality_13_11

