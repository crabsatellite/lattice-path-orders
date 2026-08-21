import LatticePathOrders.GeneratedMinimality_13_11_Group013
import LatticePathOrders.GeneratedMinimality_13_11_FrontierAtom18

namespace LatticePathOrders.GeneratedMinimality_13_11

def groupFrontier013 : List Path :=
  partitionFrontierAtom18

theorem groupFrontier013_regions :
    groupFrontier013 = regionsGroup013.map Prod.fst := by
  unfold groupFrontier013 partitionFrontierAtom18 regionsGroup013 regionsPart208 regionsPart209 regionsPart210 regionsPart211 regionsPart212 regionsPart213 regionsPart214 regionsPart215 regionsPart216 regionsPart217 regionsPart218 regionsPart219 regionsPart220 regionsPart221 regionsPart222 regionsPart223
  rfl

end LatticePathOrders.GeneratedMinimality_13_11

