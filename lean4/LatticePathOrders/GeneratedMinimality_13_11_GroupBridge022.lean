import LatticePathOrders.GeneratedMinimality_13_11_Group022
import LatticePathOrders.GeneratedMinimality_13_11_FrontierAtom31
import LatticePathOrders.GeneratedMinimality_13_11_FrontierAtom32

namespace LatticePathOrders.GeneratedMinimality_13_11

def groupFrontier022 : List Path :=
  partitionFrontierAtom31 ++
    partitionFrontierAtom32

theorem groupFrontier022_regions :
    groupFrontier022 = regionsGroup022.map Prod.fst := by
  unfold groupFrontier022 partitionFrontierAtom31 partitionFrontierAtom32 regionsGroup022 regionsPart352 regionsPart353 regionsPart354 regionsPart355 regionsPart356 regionsPart357 regionsPart358 regionsPart359 regionsPart360 regionsPart361 regionsPart362 regionsPart363 regionsPart364 regionsPart365 regionsPart366 regionsPart367
  rfl

end LatticePathOrders.GeneratedMinimality_13_11

