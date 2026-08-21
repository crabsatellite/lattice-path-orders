import LatticePathOrders.GeneratedMinimality_13_11_Group011
import LatticePathOrders.GeneratedMinimality_13_11_FrontierAtom15

namespace LatticePathOrders.GeneratedMinimality_13_11

def groupFrontier011 : List Path :=
  partitionFrontierAtom15

theorem groupFrontier011_regions :
    groupFrontier011 = regionsGroup011.map Prod.fst := by
  unfold groupFrontier011 partitionFrontierAtom15 regionsGroup011 regionsPart176 regionsPart177 regionsPart178 regionsPart179 regionsPart180 regionsPart181 regionsPart182 regionsPart183 regionsPart184 regionsPart185 regionsPart186 regionsPart187 regionsPart188 regionsPart189 regionsPart190 regionsPart191
  rfl

end LatticePathOrders.GeneratedMinimality_13_11

