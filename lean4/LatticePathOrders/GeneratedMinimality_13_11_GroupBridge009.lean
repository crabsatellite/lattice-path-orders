import LatticePathOrders.GeneratedMinimality_13_11_Group009
import LatticePathOrders.GeneratedMinimality_13_11_FrontierAtom12

namespace LatticePathOrders.GeneratedMinimality_13_11

def groupFrontier009 : List Path :=
  partitionFrontierAtom12

theorem groupFrontier009_regions :
    groupFrontier009 = regionsGroup009.map Prod.fst := by
  unfold groupFrontier009 partitionFrontierAtom12 regionsGroup009 regionsPart144 regionsPart145 regionsPart146 regionsPart147 regionsPart148 regionsPart149 regionsPart150 regionsPart151 regionsPart152 regionsPart153 regionsPart154 regionsPart155 regionsPart156 regionsPart157 regionsPart158 regionsPart159
  rfl

end LatticePathOrders.GeneratedMinimality_13_11

