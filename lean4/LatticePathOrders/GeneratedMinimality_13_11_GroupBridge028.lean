import LatticePathOrders.GeneratedMinimality_13_11_Group028
import LatticePathOrders.GeneratedMinimality_13_11_FrontierAtom41
import LatticePathOrders.GeneratedMinimality_13_11_FrontierAtom42

namespace LatticePathOrders.GeneratedMinimality_13_11

def groupFrontier028 : List Path :=
  partitionFrontierAtom41 ++
    partitionFrontierAtom42

theorem groupFrontier028_regions :
    groupFrontier028 = regionsGroup028.map Prod.fst := by
  unfold groupFrontier028 partitionFrontierAtom41 partitionFrontierAtom42 regionsGroup028 regionsPart448 regionsPart449 regionsPart450 regionsPart451 regionsPart452 regionsPart453 regionsPart454 regionsPart455 regionsPart456 regionsPart457 regionsPart458 regionsPart459 regionsPart460 regionsPart461 regionsPart462 regionsPart463
  rfl

end LatticePathOrders.GeneratedMinimality_13_11

