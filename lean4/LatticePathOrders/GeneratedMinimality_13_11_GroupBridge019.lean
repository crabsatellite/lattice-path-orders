import LatticePathOrders.GeneratedMinimality_13_11_Group019
import LatticePathOrders.GeneratedMinimality_13_11_FrontierAtom27

namespace LatticePathOrders.GeneratedMinimality_13_11

def groupFrontier019 : List Path :=
  partitionFrontierAtom27

theorem groupFrontier019_regions :
    groupFrontier019 = regionsGroup019.map Prod.fst := by
  unfold groupFrontier019 partitionFrontierAtom27 regionsGroup019 regionsPart304 regionsPart305 regionsPart306 regionsPart307 regionsPart308 regionsPart309 regionsPart310 regionsPart311 regionsPart312 regionsPart313 regionsPart314 regionsPart315 regionsPart316 regionsPart317 regionsPart318 regionsPart319
  rfl

end LatticePathOrders.GeneratedMinimality_13_11

