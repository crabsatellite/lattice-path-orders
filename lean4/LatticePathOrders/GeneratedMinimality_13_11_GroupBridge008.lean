import LatticePathOrders.GeneratedMinimality_13_11_Group008
import LatticePathOrders.GeneratedMinimality_13_11_FrontierAtom11

namespace LatticePathOrders.GeneratedMinimality_13_11

def groupFrontier008 : List Path :=
  partitionFrontierAtom11

theorem groupFrontier008_regions :
    groupFrontier008 = regionsGroup008.map Prod.fst := by
  unfold groupFrontier008 partitionFrontierAtom11 regionsGroup008 regionsPart128 regionsPart129 regionsPart130 regionsPart131 regionsPart132 regionsPart133 regionsPart134 regionsPart135 regionsPart136 regionsPart137 regionsPart138 regionsPart139 regionsPart140 regionsPart141 regionsPart142 regionsPart143
  rfl

end LatticePathOrders.GeneratedMinimality_13_11

