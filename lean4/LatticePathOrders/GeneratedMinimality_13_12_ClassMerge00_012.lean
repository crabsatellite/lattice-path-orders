import LatticePathOrders.GeneratedMinimality_13_12_ClassChunk024
import LatticePathOrders.GeneratedMinimality_13_12_ClassChunk025

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_13_12

def classMerge00_012 : ClassTable := .node classChunk024 classChunk025

theorem classMerge00_012_valid : ClassTableValid classMerge00_012 := by
  unfold classMerge00_012
  simp only [ClassTableValid]
  exact ⟨classChunk024_valid, classChunk025_valid, by decide⟩

end LatticePathOrders.GeneratedMinimality_13_12
