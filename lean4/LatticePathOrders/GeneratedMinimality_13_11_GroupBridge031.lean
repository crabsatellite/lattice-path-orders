import LatticePathOrders.GeneratedMinimality_13_11_Group031
import LatticePathOrders.GeneratedMinimality_13_11_FrontierAtom45
import LatticePathOrders.GeneratedMinimality_13_11_FrontierAtom46

namespace LatticePathOrders.GeneratedMinimality_13_11

def groupFrontier031 : List Path :=
  partitionFrontierAtom45 ++
    partitionFrontierAtom46

theorem groupFrontier031_regions :
    groupFrontier031 = regionsGroup031.map Prod.fst := by
  unfold groupFrontier031 partitionFrontierAtom45 partitionFrontierAtom46 regionsGroup031 regionsPart496 regionsPart497 regionsPart498 regionsPart499 regionsPart500 regionsPart501 regionsPart502 regionsPart503 regionsPart504 regionsPart505 regionsPart506 regionsPart507 regionsPart508 regionsPart509 regionsPart510 regionsPart511
  rfl

end LatticePathOrders.GeneratedMinimality_13_11

