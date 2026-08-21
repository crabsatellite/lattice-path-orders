import LatticePathOrders.GeneratedMinimality_13_7
import LatticePathOrders.GeneratedMinimality_17_3
import LatticePathOrders.GeneratedMinimality_19_1
import LatticePathOrders.GeneratedMinimality_11_10
import LatticePathOrders.GeneratedMinimality_13_8
import LatticePathOrders.GeneratedMinimality_16_5
import LatticePathOrders.GeneratedMinimality_17_4
import LatticePathOrders.GeneratedMinimality_19_2
import LatticePathOrders.GeneratedMinimality_20_1
import LatticePathOrders.GeneratedMinimality_13_9
import LatticePathOrders.GeneratedMinimality_15_7
import LatticePathOrders.GeneratedMinimality_17_5
import LatticePathOrders.GeneratedMinimality_19_3
import LatticePathOrders.GeneratedMinimality_21_1
import LatticePathOrders.GeneratedMinimality_12_11
import LatticePathOrders.GeneratedMinimality_13_10
import LatticePathOrders.GeneratedMinimality_14_9
import LatticePathOrders.GeneratedMinimality_15_8
import LatticePathOrders.GeneratedMinimality_16_7
import LatticePathOrders.GeneratedMinimality_17_6

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders

def problem63MinimalityEndpointsChunk03 : List (Nat × Nat) := [
  (13, 7),
  (17, 3),
  (19, 1),
  (11, 10),
  (13, 8),
  (16, 5),
  (17, 4),
  (19, 2),
  (20, 1),
  (13, 9),
  (15, 7),
  (17, 5),
  (19, 3),
  (21, 1),
  (12, 11),
  (13, 10),
  (14, 9),
  (15, 8),
  (16, 7),
  (17, 6)
]

theorem problem63HoldsAt_of_mem_chunk03 {a b : Nat}
    (h : (a, b) ∈ problem63MinimalityEndpointsChunk03) : Problem63HoldsAt a b := by
  simp only [problem63MinimalityEndpointsChunk03, List.mem_cons, List.mem_nil_iff,
    or_false, Prod.mk.injEq] at h
  rcases h with ⟨rfl, rfl⟩ | ⟨rfl, rfl⟩ | ⟨rfl, rfl⟩ | ⟨rfl, rfl⟩ | ⟨rfl, rfl⟩ | ⟨rfl, rfl⟩ | ⟨rfl, rfl⟩ | ⟨rfl, rfl⟩ | ⟨rfl, rfl⟩ | ⟨rfl, rfl⟩ | ⟨rfl, rfl⟩ | ⟨rfl, rfl⟩ | ⟨rfl, rfl⟩ | ⟨rfl, rfl⟩ | ⟨rfl, rfl⟩ | ⟨rfl, rfl⟩ | ⟨rfl, rfl⟩ | ⟨rfl, rfl⟩ | ⟨rfl, rfl⟩ | ⟨rfl, rfl⟩
  · exact GeneratedMinimality_13_7.problem63_13_7
  · exact GeneratedMinimality_17_3.problem63_17_3
  · exact GeneratedMinimality_19_1.problem63_19_1
  · exact GeneratedMinimality_11_10.problem63_11_10
  · exact GeneratedMinimality_13_8.problem63_13_8
  · exact GeneratedMinimality_16_5.problem63_16_5
  · exact GeneratedMinimality_17_4.problem63_17_4
  · exact GeneratedMinimality_19_2.problem63_19_2
  · exact GeneratedMinimality_20_1.problem63_20_1
  · exact GeneratedMinimality_13_9.problem63_13_9
  · exact GeneratedMinimality_15_7.problem63_15_7
  · exact GeneratedMinimality_17_5.problem63_17_5
  · exact GeneratedMinimality_19_3.problem63_19_3
  · exact GeneratedMinimality_21_1.problem63_21_1
  · exact GeneratedMinimality_12_11.problem63_12_11
  · exact GeneratedMinimality_13_10.problem63_13_10
  · exact GeneratedMinimality_14_9.problem63_14_9
  · exact GeneratedMinimality_15_8.problem63_15_8
  · exact GeneratedMinimality_16_7.problem63_16_7
  · exact GeneratedMinimality_17_6.problem63_17_6

end LatticePathOrders

