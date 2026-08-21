import LatticePathOrders.GeneratedMinimality_13_11_Group006
import LatticePathOrders.GeneratedMinimality_13_11_FrontierAtom08

namespace LatticePathOrders.GeneratedMinimality_13_11

def groupFrontier006 : List Path :=
  partitionFrontierAtom08

theorem groupFrontier006_regions :
    groupFrontier006 = regionsGroup006.map Prod.fst := by
  unfold groupFrontier006 partitionFrontierAtom08 regionsGroup006 regionsPart096 regionsPart097 regionsPart098 regionsPart099 regionsPart100 regionsPart101 regionsPart102 regionsPart103 regionsPart104 regionsPart105 regionsPart106 regionsPart107 regionsPart108 regionsPart109 regionsPart110 regionsPart111
  rfl

end LatticePathOrders.GeneratedMinimality_13_11

