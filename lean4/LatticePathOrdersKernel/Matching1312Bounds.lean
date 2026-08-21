import LatticePathOrdersKernel.Matching1312Data

namespace LatticePathOrdersKernel
open LatticePathOrders
set_option maxRecDepth 100000

theorem matching1312_json_bounds_exact :
    matching1312JsonCertificate = matchingCertificate 25 matching1312Frontier := by
  decide

end LatticePathOrdersKernel
