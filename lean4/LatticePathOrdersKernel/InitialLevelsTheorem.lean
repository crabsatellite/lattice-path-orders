import LatticePathOrdersKernel.InitialLevelCertificate

/-! # Complete initial-level theorem -/

namespace LatticePathOrdersKernel

open LatticePathOrders

structure NonlocalTheoremCertificate (n : Nat) : Prop where
  matching_cover : PullbackCover (Carrier n (n - 1)) sourceMatchingNumber
    (nonlocalX n) (nonlocalY n)
  hamming_distance : hammingDistance (nonlocalX n) (nonlocalY n) = 2 * n - 6
  first_n_singleton_levels : InitialMatchingLevelsCertificate n

/-- Complete kernel-only rendering of manuscript Theorem `thm:nonlocal`:
cover, unbounded Hamming distance, and the exact first `n` singleton levels. -/
theorem manuscript_thm_nonlocal {n : Nat} (hn : 4 ≤ n) :
    NonlocalTheoremCertificate n :=
  ⟨nonlocal_matching_cover hn, nonlocal_hamming_distance hn,
    initial_matching_levels_certificate hn⟩

end LatticePathOrdersKernel
