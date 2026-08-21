import LatticePathOrders.GeneratedMinimality_13_12_ClassMerge01_000
import LatticePathOrders.GeneratedMinimality_13_12_ClassMerge01_001

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_13_12

def classMerge02_000 : ClassTable := .node classMerge01_000 classMerge01_001

theorem classMerge02_000_valid : ClassTableValid classMerge02_000 := by
  unfold classMerge02_000
  simp only [ClassTableValid]
  exact ⟨classMerge01_000_valid, classMerge01_001_valid, by decide⟩

end LatticePathOrders.GeneratedMinimality_13_12
