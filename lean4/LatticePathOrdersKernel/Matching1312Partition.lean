import LatticePathOrdersKernel.Matching1312Data

namespace LatticePathOrdersKernel
open LatticePathOrders
set_option maxRecDepth 100000

theorem matching1312_partition :
    partitionCheck 13 12 matching1312Frontier (25 - 1) [Step.R] = true := by
  decide

end LatticePathOrdersKernel
