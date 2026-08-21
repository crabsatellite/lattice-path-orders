import LatticePathOrders.GeneratedMinimality_13_11_EndpointSegment02Data

namespace LatticePathOrders.GeneratedMinimality_13_11

theorem frontierSegment02_regions :
    frontierSegment02 = regionsSegment02.map Prod.fst := by
  unfold frontierSegment02 regionsSegment02
  rw [List.map_append, frontierPair08_regions,
    List.map_append, frontierPair09_regions,
    List.map_append, frontierPair10_regions,
    frontierPair11_regions]

end LatticePathOrders.GeneratedMinimality_13_11

