import LatticePathOrdersKernel.GeneratedMinimalityKernelEndpoints

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders

theorem problem63_endpoint_mem_range_16_20 {a b : Nat}
    (hb : 0 < b) (hab : b < a) (hcop : Nat.Coprime a b)
    (hlen : a + b ≤ 25)
    (haLo : 16 ≤ a) (haHi : a ≤ 20) : (a, b) ∈ problem63MinimalityEndpoints := by
  have hbHi : b ≤ 20 := by omega
  interval_cases a <;> interval_cases b <;>
    norm_num [problem63MinimalityEndpoints,
      problem63MinimalityEndpointsChunk00,
      problem63MinimalityEndpointsChunk01,
      problem63MinimalityEndpointsChunk02,
      problem63MinimalityEndpointsChunk03,
      problem63MinimalityEndpointsChunk04, Nat.Coprime] at *

end LatticePathOrders
