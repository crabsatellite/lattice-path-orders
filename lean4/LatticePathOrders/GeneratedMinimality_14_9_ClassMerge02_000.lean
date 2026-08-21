import LatticePathOrders.GeneratedMinimality_14_9_ClassMerge01_000
import LatticePathOrders.GeneratedMinimality_14_9_ClassChunk004

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_14_9

def classMerge02_000 : ClassTable := .node classMerge01_000 classChunk004

theorem classMerge02_000_valid : ClassTableValid classMerge02_000 := by
  unfold classMerge02_000
  simp only [ClassTableValid]
  exact ⟨classMerge01_000_valid, classChunk004_valid, by decide⟩

end LatticePathOrders.GeneratedMinimality_14_9
