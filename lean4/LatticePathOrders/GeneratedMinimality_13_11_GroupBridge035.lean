import LatticePathOrders.GeneratedMinimality_13_11_Group035
import LatticePathOrders.GeneratedMinimality_13_11_FrontierAtom51
import LatticePathOrders.GeneratedMinimality_13_11_FrontierAtom52

namespace LatticePathOrders.GeneratedMinimality_13_11

def groupFrontier035 : List Path :=
  partitionFrontierAtom51 ++
    partitionFrontierAtom52

theorem groupFrontier035_regions :
    groupFrontier035 = regionsGroup035.map Prod.fst := by
  unfold groupFrontier035 partitionFrontierAtom51 partitionFrontierAtom52 regionsGroup035 regionsPart560 regionsPart561 regionsPart562 regionsPart563 regionsPart564 regionsPart565 regionsPart566 regionsPart567 regionsPart568 regionsPart569 regionsPart570 regionsPart571 regionsPart572 regionsPart573 regionsPart574 regionsPart575
  rfl

end LatticePathOrders.GeneratedMinimality_13_11

