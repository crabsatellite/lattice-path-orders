import LatticePathOrders.GeneratedMinimality_13_11_Group004
import LatticePathOrders.GeneratedMinimality_13_11_FrontierAtom05

namespace LatticePathOrders.GeneratedMinimality_13_11

def groupFrontier004 : List Path :=
  partitionFrontierAtom05

theorem groupFrontier004_regions :
    groupFrontier004 = regionsGroup004.map Prod.fst := by
  unfold groupFrontier004 partitionFrontierAtom05 regionsGroup004 regionsPart064 regionsPart065 regionsPart066 regionsPart067 regionsPart068 regionsPart069 regionsPart070 regionsPart071 regionsPart072 regionsPart073 regionsPart074 regionsPart075 regionsPart076 regionsPart077 regionsPart078 regionsPart079
  rfl

end LatticePathOrders.GeneratedMinimality_13_11

