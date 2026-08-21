import LatticePathOrders.GeneratedMinimality_13_12_ClassChunk010
import LatticePathOrders.GeneratedMinimality_13_12_ClassChunk011

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_13_12

def classMerge00_005 : ClassTable := .node classChunk010 classChunk011

theorem classMerge00_005_valid : ClassTableValid classMerge00_005 := by
  unfold classMerge00_005
  simp only [ClassTableValid]
  exact ⟨classChunk010_valid, classChunk011_valid, by decide⟩

end LatticePathOrders.GeneratedMinimality_13_12
