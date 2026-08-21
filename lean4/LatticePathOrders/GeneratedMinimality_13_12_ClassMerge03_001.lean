import LatticePathOrders.GeneratedMinimality_13_12_ClassMerge02_002
import LatticePathOrders.GeneratedMinimality_13_12_ClassMerge00_012

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_13_12

def classMerge03_001 : ClassTable := .node classMerge02_002 classMerge00_012

theorem classMerge03_001_valid : ClassTableValid classMerge03_001 := by
  unfold classMerge03_001
  simp only [ClassTableValid]
  exact ⟨classMerge02_002_valid, classMerge00_012_valid, by decide⟩

end LatticePathOrders.GeneratedMinimality_13_12
