import LatticePathOrders.GeneratedMinimality_13_11_Group024
import LatticePathOrders.GeneratedMinimality_13_11_FrontierAtom34
import LatticePathOrders.GeneratedMinimality_13_11_FrontierAtom35

namespace LatticePathOrders.GeneratedMinimality_13_11

def groupFrontier024 : List Path :=
  partitionFrontierAtom34 ++
    partitionFrontierAtom35

theorem groupFrontier024_regions :
    groupFrontier024 = regionsGroup024.map Prod.fst := by
  unfold groupFrontier024 partitionFrontierAtom34 partitionFrontierAtom35 regionsGroup024 regionsPart384 regionsPart385 regionsPart386 regionsPart387 regionsPart388 regionsPart389 regionsPart390 regionsPart391 regionsPart392 regionsPart393 regionsPart394 regionsPart395 regionsPart396 regionsPart397 regionsPart398 regionsPart399
  rfl

end LatticePathOrders.GeneratedMinimality_13_11

