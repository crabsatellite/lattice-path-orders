import LatticePathOrders.GeneratedMinimality_14_11_ClassChunk014
import LatticePathOrders.GeneratedMinimality_14_11_ClassChunk015

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_14_11

def classMerge00_007 : ClassTable := .node classChunk014 classChunk015

theorem classMerge00_007_valid : ClassTableValid classMerge00_007 := by
  unfold classMerge00_007
  simp only [ClassTableValid]
  exact ⟨classChunk014_valid, classChunk015_valid, by decide⟩

end LatticePathOrders.GeneratedMinimality_14_11
