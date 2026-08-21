import LatticePathOrders.GeneratedMinimality_13_10_ClassMerge00_002
import LatticePathOrders.GeneratedMinimality_13_10_ClassChunk006

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_13_10

def classMerge01_001 : ClassTable := .node classMerge00_002 classChunk006

theorem classMerge01_001_valid : ClassTableValid classMerge01_001 := by
  unfold classMerge01_001
  simp only [ClassTableValid]
  exact ⟨classMerge00_002_valid, classChunk006_valid, by decide⟩

end LatticePathOrders.GeneratedMinimality_13_10
