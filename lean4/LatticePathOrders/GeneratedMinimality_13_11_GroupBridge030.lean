import LatticePathOrders.GeneratedMinimality_13_11_Group030
import LatticePathOrders.GeneratedMinimality_13_11_FrontierAtom44

namespace LatticePathOrders.GeneratedMinimality_13_11

def groupFrontier030 : List Path :=
  partitionFrontierAtom44

theorem groupFrontier030_regions :
    groupFrontier030 = regionsGroup030.map Prod.fst := by
  unfold groupFrontier030 partitionFrontierAtom44 regionsGroup030 regionsPart480 regionsPart481 regionsPart482 regionsPart483 regionsPart484 regionsPart485 regionsPart486 regionsPart487 regionsPart488 regionsPart489 regionsPart490 regionsPart491 regionsPart492 regionsPart493 regionsPart494 regionsPart495
  rfl

end LatticePathOrders.GeneratedMinimality_13_11

