import LatticePathOrders.GeneratedMinimality_14_11_ClassChunk020
import LatticePathOrders.GeneratedMinimality_14_11_ClassChunk021

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_14_11

def classMerge00_010 : ClassTable := .node classChunk020 classChunk021

theorem classMerge00_010_valid : ClassTableValid classMerge00_010 := by
  unfold classMerge00_010
  simp only [ClassTableValid]
  exact ⟨classChunk020_valid, classChunk021_valid, by decide⟩

end LatticePathOrders.GeneratedMinimality_14_11
