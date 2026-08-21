import LatticePathOrders.GeneratedMinimality_13_11_Group036
import LatticePathOrders.GeneratedMinimality_13_11_FrontierAtom53
import LatticePathOrders.GeneratedMinimality_13_11_FrontierAtom54

namespace LatticePathOrders.GeneratedMinimality_13_11

def groupFrontier036 : List Path :=
  partitionFrontierAtom53 ++
    partitionFrontierAtom54

theorem groupFrontier036_regions :
    groupFrontier036 = regionsGroup036.map Prod.fst := by
  unfold groupFrontier036 partitionFrontierAtom53 partitionFrontierAtom54 regionsGroup036 regionsPart576 regionsPart577 regionsPart578 regionsPart579 regionsPart580 regionsPart581 regionsPart582 regionsPart583 regionsPart584 regionsPart585 regionsPart586 regionsPart587 regionsPart588 regionsPart589 regionsPart590 regionsPart591
  rfl

end LatticePathOrders.GeneratedMinimality_13_11

