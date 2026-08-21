import LatticePathOrders.GeneratedMinimality_13_11_Group021
import LatticePathOrders.GeneratedMinimality_13_11_FrontierAtom30

namespace LatticePathOrders.GeneratedMinimality_13_11

def groupFrontier021 : List Path :=
  partitionFrontierAtom30

theorem groupFrontier021_regions :
    groupFrontier021 = regionsGroup021.map Prod.fst := by
  unfold groupFrontier021 partitionFrontierAtom30 regionsGroup021 regionsPart336 regionsPart337 regionsPart338 regionsPart339 regionsPart340 regionsPart341 regionsPart342 regionsPart343 regionsPart344 regionsPart345 regionsPart346 regionsPart347 regionsPart348 regionsPart349 regionsPart350 regionsPart351
  rfl

end LatticePathOrders.GeneratedMinimality_13_11

