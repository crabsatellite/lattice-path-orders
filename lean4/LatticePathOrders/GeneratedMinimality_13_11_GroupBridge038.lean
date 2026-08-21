import LatticePathOrders.GeneratedMinimality_13_11_Group038
import LatticePathOrders.GeneratedMinimality_13_11_FrontierAtom56
import LatticePathOrders.GeneratedMinimality_13_11_FrontierAtom57

namespace LatticePathOrders.GeneratedMinimality_13_11

def groupFrontier038 : List Path :=
  partitionFrontierAtom56 ++
    partitionFrontierAtom57

theorem groupFrontier038_regions :
    groupFrontier038 = regionsGroup038.map Prod.fst := by
  unfold groupFrontier038 partitionFrontierAtom56 partitionFrontierAtom57 regionsGroup038 regionsPart608 regionsPart609 regionsPart610 regionsPart611 regionsPart612 regionsPart613 regionsPart614 regionsPart615 regionsPart616 regionsPart617 regionsPart618 regionsPart619 regionsPart620 regionsPart621 regionsPart622 regionsPart623
  rfl

end LatticePathOrders.GeneratedMinimality_13_11

