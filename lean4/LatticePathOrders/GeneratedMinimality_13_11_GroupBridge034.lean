import LatticePathOrders.GeneratedMinimality_13_11_Group034
import LatticePathOrders.GeneratedMinimality_13_11_FrontierAtom50

namespace LatticePathOrders.GeneratedMinimality_13_11

def groupFrontier034 : List Path :=
  partitionFrontierAtom50

theorem groupFrontier034_regions :
    groupFrontier034 = regionsGroup034.map Prod.fst := by
  unfold groupFrontier034 partitionFrontierAtom50 regionsGroup034 regionsPart544 regionsPart545 regionsPart546 regionsPart547 regionsPart548 regionsPart549 regionsPart550 regionsPart551 regionsPart552 regionsPart553 regionsPart554 regionsPart555 regionsPart556 regionsPart557 regionsPart558 regionsPart559
  rfl

end LatticePathOrders.GeneratedMinimality_13_11

