import LatticePathOrders.GeneratedMinimality_13_11_Group010
import LatticePathOrders.GeneratedMinimality_13_11_FrontierAtom13
import LatticePathOrders.GeneratedMinimality_13_11_FrontierAtom14

namespace LatticePathOrders.GeneratedMinimality_13_11

def groupFrontier010 : List Path :=
  partitionFrontierAtom13 ++
    partitionFrontierAtom14

theorem groupFrontier010_regions :
    groupFrontier010 = regionsGroup010.map Prod.fst := by
  unfold groupFrontier010 partitionFrontierAtom13 partitionFrontierAtom14 regionsGroup010 regionsPart160 regionsPart161 regionsPart162 regionsPart163 regionsPart164 regionsPart165 regionsPart166 regionsPart167 regionsPart168 regionsPart169 regionsPart170 regionsPart171 regionsPart172 regionsPart173 regionsPart174 regionsPart175
  rfl

end LatticePathOrders.GeneratedMinimality_13_11

