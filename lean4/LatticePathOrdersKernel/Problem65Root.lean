import LatticePathOrders.CarrierEnumeration
import LatticePathOrders.LevelCharacterization
import LatticePathOrdersKernel.LagrangeBridge
import LatticePathOrdersKernel.MatchingBridge

/-!
# Kernel-only characterization of cover relations (Problem 6.5)

For either scalar order, a cover is equivalent to a finite, exact lattice-path
certificate.  Equivalently, its two values are consecutive realized levels;
all paths in the two fibers form a complete bipartite cover block.
-/

namespace LatticePathOrdersKernel

open LatticePathOrders

theorem problem65_constructive
    {alpha : Type*} [LinearOrder alpha] {a b : Nat}
    {score : Path → alpha} {x y : Path}
    (hx : Carrier a b x) (hy : Carrier a b y) (hxy : score x < score y) :
    PullbackCover (Carrier a b) score x y ↔
      ∃ cert, ValidCoverCertificate (Carrier a b) score
        (score x) (score y) cert :=
  carrier_pullbackCover_iff_exists_certificate hx hy hxy

theorem problem65_level_characterization
    {alpha : Type*} [LinearOrder alpha] {a b : Nat}
    {score : Path → alpha} {x y : Path}
    (hx : Carrier a b x) (hy : Carrier a b y) :
    PullbackCover (Carrier a b) score x y ↔
      ConsecutiveRealizedLevels (Carrier a b) score (score x) (score y) :=
  pullbackCover_iff_consecutive_levels hx hy

theorem problem65_lagrange_constructive
    {a b : Nat} {x y : Path}
    (hx : Carrier a b x) (hy : Carrier a b y)
    (hxy : sourceLagrangeValue x < sourceLagrangeValue y) :
    PullbackCover (Carrier a b) sourceLagrangeValue x y ↔
      ∃ cert, ValidCoverCertificate (Carrier a b) sourceLagrangeValue
        (sourceLagrangeValue x) (sourceLagrangeValue y) cert :=
  problem65_constructive hx hy hxy

theorem problem65_lagrange_levels
    {a b : Nat} {x y : Path}
    (hx : Carrier a b x) (hy : Carrier a b y) :
    PullbackCover (Carrier a b) sourceLagrangeValue x y ↔
      ConsecutiveRealizedLevels (Carrier a b) sourceLagrangeValue
        (sourceLagrangeValue x) (sourceLagrangeValue y) :=
  problem65_level_characterization hx hy

theorem problem65_matching_constructive
    {a b : Nat} {x y : Path}
    (hx : Carrier a b x) (hy : Carrier a b y)
    (hxy : sourceMatchingNumber x < sourceMatchingNumber y) :
    PullbackCover (Carrier a b) sourceMatchingNumber x y ↔
      ∃ cert, ValidCoverCertificate (Carrier a b) sourceMatchingNumber
        (sourceMatchingNumber x) (sourceMatchingNumber y) cert :=
  problem65_constructive hx hy hxy

theorem problem65_matching_levels
    {a b : Nat} {x y : Path}
    (hx : Carrier a b x) (hy : Carrier a b y) :
    PullbackCover (Carrier a b) sourceMatchingNumber x y ↔
      ConsecutiveRealizedLevels (Carrier a b) sourceMatchingNumber
        (sourceMatchingNumber x) (sourceMatchingNumber y) :=
  problem65_level_characterization hx hy

end LatticePathOrdersKernel
