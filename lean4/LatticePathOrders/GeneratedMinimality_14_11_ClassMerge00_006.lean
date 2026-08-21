import LatticePathOrders.GeneratedMinimality_14_11_ClassChunk012
import LatticePathOrders.GeneratedMinimality_14_11_ClassChunk013

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_14_11

def classMerge00_006 : ClassTable := .node classChunk012 classChunk013

theorem classMerge00_006_valid : ClassTableValid classMerge00_006 := by
  unfold classMerge00_006
  simp only [ClassTableValid]
  exact ⟨classChunk012_valid, classChunk013_valid, by decide⟩

end LatticePathOrders.GeneratedMinimality_14_11
