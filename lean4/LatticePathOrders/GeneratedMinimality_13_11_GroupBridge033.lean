import LatticePathOrders.GeneratedMinimality_13_11_Group033
import LatticePathOrders.GeneratedMinimality_13_11_FrontierAtom48
import LatticePathOrders.GeneratedMinimality_13_11_FrontierAtom49

namespace LatticePathOrders.GeneratedMinimality_13_11

def groupFrontier033 : List Path :=
  partitionFrontierAtom48 ++
    partitionFrontierAtom49

theorem groupFrontier033_regions :
    groupFrontier033 = regionsGroup033.map Prod.fst := by
  unfold groupFrontier033 partitionFrontierAtom48 partitionFrontierAtom49 regionsGroup033 regionsPart528 regionsPart529 regionsPart530 regionsPart531 regionsPart532 regionsPart533 regionsPart534 regionsPart535 regionsPart536 regionsPart537 regionsPart538 regionsPart539 regionsPart540 regionsPart541 regionsPart542 regionsPart543
  rfl

end LatticePathOrders.GeneratedMinimality_13_11

