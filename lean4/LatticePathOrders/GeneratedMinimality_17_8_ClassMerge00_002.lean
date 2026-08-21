import LatticePathOrders.GeneratedMinimality_17_8_ClassChunk004
import LatticePathOrders.GeneratedMinimality_17_8_ClassChunk005

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_17_8

def classMerge00_002 : ClassTable := .node classChunk004 classChunk005

theorem classMerge00_002_valid : ClassTableValid classMerge00_002 := by
  unfold classMerge00_002
  simp only [ClassTableValid]
  exact ⟨classChunk004_valid, classChunk005_valid, by decide⟩

end LatticePathOrders.GeneratedMinimality_17_8
