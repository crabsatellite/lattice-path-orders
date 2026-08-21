import LatticePathOrders.GeneratedMinimality_13_11_ClassChunk008
import LatticePathOrders.GeneratedMinimality_13_11_ClassChunk009

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_13_11

def classMerge00_004 : ClassTable := .node classChunk008 classChunk009

theorem classMerge00_004_valid : ClassTableValid classMerge00_004 := by
  unfold classMerge00_004
  simp only [ClassTableValid]
  exact ⟨classChunk008_valid, classChunk009_valid, by decide⟩

end LatticePathOrders.GeneratedMinimality_13_11
