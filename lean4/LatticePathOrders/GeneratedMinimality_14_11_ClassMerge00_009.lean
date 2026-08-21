import LatticePathOrders.GeneratedMinimality_14_11_ClassChunk018
import LatticePathOrders.GeneratedMinimality_14_11_ClassChunk019

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_14_11

def classMerge00_009 : ClassTable := .node classChunk018 classChunk019

theorem classMerge00_009_valid : ClassTableValid classMerge00_009 := by
  unfold classMerge00_009
  simp only [ClassTableValid]
  exact ⟨classChunk018_valid, classChunk019_valid, by decide⟩

end LatticePathOrders.GeneratedMinimality_14_11
