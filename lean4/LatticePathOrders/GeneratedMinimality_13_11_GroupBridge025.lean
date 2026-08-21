import LatticePathOrders.GeneratedMinimality_13_11_Group025
import LatticePathOrders.GeneratedMinimality_13_11_FrontierAtom36
import LatticePathOrders.GeneratedMinimality_13_11_FrontierAtom37

namespace LatticePathOrders.GeneratedMinimality_13_11

def groupFrontier025 : List Path :=
  partitionFrontierAtom36 ++
    partitionFrontierAtom37

theorem groupFrontier025_regions :
    groupFrontier025 = regionsGroup025.map Prod.fst := by
  unfold groupFrontier025 partitionFrontierAtom36 partitionFrontierAtom37 regionsGroup025 regionsPart400 regionsPart401 regionsPart402 regionsPart403 regionsPart404 regionsPart405 regionsPart406 regionsPart407 regionsPart408 regionsPart409 regionsPart410 regionsPart411 regionsPart412 regionsPart413 regionsPart414 regionsPart415
  rfl

end LatticePathOrders.GeneratedMinimality_13_11

