import LatticePathOrders.GeneratedMinimality_13_11_Group014
import LatticePathOrders.GeneratedMinimality_13_11_FrontierAtom19
import LatticePathOrders.GeneratedMinimality_13_11_FrontierAtom20

namespace LatticePathOrders.GeneratedMinimality_13_11

def groupFrontier014 : List Path :=
  partitionFrontierAtom19 ++
    partitionFrontierAtom20

theorem groupFrontier014_regions :
    groupFrontier014 = regionsGroup014.map Prod.fst := by
  unfold groupFrontier014 partitionFrontierAtom19 partitionFrontierAtom20 regionsGroup014 regionsPart224 regionsPart225 regionsPart226 regionsPart227 regionsPart228 regionsPart229 regionsPart230 regionsPart231 regionsPart232 regionsPart233 regionsPart234 regionsPart235 regionsPart236 regionsPart237 regionsPart238 regionsPart239
  rfl

end LatticePathOrders.GeneratedMinimality_13_11

