import LatticePathOrders.GeneratedMinimality_13_11_Group018
import LatticePathOrders.GeneratedMinimality_13_11_FrontierAtom26

namespace LatticePathOrders.GeneratedMinimality_13_11

def groupFrontier018 : List Path :=
  partitionFrontierAtom26

theorem groupFrontier018_regions :
    groupFrontier018 = regionsGroup018.map Prod.fst := by
  unfold groupFrontier018 partitionFrontierAtom26 regionsGroup018 regionsPart288 regionsPart289 regionsPart290 regionsPart291 regionsPart292 regionsPart293 regionsPart294 regionsPart295 regionsPart296 regionsPart297 regionsPart298 regionsPart299 regionsPart300 regionsPart301 regionsPart302 regionsPart303
  rfl

end LatticePathOrders.GeneratedMinimality_13_11

