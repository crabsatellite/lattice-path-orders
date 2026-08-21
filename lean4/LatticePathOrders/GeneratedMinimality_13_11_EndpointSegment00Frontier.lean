import LatticePathOrders.GeneratedMinimality_13_11_EndpointSegment00Data

namespace LatticePathOrders.GeneratedMinimality_13_11

theorem frontierSegment00_regions :
    frontierSegment00 = regionsSegment00.map Prod.fst := by
  unfold frontierSegment00 regionsSegment00
  rw [List.map_append, frontierPair00_regions,
    List.map_append, frontierPair01_regions,
    List.map_append, frontierPair02_regions,
    frontierPair03_regions]

end LatticePathOrders.GeneratedMinimality_13_11

