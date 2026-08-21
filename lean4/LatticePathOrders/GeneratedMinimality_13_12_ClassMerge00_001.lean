import LatticePathOrders.GeneratedMinimality_13_12_ClassChunk002
import LatticePathOrders.GeneratedMinimality_13_12_ClassChunk003

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_13_12

def classMerge00_001 : ClassTable := .node classChunk002 classChunk003

theorem classMerge00_001_valid : ClassTableValid classMerge00_001 := by
  unfold classMerge00_001
  simp only [ClassTableValid]
  exact ⟨classChunk002_valid, classChunk003_valid, by decide⟩

end LatticePathOrders.GeneratedMinimality_13_12
