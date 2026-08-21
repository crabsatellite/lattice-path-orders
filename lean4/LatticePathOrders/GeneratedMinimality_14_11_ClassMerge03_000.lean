import LatticePathOrders.GeneratedMinimality_14_11_ClassMerge02_000
import LatticePathOrders.GeneratedMinimality_14_11_ClassMerge02_001

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_14_11

def classMerge03_000 : ClassTable := .node classMerge02_000 classMerge02_001

theorem classMerge03_000_valid : ClassTableValid classMerge03_000 := by
  unfold classMerge03_000
  simp only [ClassTableValid]
  exact ⟨classMerge02_000_valid, classMerge02_001_valid, by decide⟩

end LatticePathOrders.GeneratedMinimality_14_11
