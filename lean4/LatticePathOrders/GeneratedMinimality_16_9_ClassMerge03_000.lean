import LatticePathOrders.GeneratedMinimality_16_9_ClassMerge02_000
import LatticePathOrders.GeneratedMinimality_16_9_ClassMerge01_002

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_16_9

def classMerge03_000 : ClassTable := .node classMerge02_000 classMerge01_002

theorem classMerge03_000_valid : ClassTableValid classMerge03_000 := by
  unfold classMerge03_000
  simp only [ClassTableValid]
  exact ⟨classMerge02_000_valid, classMerge01_002_valid, by decide⟩

end LatticePathOrders.GeneratedMinimality_16_9
