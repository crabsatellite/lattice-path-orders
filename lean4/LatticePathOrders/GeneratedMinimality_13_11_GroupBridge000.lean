import LatticePathOrders.GeneratedMinimality_13_11_Group000
import LatticePathOrders.GeneratedMinimality_13_11_FrontierAtom00

namespace LatticePathOrders.GeneratedMinimality_13_11

def groupFrontier000 : List Path :=
  partitionFrontierAtom00

theorem groupFrontier000_regions :
    groupFrontier000 = regionsGroup000.map Prod.fst := by
  unfold groupFrontier000 partitionFrontierAtom00 regionsGroup000 regionsPart000 regionsPart001 regionsPart002 regionsPart003 regionsPart004 regionsPart005 regionsPart006 regionsPart007 regionsPart008 regionsPart009 regionsPart010 regionsPart011 regionsPart012 regionsPart013 regionsPart014 regionsPart015
  rfl

end LatticePathOrders.GeneratedMinimality_13_11

