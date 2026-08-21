import LatticePathOrders.GeneratedMinimality_2_1
import LatticePathOrders.GeneratedMinimality_3_1
import LatticePathOrders.GeneratedMinimality_3_2
import LatticePathOrders.GeneratedMinimality_4_1
import LatticePathOrders.GeneratedMinimality_5_1
import LatticePathOrders.GeneratedMinimality_4_3
import LatticePathOrders.GeneratedMinimality_5_2
import LatticePathOrders.GeneratedMinimality_6_1
import LatticePathOrders.GeneratedMinimality_5_3
import LatticePathOrders.GeneratedMinimality_7_1
import LatticePathOrders.GeneratedMinimality_5_4
import LatticePathOrders.GeneratedMinimality_7_2
import LatticePathOrders.GeneratedMinimality_8_1
import LatticePathOrders.GeneratedMinimality_7_3
import LatticePathOrders.GeneratedMinimality_9_1
import LatticePathOrders.GeneratedMinimality_6_5
import LatticePathOrders.GeneratedMinimality_7_4
import LatticePathOrders.GeneratedMinimality_8_3
import LatticePathOrders.GeneratedMinimality_9_2
import LatticePathOrders.GeneratedMinimality_10_1

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders

def problem63MinimalityEndpointsChunk00 : List (Nat × Nat) := [
  (2, 1),
  (3, 1),
  (3, 2),
  (4, 1),
  (5, 1),
  (4, 3),
  (5, 2),
  (6, 1),
  (5, 3),
  (7, 1),
  (5, 4),
  (7, 2),
  (8, 1),
  (7, 3),
  (9, 1),
  (6, 5),
  (7, 4),
  (8, 3),
  (9, 2),
  (10, 1)
]

theorem problem63HoldsAt_of_mem_chunk00 {a b : Nat}
    (h : (a, b) ∈ problem63MinimalityEndpointsChunk00) : Problem63HoldsAt a b := by
  simp only [problem63MinimalityEndpointsChunk00, List.mem_cons, List.mem_nil_iff,
    or_false, Prod.mk.injEq] at h
  rcases h with ⟨rfl, rfl⟩ | ⟨rfl, rfl⟩ | ⟨rfl, rfl⟩ | ⟨rfl, rfl⟩ | ⟨rfl, rfl⟩ | ⟨rfl, rfl⟩ | ⟨rfl, rfl⟩ | ⟨rfl, rfl⟩ | ⟨rfl, rfl⟩ | ⟨rfl, rfl⟩ | ⟨rfl, rfl⟩ | ⟨rfl, rfl⟩ | ⟨rfl, rfl⟩ | ⟨rfl, rfl⟩ | ⟨rfl, rfl⟩ | ⟨rfl, rfl⟩ | ⟨rfl, rfl⟩ | ⟨rfl, rfl⟩ | ⟨rfl, rfl⟩ | ⟨rfl, rfl⟩
  · exact GeneratedMinimality_2_1.problem63_2_1
  · exact GeneratedMinimality_3_1.problem63_3_1
  · exact GeneratedMinimality_3_2.problem63_3_2
  · exact GeneratedMinimality_4_1.problem63_4_1
  · exact GeneratedMinimality_5_1.problem63_5_1
  · exact GeneratedMinimality_4_3.problem63_4_3
  · exact GeneratedMinimality_5_2.problem63_5_2
  · exact GeneratedMinimality_6_1.problem63_6_1
  · exact GeneratedMinimality_5_3.problem63_5_3
  · exact GeneratedMinimality_7_1.problem63_7_1
  · exact GeneratedMinimality_5_4.problem63_5_4
  · exact GeneratedMinimality_7_2.problem63_7_2
  · exact GeneratedMinimality_8_1.problem63_8_1
  · exact GeneratedMinimality_7_3.problem63_7_3
  · exact GeneratedMinimality_9_1.problem63_9_1
  · exact GeneratedMinimality_6_5.problem63_6_5
  · exact GeneratedMinimality_7_4.problem63_7_4
  · exact GeneratedMinimality_8_3.problem63_8_3
  · exact GeneratedMinimality_9_2.problem63_9_2
  · exact GeneratedMinimality_10_1.problem63_10_1

end LatticePathOrders

