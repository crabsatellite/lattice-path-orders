import LatticePathOrdersKernel.Lagrange54Certificate
import LatticePathOrdersKernel.LagrangeOrderBridge
import LatticePathOrdersKernel.Problem65Root

/-!
# Exact nontrivial cover for the Lagrange order
-/

namespace LatticePathOrdersKernel

open LatticePathOrders

theorem lagrange54_source_cover :
    PullbackCover (Carrier 5 4) sourceLagrangeValue
      lagrange54Lower lagrange54Upper :=
  (pullbackCover_lagrangeSq_iff_source (by decide) (by decide)).mp
    lagrange54_matrix_cover

theorem lagrange54_source_certificate_exists :
    ∃ cert, ValidCoverCertificate (Carrier 5 4) sourceLagrangeValue
      (sourceLagrangeValue lagrange54Lower)
      (sourceLagrangeValue lagrange54Upper) cert :=
  (problem65_lagrange_constructive
    lagrange54_source_cover.1 lagrange54_source_cover.2.1
    lagrange54_source_cover.2.2.1).mp lagrange54_source_cover

end LatticePathOrdersKernel
