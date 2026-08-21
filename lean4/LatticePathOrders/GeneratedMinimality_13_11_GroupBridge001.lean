import LatticePathOrders.GeneratedMinimality_13_11_Group001
import LatticePathOrders.GeneratedMinimality_13_11_FrontierAtom01

namespace LatticePathOrders.GeneratedMinimality_13_11

def groupFrontier001 : List Path :=
  partitionFrontierAtom01

theorem groupFrontier001_regions :
    groupFrontier001 = regionsGroup001.map Prod.fst := by
  unfold groupFrontier001 partitionFrontierAtom01 regionsGroup001 regionsPart016 regionsPart017 regionsPart018 regionsPart019 regionsPart020 regionsPart021 regionsPart022 regionsPart023 regionsPart024 regionsPart025 regionsPart026 regionsPart027 regionsPart028 regionsPart029 regionsPart030 regionsPart031
  rfl

end LatticePathOrders.GeneratedMinimality_13_11

