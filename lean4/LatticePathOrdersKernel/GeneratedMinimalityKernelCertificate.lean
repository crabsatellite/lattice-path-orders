import LatticePathOrdersKernel.GeneratedMinimalityKernelRange

namespace LatticePathOrders

theorem problem63_minimal_through_25 {a b : Nat}
    (hb : 0 < b) (hab : b < a) (hcop : Nat.Coprime a b)
    (hlen : a + b ≤ 25) : Problem63HoldsAt a b :=
  problem63HoldsAt_of_mem
    (problem63_endpoint_mem_through_25 hb hab hcop hlen)

end LatticePathOrders

