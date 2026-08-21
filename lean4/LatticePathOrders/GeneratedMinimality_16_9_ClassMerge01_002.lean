import LatticePathOrders.GeneratedMinimality_16_9_ClassMerge00_004
import LatticePathOrders.GeneratedMinimality_16_9_ClassChunk010

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_16_9

def classMerge01_002 : ClassTable := .node classMerge00_004 classChunk010

theorem classMerge01_002_valid : ClassTableValid classMerge01_002 := by
  unfold classMerge01_002
  simp only [ClassTableValid]
  exact ⟨classMerge00_004_valid, classChunk010_valid, by decide⟩

end LatticePathOrders.GeneratedMinimality_16_9
