import LatticePathOrders.GeneratedMinimality_13_11_ClassMerge01_002
import LatticePathOrders.GeneratedMinimality_13_11_ClassChunk012

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_13_11

def classMerge02_001 : ClassTable := .node classMerge01_002 classChunk012

theorem classMerge02_001_valid : ClassTableValid classMerge02_001 := by
  unfold classMerge02_001
  simp only [ClassTableValid]
  exact ⟨classMerge01_002_valid, classChunk012_valid, by decide⟩

end LatticePathOrders.GeneratedMinimality_13_11
