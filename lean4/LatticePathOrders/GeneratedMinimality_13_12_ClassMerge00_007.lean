import LatticePathOrders.GeneratedMinimality_13_12_ClassChunk014
import LatticePathOrders.GeneratedMinimality_13_12_ClassChunk015

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_13_12

def classMerge00_007 : ClassTable := .node classChunk014 classChunk015

theorem classMerge00_007_valid : ClassTableValid classMerge00_007 := by
  unfold classMerge00_007
  simp only [ClassTableValid]
  exact ⟨classChunk014_valid, classChunk015_valid, by decide⟩

end LatticePathOrders.GeneratedMinimality_13_12
