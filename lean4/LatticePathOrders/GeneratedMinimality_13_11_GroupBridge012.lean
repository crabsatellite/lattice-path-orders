import LatticePathOrders.GeneratedMinimality_13_11_Group012
import LatticePathOrders.GeneratedMinimality_13_11_FrontierAtom16
import LatticePathOrders.GeneratedMinimality_13_11_FrontierAtom17

namespace LatticePathOrders.GeneratedMinimality_13_11

def groupFrontier012 : List Path :=
  partitionFrontierAtom16 ++
    partitionFrontierAtom17

theorem groupFrontier012_regions :
    groupFrontier012 = regionsGroup012.map Prod.fst := by
  unfold groupFrontier012 partitionFrontierAtom16 partitionFrontierAtom17 regionsGroup012 regionsPart192 regionsPart193 regionsPart194 regionsPart195 regionsPart196 regionsPart197 regionsPart198 regionsPart199 regionsPart200 regionsPart201 regionsPart202 regionsPart203 regionsPart204 regionsPart205 regionsPart206 regionsPart207
  rfl

end LatticePathOrders.GeneratedMinimality_13_11

