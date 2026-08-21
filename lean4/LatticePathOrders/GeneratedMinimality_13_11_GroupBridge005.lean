import LatticePathOrders.GeneratedMinimality_13_11_Group005
import LatticePathOrders.GeneratedMinimality_13_11_FrontierAtom06
import LatticePathOrders.GeneratedMinimality_13_11_FrontierAtom07

namespace LatticePathOrders.GeneratedMinimality_13_11

def groupFrontier005 : List Path :=
  partitionFrontierAtom06 ++
    partitionFrontierAtom07

theorem groupFrontier005_regions :
    groupFrontier005 = regionsGroup005.map Prod.fst := by
  unfold groupFrontier005 partitionFrontierAtom06 partitionFrontierAtom07 regionsGroup005 regionsPart080 regionsPart081 regionsPart082 regionsPart083 regionsPart084 regionsPart085 regionsPart086 regionsPart087 regionsPart088 regionsPart089 regionsPart090 regionsPart091 regionsPart092 regionsPart093 regionsPart094 regionsPart095
  rfl

end LatticePathOrders.GeneratedMinimality_13_11

