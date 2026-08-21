import LatticePathOrders.GeneratedMinimality_14_11_ClassMerge03_000
import LatticePathOrders.GeneratedMinimality_14_11_ClassMerge02_002

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_14_11

def classMerge04_000 : ClassTable := .node classMerge03_000 classMerge02_002

theorem classMerge04_000_valid : ClassTableValid classMerge04_000 := by
  unfold classMerge04_000
  simp only [ClassTableValid]
  exact ⟨classMerge03_000_valid, classMerge02_002_valid, by decide⟩

end LatticePathOrders.GeneratedMinimality_14_11
