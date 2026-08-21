import LatticePathOrdersKernel.Matching54Certificate
import LatticePathOrdersKernel.Matching1312Certificate
import LatticePathOrdersKernel.MatchingBridge

/-!
# Exact nontrivial cover certificates for the matching order
-/

namespace LatticePathOrdersKernel

open LatticePathOrders

theorem matching54_source_certificate_valid :
    ValidCoverCertificate (Carrier 5 4) sourceMatchingNumber
      (sourceMatchingNumber matching54Lower)
      (sourceMatchingNumber matching54Upper)
      matching54JsonCertificate :=
  validCoverCertificate_matchingScore_iff_source.mp
    matching54_json_certificate_valid

theorem matching54_source_cover :
    PullbackCover (Carrier 5 4) sourceMatchingNumber
      matching54Lower matching54Upper :=
  pullbackCover_matchingScore_iff_source.mp matching54_matrix_cover

theorem matching1312_source_certificate_valid :
    ValidCoverCertificate (Carrier 13 12) sourceMatchingNumber
      (sourceMatchingNumber matching1312Lower)
      (sourceMatchingNumber matching1312Upper)
      matching1312JsonCertificate :=
  validCoverCertificate_matchingScore_iff_source.mp
    matching1312_json_certificate_valid

theorem matching1312_source_cover :
    PullbackCover (Carrier 13 12) sourceMatchingNumber
      matching1312Lower matching1312Upper :=
  pullbackCover_matchingScore_iff_source.mp matching1312_matrix_cover

end LatticePathOrdersKernel
