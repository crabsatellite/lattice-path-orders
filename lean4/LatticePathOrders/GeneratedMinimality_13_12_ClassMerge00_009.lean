import LatticePathOrders.GeneratedMinimality_13_12_ClassChunk018
import LatticePathOrders.GeneratedMinimality_13_12_ClassChunk019

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_13_12

def classMerge00_009 : ClassTable := .node classChunk018 classChunk019

theorem classMerge00_009_valid : ClassTableValid classMerge00_009 := by
  unfold classMerge00_009
  simp only [ClassTableValid]
  exact ⟨classChunk018_valid, classChunk019_valid, by decide⟩

end LatticePathOrders.GeneratedMinimality_13_12
