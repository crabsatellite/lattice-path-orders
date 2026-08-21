import LatticePathOrders.GeneratedMinimality_13_12_ClassChunk016
import LatticePathOrders.GeneratedMinimality_13_12_ClassChunk017

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_13_12

def classMerge00_008 : ClassTable := .node classChunk016 classChunk017

theorem classMerge00_008_valid : ClassTableValid classMerge00_008 := by
  unfold classMerge00_008
  simp only [ClassTableValid]
  exact ⟨classChunk016_valid, classChunk017_valid, by decide⟩

end LatticePathOrders.GeneratedMinimality_13_12
