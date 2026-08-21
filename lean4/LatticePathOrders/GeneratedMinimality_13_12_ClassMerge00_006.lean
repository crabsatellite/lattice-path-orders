import LatticePathOrders.GeneratedMinimality_13_12_ClassChunk012
import LatticePathOrders.GeneratedMinimality_13_12_ClassChunk013

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_13_12

def classMerge00_006 : ClassTable := .node classChunk012 classChunk013

theorem classMerge00_006_valid : ClassTableValid classMerge00_006 := by
  unfold classMerge00_006
  simp only [ClassTableValid]
  exact ⟨classChunk012_valid, classChunk013_valid, by decide⟩

end LatticePathOrders.GeneratedMinimality_13_12
