import LatticePathOrders.GeneratedMinimality_13_12_ClassChunk022
import LatticePathOrders.GeneratedMinimality_13_12_ClassChunk023

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_13_12

def classMerge00_011 : ClassTable := .node classChunk022 classChunk023

theorem classMerge00_011_valid : ClassTableValid classMerge00_011 := by
  unfold classMerge00_011
  simp only [ClassTableValid]
  exact ⟨classChunk022_valid, classChunk023_valid, by decide⟩

end LatticePathOrders.GeneratedMinimality_13_12
