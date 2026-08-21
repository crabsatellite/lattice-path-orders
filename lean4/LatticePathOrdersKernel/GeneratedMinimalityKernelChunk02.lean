import LatticePathOrders.GeneratedMinimality_10_7
import LatticePathOrders.GeneratedMinimality_11_6
import LatticePathOrders.GeneratedMinimality_12_5
import LatticePathOrders.GeneratedMinimality_13_4
import LatticePathOrders.GeneratedMinimality_14_3
import LatticePathOrders.GeneratedMinimality_15_2
import LatticePathOrders.GeneratedMinimality_16_1
import LatticePathOrders.GeneratedMinimality_11_7
import LatticePathOrders.GeneratedMinimality_13_5
import LatticePathOrders.GeneratedMinimality_17_1
import LatticePathOrders.GeneratedMinimality_10_9
import LatticePathOrders.GeneratedMinimality_11_8
import LatticePathOrders.GeneratedMinimality_12_7
import LatticePathOrders.GeneratedMinimality_13_6
import LatticePathOrders.GeneratedMinimality_14_5
import LatticePathOrders.GeneratedMinimality_15_4
import LatticePathOrders.GeneratedMinimality_16_3
import LatticePathOrders.GeneratedMinimality_17_2
import LatticePathOrders.GeneratedMinimality_18_1
import LatticePathOrders.GeneratedMinimality_11_9

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders

def problem63MinimalityEndpointsChunk02 : List (Nat × Nat) := [
  (10, 7),
  (11, 6),
  (12, 5),
  (13, 4),
  (14, 3),
  (15, 2),
  (16, 1),
  (11, 7),
  (13, 5),
  (17, 1),
  (10, 9),
  (11, 8),
  (12, 7),
  (13, 6),
  (14, 5),
  (15, 4),
  (16, 3),
  (17, 2),
  (18, 1),
  (11, 9)
]

theorem problem63HoldsAt_of_mem_chunk02 {a b : Nat}
    (h : (a, b) ∈ problem63MinimalityEndpointsChunk02) : Problem63HoldsAt a b := by
  simp only [problem63MinimalityEndpointsChunk02, List.mem_cons, List.mem_nil_iff,
    or_false, Prod.mk.injEq] at h
  rcases h with ⟨rfl, rfl⟩ | ⟨rfl, rfl⟩ | ⟨rfl, rfl⟩ | ⟨rfl, rfl⟩ | ⟨rfl, rfl⟩ | ⟨rfl, rfl⟩ | ⟨rfl, rfl⟩ | ⟨rfl, rfl⟩ | ⟨rfl, rfl⟩ | ⟨rfl, rfl⟩ | ⟨rfl, rfl⟩ | ⟨rfl, rfl⟩ | ⟨rfl, rfl⟩ | ⟨rfl, rfl⟩ | ⟨rfl, rfl⟩ | ⟨rfl, rfl⟩ | ⟨rfl, rfl⟩ | ⟨rfl, rfl⟩ | ⟨rfl, rfl⟩ | ⟨rfl, rfl⟩
  · exact GeneratedMinimality_10_7.problem63_10_7
  · exact GeneratedMinimality_11_6.problem63_11_6
  · exact GeneratedMinimality_12_5.problem63_12_5
  · exact GeneratedMinimality_13_4.problem63_13_4
  · exact GeneratedMinimality_14_3.problem63_14_3
  · exact GeneratedMinimality_15_2.problem63_15_2
  · exact GeneratedMinimality_16_1.problem63_16_1
  · exact GeneratedMinimality_11_7.problem63_11_7
  · exact GeneratedMinimality_13_5.problem63_13_5
  · exact GeneratedMinimality_17_1.problem63_17_1
  · exact GeneratedMinimality_10_9.problem63_10_9
  · exact GeneratedMinimality_11_8.problem63_11_8
  · exact GeneratedMinimality_12_7.problem63_12_7
  · exact GeneratedMinimality_13_6.problem63_13_6
  · exact GeneratedMinimality_14_5.problem63_14_5
  · exact GeneratedMinimality_15_4.problem63_15_4
  · exact GeneratedMinimality_16_3.problem63_16_3
  · exact GeneratedMinimality_17_2.problem63_17_2
  · exact GeneratedMinimality_18_1.problem63_18_1
  · exact GeneratedMinimality_11_9.problem63_11_9

end LatticePathOrders

