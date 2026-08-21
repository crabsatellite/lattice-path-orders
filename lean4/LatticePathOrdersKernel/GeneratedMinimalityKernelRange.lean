import LatticePathOrdersKernel.GeneratedMinimalityKernelRange00
import LatticePathOrdersKernel.GeneratedMinimalityKernelRange01
import LatticePathOrdersKernel.GeneratedMinimalityKernelRange02
import LatticePathOrdersKernel.GeneratedMinimalityKernelRange03
import LatticePathOrdersKernel.GeneratedMinimalityKernelRange04

namespace LatticePathOrders

theorem problem63_endpoint_mem_through_25 {a b : Nat}
    (hb : 0 < b) (hab : b < a) (hcop : Nat.Coprime a b)
    (hlen : a + b ≤ 25) : (a, b) ∈ problem63MinimalityEndpoints := by
  by_cases h5 : a ≤ 5
  · exact problem63_endpoint_mem_range_2_5 hb hab hcop hlen h5
  by_cases h10 : a ≤ 10
  · exact problem63_endpoint_mem_range_6_10 hb hab hcop hlen (by omega) h10
  by_cases h15 : a ≤ 15
  · exact problem63_endpoint_mem_range_11_15 hb hab hcop hlen (by omega) h15
  by_cases h20 : a ≤ 20
  · exact problem63_endpoint_mem_range_16_20 hb hab hcop hlen (by omega) h20
  · exact problem63_endpoint_mem_range_21_25 hb hab hcop hlen (by omega) (by omega)

end LatticePathOrders
