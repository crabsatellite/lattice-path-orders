import LatticePathOrders.GeneratedMinimality_13_11_Group002
import LatticePathOrders.GeneratedMinimality_13_11_FrontierAtom02
import LatticePathOrders.GeneratedMinimality_13_11_FrontierAtom03

namespace LatticePathOrders.GeneratedMinimality_13_11

def groupFrontier002 : List Path :=
  partitionFrontierAtom02 ++
    partitionFrontierAtom03

theorem groupFrontier002_regions :
    groupFrontier002 = regionsGroup002.map Prod.fst := by
  unfold groupFrontier002 partitionFrontierAtom02 partitionFrontierAtom03 regionsGroup002 regionsPart032 regionsPart033 regionsPart034 regionsPart035 regionsPart036 regionsPart037 regionsPart038 regionsPart039 regionsPart040 regionsPart041 regionsPart042 regionsPart043 regionsPart044 regionsPart045 regionsPart046 regionsPart047
  rfl

end LatticePathOrders.GeneratedMinimality_13_11

