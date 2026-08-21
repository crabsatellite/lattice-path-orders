import LatticePathOrders.GeneratedMinimality_13_11_Group015
import LatticePathOrders.GeneratedMinimality_13_11_FrontierAtom21

namespace LatticePathOrders.GeneratedMinimality_13_11

def groupFrontier015 : List Path :=
  partitionFrontierAtom21

theorem groupFrontier015_regions :
    groupFrontier015 = regionsGroup015.map Prod.fst := by
  unfold groupFrontier015 partitionFrontierAtom21 regionsGroup015 regionsPart240 regionsPart241 regionsPart242 regionsPart243 regionsPart244 regionsPart245 regionsPart246 regionsPart247 regionsPart248 regionsPart249 regionsPart250 regionsPart251 regionsPart252 regionsPart253 regionsPart254 regionsPart255
  rfl

end LatticePathOrders.GeneratedMinimality_13_11

