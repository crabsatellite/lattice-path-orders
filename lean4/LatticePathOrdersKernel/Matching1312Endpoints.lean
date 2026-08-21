import LatticePathOrdersKernel.Matching1312Data

namespace LatticePathOrdersKernel
open LatticePathOrders
set_option maxRecDepth 100000

theorem matching1312_endpoint_data :
    Carrier 13 12 matching1312Lower ∧ Carrier 13 12 matching1312Upper ∧
      matchingScore matching1312Lower = 1404960479 ∧
      matchingScore matching1312Upper = 1468467359 := by
  decide

end LatticePathOrdersKernel
