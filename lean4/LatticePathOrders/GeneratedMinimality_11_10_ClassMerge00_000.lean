import LatticePathOrders.GeneratedMinimality_11_10_ClassChunk000
import LatticePathOrders.GeneratedMinimality_11_10_ClassChunk001

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_11_10

def classMerge00_000 : ClassTable := .node classChunk000 classChunk001

theorem classMerge00_000_valid : ClassTableValid classMerge00_000 := by
  unfold classMerge00_000
  simp only [ClassTableValid]
  exact ⟨classChunk000_valid, classChunk001_valid, by decide⟩

end LatticePathOrders.GeneratedMinimality_11_10
