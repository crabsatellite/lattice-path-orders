import LatticePathOrders.GeneratedMinimality_18_5
import LatticePathOrders.GeneratedMinimality_19_4
import LatticePathOrders.GeneratedMinimality_20_3
import LatticePathOrders.GeneratedMinimality_21_2
import LatticePathOrders.GeneratedMinimality_22_1
import LatticePathOrders.GeneratedMinimality_13_11
import LatticePathOrders.GeneratedMinimality_17_7
import LatticePathOrders.GeneratedMinimality_19_5
import LatticePathOrders.GeneratedMinimality_23_1
import LatticePathOrders.GeneratedMinimality_13_12
import LatticePathOrders.GeneratedMinimality_14_11
import LatticePathOrders.GeneratedMinimality_16_9
import LatticePathOrders.GeneratedMinimality_17_8
import LatticePathOrders.GeneratedMinimality_18_7
import LatticePathOrders.GeneratedMinimality_19_6
import LatticePathOrders.GeneratedMinimality_21_4
import LatticePathOrders.GeneratedMinimality_22_3
import LatticePathOrders.GeneratedMinimality_23_2
import LatticePathOrders.GeneratedMinimality_24_1

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders

def problem63MinimalityEndpointsChunk04 : List (Nat × Nat) := [
  (18, 5),
  (19, 4),
  (20, 3),
  (21, 2),
  (22, 1),
  (13, 11),
  (17, 7),
  (19, 5),
  (23, 1),
  (13, 12),
  (14, 11),
  (16, 9),
  (17, 8),
  (18, 7),
  (19, 6),
  (21, 4),
  (22, 3),
  (23, 2),
  (24, 1)
]

theorem problem63HoldsAt_of_mem_chunk04 {a b : Nat}
    (h : (a, b) ∈ problem63MinimalityEndpointsChunk04) : Problem63HoldsAt a b := by
  simp only [problem63MinimalityEndpointsChunk04, List.mem_cons, List.mem_nil_iff,
    or_false, Prod.mk.injEq] at h
  rcases h with ⟨rfl, rfl⟩ | ⟨rfl, rfl⟩ | ⟨rfl, rfl⟩ | ⟨rfl, rfl⟩ | ⟨rfl, rfl⟩ | ⟨rfl, rfl⟩ | ⟨rfl, rfl⟩ | ⟨rfl, rfl⟩ | ⟨rfl, rfl⟩ | ⟨rfl, rfl⟩ | ⟨rfl, rfl⟩ | ⟨rfl, rfl⟩ | ⟨rfl, rfl⟩ | ⟨rfl, rfl⟩ | ⟨rfl, rfl⟩ | ⟨rfl, rfl⟩ | ⟨rfl, rfl⟩ | ⟨rfl, rfl⟩ | ⟨rfl, rfl⟩
  · exact GeneratedMinimality_18_5.problem63_18_5
  · exact GeneratedMinimality_19_4.problem63_19_4
  · exact GeneratedMinimality_20_3.problem63_20_3
  · exact GeneratedMinimality_21_2.problem63_21_2
  · exact GeneratedMinimality_22_1.problem63_22_1
  · exact GeneratedMinimality_13_11.problem63_13_11
  · exact GeneratedMinimality_17_7.problem63_17_7
  · exact GeneratedMinimality_19_5.problem63_19_5
  · exact GeneratedMinimality_23_1.problem63_23_1
  · exact GeneratedMinimality_13_12.problem63_13_12
  · exact GeneratedMinimality_14_11.problem63_14_11
  · exact GeneratedMinimality_16_9.problem63_16_9
  · exact GeneratedMinimality_17_8.problem63_17_8
  · exact GeneratedMinimality_18_7.problem63_18_7
  · exact GeneratedMinimality_19_6.problem63_19_6
  · exact GeneratedMinimality_21_4.problem63_21_4
  · exact GeneratedMinimality_22_3.problem63_22_3
  · exact GeneratedMinimality_23_2.problem63_23_2
  · exact GeneratedMinimality_24_1.problem63_24_1

end LatticePathOrders

