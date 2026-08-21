import LatticePathOrders.GeneratedMinimality_13_11_Group027
import LatticePathOrders.GeneratedMinimality_13_11_FrontierAtom39
import LatticePathOrders.GeneratedMinimality_13_11_FrontierAtom40

namespace LatticePathOrders.GeneratedMinimality_13_11

def groupFrontier027 : List Path :=
  partitionFrontierAtom39 ++
    partitionFrontierAtom40

theorem groupFrontier027_regions :
    groupFrontier027 = regionsGroup027.map Prod.fst := by
  unfold groupFrontier027 partitionFrontierAtom39 partitionFrontierAtom40 regionsGroup027 regionsPart432 regionsPart433 regionsPart434 regionsPart435 regionsPart436 regionsPart437 regionsPart438 regionsPart439 regionsPart440 regionsPart441 regionsPart442 regionsPart443 regionsPart444 regionsPart445 regionsPart446 regionsPart447
  rfl

end LatticePathOrders.GeneratedMinimality_13_11

