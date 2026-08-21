import LatticePathOrdersKernel.Matching1312Bounds
import LatticePathOrdersKernel.Matching1312Endpoints
import LatticePathOrdersKernel.Matching1312Partition
import LatticePathOrdersKernel.Matching1312Nonempty
import LatticePathOrdersKernel.Matching1312Outside

namespace LatticePathOrdersKernel
open LatticePathOrders

theorem matching1312_json_certificate_valid :
    ValidCoverCertificate (Carrier 13 12) matchingScore
      (matchingScore matching1312Lower) (matchingScore matching1312Upper)
      matching1312JsonCertificate := by
  rw [matching1312_json_bounds_exact]
  exact validMatchingCertificate (a := 13) (b := 12) (by decide)
    matching1312_partition matching1312_nonempty matching1312_outside

theorem matching1312_matrix_cover :
    PullbackCover (Carrier 13 12) matchingScore
      matching1312Lower matching1312Upper := by
  apply matchingCover_from_certificate (a := 13) (b := 12) (by decide)
    matching1312_endpoint_data.1 matching1312_endpoint_data.2.1 (by decide)
    matching1312_partition matching1312_nonempty matching1312_outside

end LatticePathOrdersKernel
