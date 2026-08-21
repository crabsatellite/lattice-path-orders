import LatticePathOrders.GeneratedMinimality_13_11_ClassChunk006
import LatticePathOrders.GeneratedMinimality_13_11_ClassChunk007

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_13_11

def classMerge00_003 : ClassTable := .node classChunk006 classChunk007

theorem classMerge00_003_valid : ClassTableValid classMerge00_003 := by
  unfold classMerge00_003
  simp only [ClassTableValid]
  exact ⟨classChunk006_valid, classChunk007_valid, by decide⟩

end LatticePathOrders.GeneratedMinimality_13_11
