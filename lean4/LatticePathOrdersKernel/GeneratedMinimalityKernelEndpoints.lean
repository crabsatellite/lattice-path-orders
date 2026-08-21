import LatticePathOrdersKernel.GeneratedMinimalityKernelChunk00
import LatticePathOrdersKernel.GeneratedMinimalityKernelChunk01
import LatticePathOrdersKernel.GeneratedMinimalityKernelChunk02
import LatticePathOrdersKernel.GeneratedMinimalityKernelChunk03
import LatticePathOrdersKernel.GeneratedMinimalityKernelChunk04

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders

def problem63MinimalityEndpoints : List (Nat × Nat) :=
  problem63MinimalityEndpointsChunk00 ++
    (problem63MinimalityEndpointsChunk01 ++
      (problem63MinimalityEndpointsChunk02 ++
        (problem63MinimalityEndpointsChunk03 ++
          problem63MinimalityEndpointsChunk04)))

theorem problem63HoldsAt_of_mem {a b : Nat}
    (h : (a, b) ∈ problem63MinimalityEndpoints) : Problem63HoldsAt a b := by
  unfold problem63MinimalityEndpoints at h
  rcases List.mem_append.mp h with h0 | h
  · exact problem63HoldsAt_of_mem_chunk00 h0
  rcases List.mem_append.mp h with h1 | h
  · exact problem63HoldsAt_of_mem_chunk01 h1
  rcases List.mem_append.mp h with h2 | h
  · exact problem63HoldsAt_of_mem_chunk02 h2
  rcases List.mem_append.mp h with h3 | h4
  · exact problem63HoldsAt_of_mem_chunk03 h3
  · exact problem63HoldsAt_of_mem_chunk04 h4

end LatticePathOrders
