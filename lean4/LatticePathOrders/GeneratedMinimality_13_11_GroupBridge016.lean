import LatticePathOrders.GeneratedMinimality_13_11_Group016
import LatticePathOrders.GeneratedMinimality_13_11_FrontierAtom22

namespace LatticePathOrders.GeneratedMinimality_13_11

def groupFrontier016 : List Path :=
  partitionFrontierAtom22

theorem groupFrontier016_regions :
    groupFrontier016 = regionsGroup016.map Prod.fst := by
  unfold groupFrontier016 partitionFrontierAtom22 regionsGroup016 regionsPart256 regionsPart257 regionsPart258 regionsPart259 regionsPart260 regionsPart261 regionsPart262 regionsPart263 regionsPart264 regionsPart265 regionsPart266 regionsPart267 regionsPart268 regionsPart269 regionsPart270 regionsPart271
  rfl

end LatticePathOrders.GeneratedMinimality_13_11

