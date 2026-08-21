import LatticePathOrders.GeneratedMinimality_13_11_Group032
import LatticePathOrders.GeneratedMinimality_13_11_FrontierAtom47

namespace LatticePathOrders.GeneratedMinimality_13_11

def groupFrontier032 : List Path :=
  partitionFrontierAtom47

theorem groupFrontier032_regions :
    groupFrontier032 = regionsGroup032.map Prod.fst := by
  unfold groupFrontier032 partitionFrontierAtom47 regionsGroup032 regionsPart512 regionsPart513 regionsPart514 regionsPart515 regionsPart516 regionsPart517 regionsPart518 regionsPart519 regionsPart520 regionsPart521 regionsPart522 regionsPart523 regionsPart524 regionsPart525 regionsPart526 regionsPart527
  rfl

end LatticePathOrders.GeneratedMinimality_13_11

