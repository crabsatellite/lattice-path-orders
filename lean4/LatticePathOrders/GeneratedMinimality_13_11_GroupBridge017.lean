import LatticePathOrders.GeneratedMinimality_13_11_Group017
import LatticePathOrders.GeneratedMinimality_13_11_FrontierAtom23
import LatticePathOrders.GeneratedMinimality_13_11_FrontierAtom24
import LatticePathOrders.GeneratedMinimality_13_11_FrontierAtom25

namespace LatticePathOrders.GeneratedMinimality_13_11

def groupFrontier017 : List Path :=
  partitionFrontierAtom23 ++
    partitionFrontierAtom24 ++
    partitionFrontierAtom25

theorem groupFrontier017_regions :
    groupFrontier017 = regionsGroup017.map Prod.fst := by
  unfold groupFrontier017 partitionFrontierAtom23 partitionFrontierAtom24 partitionFrontierAtom25 regionsGroup017 regionsPart272 regionsPart273 regionsPart274 regionsPart275 regionsPart276 regionsPart277 regionsPart278 regionsPart279 regionsPart280 regionsPart281 regionsPart282 regionsPart283 regionsPart284 regionsPart285 regionsPart286 regionsPart287
  rfl

end LatticePathOrders.GeneratedMinimality_13_11

