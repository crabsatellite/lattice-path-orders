import LatticePathOrders.GeneratedMinimality_13_11_Group023
import LatticePathOrders.GeneratedMinimality_13_11_FrontierAtom33

namespace LatticePathOrders.GeneratedMinimality_13_11

def groupFrontier023 : List Path :=
  partitionFrontierAtom33

theorem groupFrontier023_regions :
    groupFrontier023 = regionsGroup023.map Prod.fst := by
  unfold groupFrontier023 partitionFrontierAtom33 regionsGroup023 regionsPart368 regionsPart369 regionsPart370 regionsPart371 regionsPart372 regionsPart373 regionsPart374 regionsPart375 regionsPart376 regionsPart377 regionsPart378 regionsPart379 regionsPart380 regionsPart381 regionsPart382 regionsPart383
  rfl

end LatticePathOrders.GeneratedMinimality_13_11

