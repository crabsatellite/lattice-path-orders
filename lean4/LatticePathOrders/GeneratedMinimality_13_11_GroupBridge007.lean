import LatticePathOrders.GeneratedMinimality_13_11_Group007
import LatticePathOrders.GeneratedMinimality_13_11_FrontierAtom09
import LatticePathOrders.GeneratedMinimality_13_11_FrontierAtom10

namespace LatticePathOrders.GeneratedMinimality_13_11

def groupFrontier007 : List Path :=
  partitionFrontierAtom09 ++
    partitionFrontierAtom10

theorem groupFrontier007_regions :
    groupFrontier007 = regionsGroup007.map Prod.fst := by
  unfold groupFrontier007 partitionFrontierAtom09 partitionFrontierAtom10 regionsGroup007 regionsPart112 regionsPart113 regionsPart114 regionsPart115 regionsPart116 regionsPart117 regionsPart118 regionsPart119 regionsPart120 regionsPart121 regionsPart122 regionsPart123 regionsPart124 regionsPart125 regionsPart126 regionsPart127
  rfl

end LatticePathOrders.GeneratedMinimality_13_11

