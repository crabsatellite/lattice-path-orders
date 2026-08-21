import LatticePathOrders.GeneratedMinimality_13_11_Group026
import LatticePathOrders.GeneratedMinimality_13_11_FrontierAtom38

namespace LatticePathOrders.GeneratedMinimality_13_11

def groupFrontier026 : List Path :=
  partitionFrontierAtom38

theorem groupFrontier026_regions :
    groupFrontier026 = regionsGroup026.map Prod.fst := by
  unfold groupFrontier026 partitionFrontierAtom38 regionsGroup026 regionsPart416 regionsPart417 regionsPart418 regionsPart419 regionsPart420 regionsPart421 regionsPart422 regionsPart423 regionsPart424 regionsPart425 regionsPart426 regionsPart427 regionsPart428 regionsPart429 regionsPart430 regionsPart431
  rfl

end LatticePathOrders.GeneratedMinimality_13_11

