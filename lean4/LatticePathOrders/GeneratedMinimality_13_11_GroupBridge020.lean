import LatticePathOrders.GeneratedMinimality_13_11_Group020
import LatticePathOrders.GeneratedMinimality_13_11_FrontierAtom28
import LatticePathOrders.GeneratedMinimality_13_11_FrontierAtom29

namespace LatticePathOrders.GeneratedMinimality_13_11

def groupFrontier020 : List Path :=
  partitionFrontierAtom28 ++
    partitionFrontierAtom29

theorem groupFrontier020_regions :
    groupFrontier020 = regionsGroup020.map Prod.fst := by
  unfold groupFrontier020 partitionFrontierAtom28 partitionFrontierAtom29 regionsGroup020 regionsPart320 regionsPart321 regionsPart322 regionsPart323 regionsPart324 regionsPart325 regionsPart326 regionsPart327 regionsPart328 regionsPart329 regionsPart330 regionsPart331 regionsPart332 regionsPart333 regionsPart334 regionsPart335
  rfl

end LatticePathOrders.GeneratedMinimality_13_11

