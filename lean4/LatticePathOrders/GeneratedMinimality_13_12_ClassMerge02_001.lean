import LatticePathOrders.GeneratedMinimality_13_12_ClassMerge01_002
import LatticePathOrders.GeneratedMinimality_13_12_ClassMerge01_003

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_13_12

def classMerge02_001 : ClassTable := .node classMerge01_002 classMerge01_003

theorem classMerge02_001_valid : ClassTableValid classMerge02_001 := by
  unfold classMerge02_001
  simp only [ClassTableValid]
  exact ⟨classMerge01_002_valid, classMerge01_003_valid, by decide⟩

end LatticePathOrders.GeneratedMinimality_13_12
