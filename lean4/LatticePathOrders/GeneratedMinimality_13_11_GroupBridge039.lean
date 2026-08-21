import LatticePathOrders.GeneratedMinimality_13_11_Group039
import LatticePathOrders.GeneratedMinimality_13_11_FrontierAtom58

namespace LatticePathOrders.GeneratedMinimality_13_11

def groupFrontier039 : List Path :=
  partitionFrontierAtom58

theorem groupFrontier039_regions :
    groupFrontier039 = regionsGroup039.map Prod.fst := by
  unfold groupFrontier039 partitionFrontierAtom58 regionsGroup039 regionsPart624 regionsPart625 regionsPart626
  rfl

end LatticePathOrders.GeneratedMinimality_13_11

