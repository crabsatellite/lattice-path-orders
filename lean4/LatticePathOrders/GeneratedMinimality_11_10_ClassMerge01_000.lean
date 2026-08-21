import LatticePathOrders.GeneratedMinimality_11_10_ClassMerge00_000
import LatticePathOrders.GeneratedMinimality_11_10_ClassChunk002

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_11_10

def classMerge01_000 : ClassTable := .node classMerge00_000 classChunk002

theorem classMerge01_000_valid : ClassTableValid classMerge01_000 := by
  unfold classMerge01_000
  simp only [ClassTableValid]
  exact ⟨classMerge00_000_valid, classChunk002_valid, by decide⟩

end LatticePathOrders.GeneratedMinimality_11_10
