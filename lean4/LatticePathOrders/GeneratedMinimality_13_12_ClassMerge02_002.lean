import LatticePathOrders.GeneratedMinimality_13_12_ClassMerge01_004
import LatticePathOrders.GeneratedMinimality_13_12_ClassMerge01_005

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_13_12

def classMerge02_002 : ClassTable := .node classMerge01_004 classMerge01_005

theorem classMerge02_002_valid : ClassTableValid classMerge02_002 := by
  unfold classMerge02_002
  simp only [ClassTableValid]
  exact ⟨classMerge01_004_valid, classMerge01_005_valid, by decide⟩

end LatticePathOrders.GeneratedMinimality_13_12
