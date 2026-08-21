import LatticePathOrders.GeneratedMinimality_13_11_Group003
import LatticePathOrders.GeneratedMinimality_13_11_FrontierAtom04

namespace LatticePathOrders.GeneratedMinimality_13_11

def groupFrontier003 : List Path :=
  partitionFrontierAtom04

theorem groupFrontier003_regions :
    groupFrontier003 = regionsGroup003.map Prod.fst := by
  unfold groupFrontier003 partitionFrontierAtom04 regionsGroup003 regionsPart048 regionsPart049 regionsPart050 regionsPart051 regionsPart052 regionsPart053 regionsPart054 regionsPart055 regionsPart056 regionsPart057 regionsPart058 regionsPart059 regionsPart060 regionsPart061 regionsPart062 regionsPart063
  rfl

end LatticePathOrders.GeneratedMinimality_13_11

