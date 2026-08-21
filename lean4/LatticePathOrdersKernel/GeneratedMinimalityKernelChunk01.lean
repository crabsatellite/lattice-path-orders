import LatticePathOrders.GeneratedMinimality_7_5
import LatticePathOrders.GeneratedMinimality_11_1
import LatticePathOrders.GeneratedMinimality_7_6
import LatticePathOrders.GeneratedMinimality_8_5
import LatticePathOrders.GeneratedMinimality_9_4
import LatticePathOrders.GeneratedMinimality_10_3
import LatticePathOrders.GeneratedMinimality_11_2
import LatticePathOrders.GeneratedMinimality_12_1
import LatticePathOrders.GeneratedMinimality_9_5
import LatticePathOrders.GeneratedMinimality_11_3
import LatticePathOrders.GeneratedMinimality_13_1
import LatticePathOrders.GeneratedMinimality_8_7
import LatticePathOrders.GeneratedMinimality_11_4
import LatticePathOrders.GeneratedMinimality_13_2
import LatticePathOrders.GeneratedMinimality_14_1
import LatticePathOrders.GeneratedMinimality_9_7
import LatticePathOrders.GeneratedMinimality_11_5
import LatticePathOrders.GeneratedMinimality_13_3
import LatticePathOrders.GeneratedMinimality_15_1
import LatticePathOrders.GeneratedMinimality_9_8

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders

def problem63MinimalityEndpointsChunk01 : List (Nat × Nat) := [
  (7, 5),
  (11, 1),
  (7, 6),
  (8, 5),
  (9, 4),
  (10, 3),
  (11, 2),
  (12, 1),
  (9, 5),
  (11, 3),
  (13, 1),
  (8, 7),
  (11, 4),
  (13, 2),
  (14, 1),
  (9, 7),
  (11, 5),
  (13, 3),
  (15, 1),
  (9, 8)
]

theorem problem63HoldsAt_of_mem_chunk01 {a b : Nat}
    (h : (a, b) ∈ problem63MinimalityEndpointsChunk01) : Problem63HoldsAt a b := by
  simp only [problem63MinimalityEndpointsChunk01, List.mem_cons, List.mem_nil_iff,
    or_false, Prod.mk.injEq] at h
  rcases h with ⟨rfl, rfl⟩ | ⟨rfl, rfl⟩ | ⟨rfl, rfl⟩ | ⟨rfl, rfl⟩ | ⟨rfl, rfl⟩ | ⟨rfl, rfl⟩ | ⟨rfl, rfl⟩ | ⟨rfl, rfl⟩ | ⟨rfl, rfl⟩ | ⟨rfl, rfl⟩ | ⟨rfl, rfl⟩ | ⟨rfl, rfl⟩ | ⟨rfl, rfl⟩ | ⟨rfl, rfl⟩ | ⟨rfl, rfl⟩ | ⟨rfl, rfl⟩ | ⟨rfl, rfl⟩ | ⟨rfl, rfl⟩ | ⟨rfl, rfl⟩ | ⟨rfl, rfl⟩
  · exact GeneratedMinimality_7_5.problem63_7_5
  · exact GeneratedMinimality_11_1.problem63_11_1
  · exact GeneratedMinimality_7_6.problem63_7_6
  · exact GeneratedMinimality_8_5.problem63_8_5
  · exact GeneratedMinimality_9_4.problem63_9_4
  · exact GeneratedMinimality_10_3.problem63_10_3
  · exact GeneratedMinimality_11_2.problem63_11_2
  · exact GeneratedMinimality_12_1.problem63_12_1
  · exact GeneratedMinimality_9_5.problem63_9_5
  · exact GeneratedMinimality_11_3.problem63_11_3
  · exact GeneratedMinimality_13_1.problem63_13_1
  · exact GeneratedMinimality_8_7.problem63_8_7
  · exact GeneratedMinimality_11_4.problem63_11_4
  · exact GeneratedMinimality_13_2.problem63_13_2
  · exact GeneratedMinimality_14_1.problem63_14_1
  · exact GeneratedMinimality_9_7.problem63_9_7
  · exact GeneratedMinimality_11_5.problem63_11_5
  · exact GeneratedMinimality_13_3.problem63_13_3
  · exact GeneratedMinimality_15_1.problem63_15_1
  · exact GeneratedMinimality_9_8.problem63_9_8

end LatticePathOrders

